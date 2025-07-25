" Global variable to track the tmux pane ID
let g:tmux_shell_pane = ""

" Cell delimiter pattern (matches # %%, -- %%, In[n], or ```)
let g:tmux_cell_delimiter = "^\\(\\s*\\(\\#\\|--\\) \\(%%\\|In\\[\\d\\+\\]\\)\\|```\\)"

" Set up syntax highlighting for cell delimiters
function! s:SetupCellSyntax()
    " Define syntax match for cell delimiters - match entire line
    syntax match TmuxCellDelimiter /^\s*\(#\|--\) \(%%\|In\[\d\+\]\).*$/

    " Define highlight group - make it stand out with underline
    highlight default TmuxCellDelimiter guifg=#fe8019 guibg=NONE gui=bold,underline
endfunction

" Apply syntax highlighting when entering buffers
augroup TmuxCellSyntax
    autocmd!
    autocmd BufEnter,BufRead * call s:SetupCellSyntax()
augroup END

" Function to check if we're running in tmux
function! s:InTmux()
    return !empty($TMUX)
endfunction

" Function to get or create a shell pane
function! s:GetShellPane()
    " If we already have a pane, check if it still exists
    if !empty(g:tmux_shell_pane)
        let pane_exists = system('tmux list-panes -F "#{pane_id}" | grep -q "' . g:tmux_shell_pane . '"')
        if v:shell_error == 0
            return g:tmux_shell_pane
        else
            " Pane no longer exists, clear the variable
            let g:tmux_shell_pane = ""
        endif
    endif

    " Create a new pane below the current one
    let pane_id = system('tmux split-window -d -p 30 -P -F "#{pane_id}"')
    let g:tmux_shell_pane = substitute(pane_id, '\n', '', 'g')
    return g:tmux_shell_pane
endfunction

" Function to check if the process in the tmux pane is ipython
function! s:IsIpython()
    if empty(g:tmux_shell_pane)
        return 0
    endif

    " Get the shell PID from tmux
    let shell_pid = system('tmux display-message -t ' . g:tmux_shell_pane . ' -p "#{pane_pid}"')
    let shell_pid = substitute(shell_pid, '\n', '', 'g')

    " Look for child processes of the shell that contain 'ipython'
    let child_processes = system('pgrep -P ' . shell_pid . ' 2>/dev/null')
    
    if v:shell_error == 0 && !empty(child_processes)
        " Check each child process
        for child_pid in split(child_processes, '\n')
            if !empty(child_pid)
                let cmdline = system('ps -p ' . child_pid . ' -o args= 2>/dev/null')
                let cmdline = substitute(cmdline, '\n', '', 'g')
                if cmdline =~# 'ipython'
                    return 1
                endif
            endif
        endfor
    endif

    return 0
endfunction

" Function to send command to shell pane
function! s:SendToShell(args, bang) range
    if !s:InTmux()
        echoerr "Error: Vim is not running in tmux"
        return
    endif

    let pane_id = s:GetShellPane()
    if empty(pane_id)
        echoerr "Error: Could not create or find tmux pane"
        return
    endif

    " Parse arguments and expand % syntax
    let args = a:args
    let bang = a:bang

    " Determine what to send based on arguments and range
    if !empty(args)
        " Command arguments provided - handle escaped % and expand % syntax
        " First, manually expand unescaped % to current filename
        let command = substitute(args, '\\\@<!%', expand('%'), 'g')
        " Then, replace escaped \% with literal %
        let command = substitute(command, '\\%', '%', 'g')
        let lines = [command]
    elseif a:firstline != a:lastline
        " Range provided, send selected lines
        let lines = getline(a:firstline, a:lastline)
    else
        " No command or range, use current line
        let lines = [getline('.')]
    endif

    " Use the helper function to send lines
    call s:SendToShellLines(lines, bang)
endfunction

" Close the pane and clear the variable when vim exits
autocmd VimLeave * call s:CleanupShellPane()

" Function to cleanup the shell pane on exit
function! s:CleanupShellPane()
    if !empty(g:tmux_shell_pane)
        call system('tmux kill-pane -t ' . g:tmux_shell_pane)
        let g:tmux_shell_pane = ""
    endif
endfunction

" Operator function for motion support
function! s:SendOperator(type) range
    let saved_unnamed_register = @@

    if a:type ==# 'v'
        " Visual selection
        normal! `<v`>y
    elseif a:type ==# 'char'
        " Character-wise motion
        normal! `[v`]y
    else
        " Line-wise motion
        normal! '[V']y
    endif

    let lines = split(@@, '\n')
    let @@ = saved_unnamed_register

    " Send the yanked text
    call s:SendToShellLines(lines, 0)
endfunction

" Helper function to send lines (extracted from s:SendToShell)
function! s:SendToShellLines(lines, bang)
    if !s:InTmux()
        echoerr "Error: Vim is not running in tmux"
        return
    endif

    let pane_id = s:GetShellPane()
    if empty(pane_id)
        echoerr "Error: Could not create or find tmux pane"
        return
    endif

    " Send the lines to the pane
    if a:bang
        " Bang modifier: use %cpaste for ipython (only if ipython is running)
        if s:IsIpython()
            call system('tmux send-keys -t ' . pane_id . ' "%cpaste -q" Enter')
            for line in a:lines
                call system('tmux send-keys -t ' . pane_id . ' ' . shellescape(line) . ' Enter')
            endfor
            call system('tmux send-keys -t ' . pane_id . ' C-d')
        else
            echoerr "Error: Bang modifier requires ipython to be running in the tmux pane"
            return
        endif
    else
        " Normal mode: join lines and send as one command
        let cmd_to_send = join(a:lines, "\n")
        call system('tmux send-keys -t ' . pane_id . ' ' . shellescape(cmd_to_send) . ' Enter')
    endif
endfunction

" Define the S command
command! -bang -range -complete=file_in_path -nargs=* S <line1>,<line2>call s:SendToShell(<q-args>, <bang>0)

" Function to find cell boundaries
function! s:FindCellBoundaries()
    let current_line = line('.')
    let last_line = line('$')

    " Find start of current cell (search backwards)
    let start_line = current_line
    for line_num in range(current_line - 1, 1, -1)
        if getline(line_num) =~# g:tmux_cell_delimiter
            let start_line = line_num + 1
            break
        endif
        if line_num == 1
            let start_line = 1
        endif
    endfor

    " Find end of current cell (search forwards)
    let end_line = last_line
    for line_num in range(current_line + 1, last_line)
        if getline(line_num) =~# g:tmux_cell_delimiter
            let end_line = line_num - 1
            break
        endif
    endfor

    return [start_line, end_line]
endfunction

" Function to jump to the next cell
function! s:JumpToNextCell()
    let current_line = line('.')
    let last_line = line('$')

    " Search for the next cell delimiter
    for line_num in range(current_line + 1, last_line)
        if getline(line_num) =~# g:tmux_cell_delimiter
            " Move cursor to the line after the delimiter
            call cursor(line_num + 1, 1)
            return
        endif
    endfor

    " If no next cell found, stay at current position
endfunction

" Function to send current cell
function! s:SendCell()
    let [start_line, end_line] = s:FindCellBoundaries()
    let lines = getline(start_line, end_line)
    call s:SendToShellLines(lines, 1)

    " Jump to the next cell
    call s:JumpToNextCell()
endfunction

" Set up operator mapping
nnoremap <silent> <C-c> :set operatorfunc=<SID>SendOperator<CR>g@
vnoremap <silent> <C-c> :<C-u>call <SID>SendOperator(visualmode())<CR>

" Add cell motion mapping
nnoremap <silent> <C-c><C-c> :call <SID>SendCell()<CR>
