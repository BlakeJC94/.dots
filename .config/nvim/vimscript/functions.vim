" TODO put this in lua config
if exists('g:started_by_firenvim')
    set wrap linebreak colorcolumn=0 breakindent
    "hi Normal guibg='#1d2021'
endif

" Set formatting options
function SetFormatOpts()
    setl fo-=t  " Auto-hardwrap text at textwidth
    setl fo+=c  " Auto-hardwrap comments at textwidth
    setl fo+=r  " Insert comment leaders on `CR` during insert mode
    setl fo-=o  " Insert comment leaders on `o` during normal mode
    setl fo+=q  " Allow comments formatting with gq (Q)
    setl fo-=w  " Lines that end without whitespace ends paragraph obj
    setl fo-=a  " Automatic formatting of paragraphs (only comments if fo+=c)
    setl fo-=n  " Recognise numbered lists (compat issue w fo+=2)
    setl fo+=2  " Use second line for par auto-indent
    setl fo-=v  " Vi-style wrap (auto-hardwrap at soft wrap level, buggy)
    setl fo-=b  " Vi-style wrap without breaking words
    setl fo-=l  " Don't break long lines during insert mode
    setl fo-=m  " Break at multibyte chars as well
    setl fo-=M  " Don't insert space before or after mutibyte char when joining
    setl fo-=B  " Don't insert space between mutibyte char when joining
    setl fo-=1  " Break lines before 1 letter words if possible
    setl fo-=]  " Rigorously enforce textwidth
    setl fo+=j  " Remove comment leaders when joining lines
    setl fo+=p  " Don't break lines at space after .
endfunction

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
command TextEdit :call TextEdit()

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
function TrimTrailingSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
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


