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
    -- Debug long outputs with :call v:lua.require("utils").debug_script(`vimscript_file`)
    vim.cmd([[redir @a]])
    vim.cmd([[    exec printf('silent %s',]] .. script .. [[)]])
    vim.cmd([[redir END]])
    vim.cmd([[tabnew]])
    vim.cmd([[norm "ap]])
end

M.open_notes = function()
    local notes_dir = os.getenv("HOME") .. '/Dropbox/Journals/project_notes'
    os.execute("mkdir -p " .. notes_dir)

    local project_name = vim.fn.finddir('.git/..', vim.fn.expand('%:p:h') .. ';'):match('[^/]+$')
    local branch_name = ""
    local title = ""
    local file_name = ""

    -- Set title and file_name variables
    if project_name ~= "" then
        -- git project identified, find branch_name and sep
        branch_name = io.popen('git branch --show-current'):read()

        title = project_name .. ' : ' .. branch_name
        file_name = project_name .. '__' .. branch_name
    else
        -- Couldn't find git project, keep empty branch_name and sep
        project_name = vim.fn.expand('%:p:h:t')

        title = project_name
        file_name = project_name
    end
    file_name = string.lower(string.gsub(file_name, '[ -]', '_'))

    -- Create new file if needed
    local note_path = notes_dir .. '/' .. file_name .. '.md'
    local file = io.open(note_path, 'r')
    if (file == nil) then
        -- File doesn't exist, create new file with header
        file = io.open(note_path, 'w')
        file:write("# " .. title .. '\n\n\n')
        file:close()
    end

    -- Open in vertical split and move cursor to end of file
    vim.cmd("vsplit | edit " .. note_path)
    vim.cmd("normal! G$")
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
