
" Custom fold text
function! MyFoldText()
    let line = getline(v:foldstart)
    let foldedlinecount = v:foldend - v:foldstart + 1
    return ' >  '. foldedlinecount . '  ' . line
endfunction

" Use this function to diagnose bad syntax
function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

" Use this to debug long outputs (e.g. :call Exec('scriptnames'))
function! Exec(cmd)
    redir @a
        exec printf('silent %s',a:cmd)
    redir END
    " tabnew
    norm "ap
endfunction

" terminal command shortcuts
cabbrev term <C-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'split term://bash' : 'term')<CR>
cabbrev vterm <C-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vsplit term://bash' : 'vterm')<CR>

" File directory
cnoreabbrev fd %:p:h

" Force sudo save
cnoreabbrev w!! <C-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'w sudo tee > /dev/null %<CR>' : 'w!!')

" Typos
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
