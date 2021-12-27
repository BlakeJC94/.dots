M = {}

M.my_fold_text = function()
    local line = vim.fn.getline(vim.v.foldstart)

    local indent_str = string.rep(" ", vim.fn.indent(vim.v.foldstart - 1))
    local fold_str = indent_str .. line .. string.rep(" ", 100)

    local fold_size = vim.v.foldend - vim.v.foldstart + 1
    local fold_size_str = " (" .. fold_size .. ") "

    return string.sub(fold_str, 0, 100 - #fold_size_str) .. fold_size_str

    -- old vimcript version
    -- function! myfoldtext()
    --     let line = getline(v:foldstart)
    --     let foldedlinecount = v:foldend - v:foldstart + 1
    --     return ' >  '. foldedlinecount . '  ' . line
    -- endfunction
end

M.show_syntax_group = function()
    -- Call with ":call v:lua.require("utils").show_syntax_group()"
    local s = vim.fn.synID(vim.fn.line('.'), vim.fn.col('.'), 1)
    local out_str = vim.fn.synIDattr(s, 'name') .. ' -> ' .. vim.fn.synIDattr(vim.fn.synIDtrans(s), 'name')
    print(out_str)

    -- old vimscript version
    -- function! SynGroup()
    --     let l:s = synID(line('.'), col('.'), 1)
    --     echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
    -- endfun
end

M.debug_script = function(script)
    -- TODO Use this to debug long outputs (e.g. :call Exec('scriptnames'))
    -- function! Exec(cmd)
    --     redir @a
    --         exec printf('silent %s',a:cmd)
    --     redir END
    --     " tabnew
    --     norm "ap
    -- endfunction
end


M.apply_options = function(options)
    -- TODO docs
    for k, v in pairs(options) do
        vim.opt[k] = v
    end
end

M.apply_maps = function(maps)
    -- TODO docs
    local default_opts = {noremap = true, silent = true}

    for mode, mappings in pairs(maps) do
        for keys, mapping in pairs(mappings) do
            if (type(mapping) == "table") then
                local opts = vim.tbl_extend('force', default_opts, mapping.opts)
                vim.api.nvim_set_keymap(mode, keys, mapping.map, opts)
            else
                vim.api.nvim_set_keymap(mode, keys, mapping, default_opts)
            end
        end
    end
end

M.apply_autogroup = function(autogroup)
    -- TODO docs
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

M.apply_commands = function(commands)
    -- TODO docs
    for name, val in pairs(commands) do
        if (type(val) == "table") then
            local cmd_str = {'command!'}
            if val.bang == true then
                table.insert(cmd_str, '-bang')
            end
            if val.nargs then
                table.insert(cmd_str, '-nargs=' .. val.nargs)
            end
            if val.complete then
                table.insert(cmd_str, '-complete=' .. val.complete)
            end
            table.insert(cmd_str, name)
            table.insert(cmd_str, val.cmd)
            cmd_str = table.concat(cmd_str, ' ')
            vim.cmd(cmd_str)
        else
            local cmd_str = table.concat({'command!', name, val}, ' ')
            vim.cmd(cmd_str)
        end
    end
end

M.apply_abbrevs = function(abbrevs)
    -- TODO docs
    for mode, abbreviations in pairs(abbrevs) do
        for lhs, rhs in pairs(abbreviations) do
            local cmd_str = mode .. 'noreabbrev' .. ' ' .. lhs .. ' ' .. rhs
            vim.cmd(cmd_str)
        end
    end

end

return M


-- -- RETIRED AUTOGROUPS --------------------------------------------------------------------------
-- local term_cmds = {
--     name='term_cmds',
--     cmds= {
--         ['term://*'] = {
--             -- Bypass normal mode when changing focus to terminal buffer
--             {events='BufWinEnter,WinEnter', cmd='startinsert'},
--             -- Disable numbers and spelling in terminals
--             {events='TermOpen', cmd='setlocal nonu nornu nospell'},
--             -- Immediately close terminal window when process finishes
--             {events='TermClose', cmd='quit'},
--         }
--     }
-- }
-- local cursorline_on_active_buffer = {
--     name='cursorline_on_active_buffer',
--     cmds={
--         ['*'] = {
--             {events='VimEnter,WinEnter,BufWinEnter,Focusgained', cmd="setlocal cursorline"},
--             {events='WinLeave,FocusLost', cmd="setlocal nocursorline"},
--         },
--         ['term://*'] = {
--             {events='VimEnter,WinEnter,BufWinEnter,Focusgained', cmd="setl nocursorline"},
--         }
--     }
-- }

-- -- OTHER NOTES ---------------------------------------------------------------------------------
-- Changing the cursor in regular vim?
-- :let &t_EI = "\e[0 q"  " Block cursor in normal mode
-- :let &t_SI = "\e[5 q"  " Bar cursor on insert mode
-- " Set bar cursor on command-line mode
-- :autocmd CmdLineEnter * exec 'silent !echo -ne "' . &t_SI . '"'
-- :autocmd CmdLineLeave * exec 'silent !echo -ne "' . &t_EI . '"'
-- " Set block curor on start or resume
-- :autocmd VimEnter * exec 'silent !echo -ne "' . &t_EI . '"'
-- :autocmd VimResume * exec 'silent !echo -ne "' . &t_EI . '"'
