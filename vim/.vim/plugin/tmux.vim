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
function! s:SendToShell(command)
    if !s:InTmux()
        echoerr "Error: Vim is not running in tmux"
        return
    endif
    
    let pane_id = s:GetShellPane()
    if empty(pane_id)
        echoerr "Error: Could not create or find tmux pane"
        return
    endif
    
    " Send the command to the pane
    call system('tmux send-keys -t ' . pane_id . ' ' . shellescape(a:command) . ' Enter')
endfunction

" Clear the pane variable when vim exits
autocmd VimLeave * let g:tmux_shell_pane = ""

" Define the Shell command
command! -nargs=+ Shell call s:SendToShell(<q-args>)
