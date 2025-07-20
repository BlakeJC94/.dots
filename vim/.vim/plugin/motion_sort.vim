function! SortLines(type, ...)
    let marks = a:type ==? 'vis' ? '<>' : '[]'
    let [_, l1, c1, _] = getpos("'" . marks[0])
    let [_, l2, c2, _] = getpos("'" . marks[1])
    execute l1 . ',' . l2 . 'sort'
endfunction

nnoremap <silent> gs :set opfunc=SortLines<CR>g@
vnoremap <silent> gs :<C-u>call SortLines('vis')<CR>
