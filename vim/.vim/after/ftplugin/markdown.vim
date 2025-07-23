setl wrap
setl breakindentopt=list:-1
setl formatoptions-=tc
setl conceallevel=1
setl foldlevel=1

hi link markdownError Normal
hi link mkdLineBreak Normal

function! MarkdownLevel()
    " Check if we're inside a fenced code block
    let in_code_block = 0
    let current_line = v:lnum
    
    " Look backwards for code block fences
    for line_num in range(1, current_line)
        let line_content = getline(line_num)
        if line_content =~ '^```'
            let in_code_block = !in_code_block
        endif
    endfor
    
    " If we're in a code block, don't create folds for headers
    if in_code_block
        return "="
    endif
    
    if getline(v:lnum) =~ '^# .*$'
        return ">1"
    endif
    if getline(v:lnum) =~ '^## .*$'
        return ">2"
    endif
    if getline(v:lnum) =~ '^### .*$'
        return ">3"
    endif
    if getline(v:lnum) =~ '^#### .*$'
        return ">4"
    endif
    if getline(v:lnum) =~ '^##### .*$'
        return ">5"
    endif
    if getline(v:lnum) =~ '^###### .*$'
        return ">6"
    endif
    return "="
endfunction
setlocal foldexpr=MarkdownLevel()
setlocal foldmethod=expr

let g:markdown_fenced_languages = ['sh', 'json', 'julia', 'html', 'python', 'bash=sh', 'zsh=sh', 'css', 'vim']
" let g:markdown_folding = 1

autocmd Filetype markdown,liquid,text
            \ syn region markdownLink matchgroup=markdownLinkDelimiter
            \ start="(" end=")" keepend contained conceal contains=markdownUrl
" autocmd Filetype markdown,liquid,text
"             \ syn match markdownExt /{[.:#][^}]*}/ conceal contains=ALL
