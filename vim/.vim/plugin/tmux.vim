" Global variable to track the tmux pane ID
let g:tmux_shell_pane = ""

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

" Function to send command to shell pane
function! s:SendToShell(command, bang) range
    if !s:InTmux()
        echoerr "Error: Vim is not running in tmux"
        return
    endif
    
    let pane_id = s:GetShellPane()
    if empty(pane_id)
        echoerr "Error: Could not create or find tmux pane"
        return
    endif
    
    " Determine what to send based on arguments and range
    if !empty(a:command)
        " Command argument provided
        let lines = [a:command]
    elseif a:firstline != a:lastline
        " Range provided, send selected lines
        let lines = getline(a:firstline, a:lastline)
    else
        " No command or range, use current line
        let lines = [getline('.')]
    endif
    
    " Send the lines to the pane
    if a:bang && len(lines) > 1
        " Bang modifier: send multi-line input for ipython
        for i in range(len(lines))
            if i < len(lines) - 1
                " All lines except the last get C-o Enter
                call system('tmux send-keys -t ' . pane_id . ' ' . shellescape(lines[i]) . ' C-o Enter')
            else
                " Last line gets double Enter
                call system('tmux send-keys -t ' . pane_id . ' ' . shellescape(lines[i]) . ' Enter Enter')
            endif
        endfor
    else
        " Normal mode: join lines and send as one command
        let cmd_to_send = join(lines, "\n")
        call system('tmux send-keys -t ' . pane_id . ' ' . shellescape(cmd_to_send) . ' Enter')
    endif
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

" Define the S command
command! -bang -range -nargs=* S <line1>,<line2>call s:SendToShell(<q-args>, <bang>0)
