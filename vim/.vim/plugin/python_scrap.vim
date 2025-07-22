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

function! PyScrapOperator(type)
    let saved_unnamed_register = @@

    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[v`]y
    elseif a:type ==# 'line'
        normal! '[V']y
    else
        return
    endif

    let selected_text = split(@@, '\n')
    let @@ = saved_unnamed_register

    let filename = getcwd() . '/scrap/scratch_'. strftime("%Y-%m-%d-%H%M"). '.py'
    exec 'split ' . filename

    if len(selected_text) > 0
        call setline(1, selected_text)
    endif
endfunction

nnoremap <silent> <Plug>PyScrapOperator :set opfunc=PyScrapOperator<CR>g@
vnoremap <silent> <Plug>PyScrapOperator :<C-U>call PyScrapOperator(visualmode())<CR>
