command! -bang -range PyScrap call PyScrapFunction(<bang>0, <line1>, <line2>)

function! PyScrapFunction(bang, line1, line2)
    " Get the selected lines from the current buffer before switching
    let selected_lines = []
    if a:line1 != a:line2 || a:line1 != line('.')
        let selected_lines = getline(a:line1, a:line2)
    endif

    let filename = getcwd() . '/scrap/scratch_'. strftime("%Y-%m-%d-%H%M"). '.py'
    exec (a:bang ? 'edit' : 'split') . ' ' . filename

    " If we have selected lines, copy them to the new file
    if len(selected_lines) > 0
        call setline(1, selected_lines)
    endif
endfunction
