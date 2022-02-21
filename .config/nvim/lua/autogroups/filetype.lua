FILETYPE = {
    name='extra_filetype_cmds',
    cmds= {
        -- help/cmd win/qf list: Press q to close and disable spellcheck
        ['*'] = {
            {events='CmdwinEnter', cmd="nnoremap <buffer> q :q<CR>"},
            {events='CmdwinEnter', cmd="lua require('cmp').setup.buffer({enabled = false})"},
        },
        ['qf,help,fugitive'] = {
            {events='FileType', cmd="nnoremap <buffer> q :q<CR>"},
            {events='FileType', cmd="setlocal nospell"},
            {events='FileType', cmd="setlocal colorcolumn="},
        },
        -- Restore default K action on help pages
        ['vim,help'] = {
            {events='FileType', cmd="nnoremap <buffer> K :h <C-r>=expand('<cword>')<CR><CR>"},
        },
        -- Always open help in vertical split
        ['help'] = {
            {events='FileType', cmd="wincmd L | vert resize 90"},
            {events='FileType', cmd="setl fo-=t"},
        },
        -- Apply options for editing text files
        -- ['text,tex'] = {
        --     {events='FileType', cmd="Prose"}
        -- }
    }
}
return FILETYPE

