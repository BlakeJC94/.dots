setl wrap
setl breakindentopt=list:-1
setl formatoptions-=tc
setl conceallevel=1

hi link markdownError Normal
hi link mkdLineBreak Normal

let g:markdown_fenced_languages = ['julia', 'html', 'python', 'bash=sh', 'zsh=sh', 'css', 'vim']
let g:markdown_folding = 1

