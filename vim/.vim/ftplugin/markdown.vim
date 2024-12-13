setl wrap
setl breakindentopt=list:-1
setl formatoptions-=tc
setl conceallevel=1

hi link markdownError Normal
hi link mkdLineBreak Normal

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'zsh=sh', 'css']
let g:markdown_folding = 1

