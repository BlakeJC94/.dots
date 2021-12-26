

" Set options for editing text here
function TextEditOpts()
    setlocal wrap
    setlocal linebreak
    " setlocal breakindent
    setlocal showbreak=\ \ \|\  breakindent
    setlocal breakindentopt=sbr
    setlocal colorcolumn=0
    setlocal list
    setlocal virtualedit=all
    nnoremap <expr> k (v:count > 5 ? "m`" . v:count : "") . 'gk'
    nnoremap <expr> j (v:count > 5 ? "m`" . v:count : "") . 'gj'
endfunction

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

" Toggle quickfix list
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction

" Toggle location list
function! ToggleLocation()
    if empty(filter(getwininfo(), 'v:val.loclist'))
        lopen
    else
        lclose
    endif
endfunction

" Trim trailing spaces without upsetting changelist
function! TrimTrailingSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

function! ShowDocumentation()
    if (index(['vim','help'], &filetype) >=0)
        execute 'h '.expand('<cword>')
    else
        lua vim.lsp.buf.hover()
    endif
endfunction
