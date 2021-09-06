
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
autocmd! BufRead * call SetFormatOpts()

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
augroup text_edit
    autocmd!
    autocmd FileType markdown,text,tex call TextEditOpts()
    autocmd FileType tex inoremap <buffer> ` `'<C-o>h
augroup END

" Firenvim options
if exists('g:started_by_firenvim')
    set wrap linebreak colorcolumn=0 breakindent
    hi Normal guibg='#1d2021'
endif

" Allow LaTeX symbol completion in Markdown and Julia
autocmd! FileType markdown,julia let b:compe_latex_insert_code = v:true
