
let g:journal_location = "~/Dropbox/Journals"


let g:markdown_fenced_langages = ['python']


" vim-markdown options
" disable mappings
let g:vim_markdown_no_default_key_mappings = 1
" disable header folding
let g:vim_markdown_folding_disabled = 1
" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0
" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1
" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format
augroup pandoc_syntax
    au! FileType vimwiki,markdown set filetype=markdown.pandoc conceallevel=0
    " au! BufNewFile,BufFilePre,BufRead *.md hi VimwikiHeaderChar guibg=NONE
    " au! BufNewFile,BufFilePre,BufRead *.md hi VimwikiItalicChar guibg=NONE
    " au! BufNewFile,BufFilePre,BufRead *.md hi VimwikiBoldChar guibg=NONE
    " au! BufNewFile,BufFilePre,BufRead *.md hi VimwikiItalicBoldChar guibg=NONE
augroup END
