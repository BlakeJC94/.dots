DEFAULT_CMDS = {
    name='default_cmds',
    cmds={
        ['*'] = {
            {events='VimResized',  cmd="wincmd ="},                  -- Auto-resize windows
            {events='BufWritePre', cmd="retab"},                     -- Replace tabs
            {events='BufWritePre', cmd="TrimSpaces"},                -- Autoremove whitespace
            {events='BufEnter',    cmd="set fo=crq2jpt"},             -- Override format options
            {events='InsertEnter', cmd='set cursorline'},            -- Insertmode cursorline on
            {events='InsertLeave', cmd='set nocursorline'},          -- Insertmode cursorline off
            {   -- Clear jumplist
                events='VimEnter',
                cmd="exec 'tabdo windo clearjumps' | tabnext"},
            {   -- Auto-highlight yanked text
                events='TextYankPost',
                cmd="silent! lua require'vim.highlight'.on_yank({timeout = 700})"
            },
            {   -- create nested directories if needed when creating files
                events='BufWritePre,FileWritePre',
                cmd="silent! call mkdir(expand('<afile>:p:h'), 'p')"
            },
        },
        ['term://*'] = {
            {   -- Quit vim if terminal is the only window left
                events='BufEnter,WinEnter',
                cmd="if tabpagenr('$') == 1 && winnr('$') == 1 | quit | endif"
            },
        },
    }
}
EXTRA_FILETYPE_CMDS = {
    name='extra_filetype_cmds',
    cmds= {
        -- help/cmd win/qf list: Press q to close and disable spellcheck
        ['*'] = {
            {events='CmdwinEnter', cmd="nnoremap <buffer> q :q<CR>"},
        },
        ['qf,help'] = {
            {events='FileType', cmd="nnoremap <buffer> q :q<CR>"},
            {events='FileType', cmd="setlocal nospell"},
        },
        -- Restore default K action on help pages
        ['vim,help'] = {
            {events='FileType', cmd="nnoremap <buffer> K :h <C-r>=expand('<cword>')<CR><CR>"},
        },
        -- Always open help in vertical split
        ['help'] = {
            {events='FileType', cmd="wincmd L"},
        },
        -- Apply options for editing text files
        ['text,tex'] = {
            {events='FileType', cmd="Prose"}
        }
    }
}
SET_PRGS = {
    name='set_prgs',
    cmds={
        "FileType c set formatprg=clang-format",
        "FileType python set formatprg=yapf",
        "FileType Markdown set makeprg=pandoc\\ %:p\\ -o\\ %:p:h/out.pdf"
    }
}

M = {}

M.apply_autogroup = function(autogroup)
    group_name = autogroup.name
    group = autogroup.cmds

    vim.cmd('augroup ' .. group_name)
    vim.cmd('autocmd!')
    for filetype, autocmd in pairs(group) do
        if (type(autocmd) == "table") then
            for _, vals in pairs(autocmd) do
                local command = vim.tbl_flatten({'autocmd', vals.events, filetype, vals.cmd})
                local command = table.concat(command, ' ')
                vim.cmd(command)
            end
        else
            local command = table.concat(vim.tbl_flatten{'autocmd', autocmd}, ' ')
            vim.cmd(command)
        end
    end
    vim.cmd('augroup END')
end

M.load_autogroups = function()
    for _, autogroup in ipairs({DEFAULT_CMDS, EXTRA_FILETYPE_CMDS, SET_PRGS}) do
        require("autogroups").apply_autogroup(autogroup)
    end
end

return M
