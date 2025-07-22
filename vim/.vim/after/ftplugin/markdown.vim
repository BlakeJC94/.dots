setl wrap
setl breakindentopt=list:-1
setl formatoptions-=tc
setl conceallevel=1
setl foldlevel=1

hi link markdownError Normal
hi link mkdLineBreak Normal

let g:markdown_fenced_languages = ['sh', 'json', 'julia', 'html', 'python', 'bash=sh', 'zsh=sh', 'css', 'vim']
let g:markdown_folding = 1

autocmd Filetype markdown,liquid,text
            \ syn region markdownLink matchgroup=markdownLinkDelimiter
            \ start="(" end=")" keepend contained conceal contains=markdownUrl
" autocmd Filetype markdown,liquid,text
"             \ syn match markdownExt /{[.:#][^}]*}/ conceal contains=ALL
