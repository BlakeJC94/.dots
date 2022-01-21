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

M.new_note = function(in_str)
    -- Call with ":call v:lua.require("utils").new_note()"
    local title = ""
    local note_path = ""

    -- Create notes directory if it doesn't exist
    local notes_dir = os.getenv("HOME") .. '/Dropbox/Journals'
    os.execute("mkdir -p " .. notes_dir)

    -- Infer title if no input given
    if in_str == "" or in_str == nil then
        -- Try to infer title from git project
        local project = vim.fn.finddir('.git/..', vim.fn.expand('%:p:h') .. ';'):match('[^/]+$')

        local branch = ""
        if project ~= nil then
            -- git project identified, get branch name and sep
            branch = ', ' .. io.popen('git branch --show-current'):read()
        else
            -- No git found, use file_name for project and ignore branch
            project = vim.fn.expand('%:p:h:t')
        end
        project = string.gsub(project, '^%.', '')  -- remove leading . if present
        title = project .. branch
    else
        title = in_str
    end

    if title == "" then
        print("Empty title recieved, aborting")
        return
    end

    -- Flatten title for file_name matching/creation
    flat_title = string.lower(title)
    flat_title = string.gsub(flat_title, '([ %[%]()%{%}%\\%/-.,=%\'%\":;><]+)', '_')

    -- Check if note title already exists
    -- NOTE: could use `find [dir] -type for` with `-maxdepth` for this if multi levels needed
    local notes = io.popen('ls -p ' .. notes_dir .. ' | grep -v /'):read('*a')
    local file_title = ""
    for file in string.gmatch(notes, '[^\n]+') do
        -- Trim date and ext from loop file name
        file_title = string.gsub(file, '%d%d%d%d_%d%d_%d%d_', '')
        file_title = string.gsub(file_title, '%.%w+$', '')
        if flat_title == file_title then
            note_path = notes_dir .. '/' .. file
            break
        end
    end

    -- Create new note if title doesn't exist yet
    if note_path == "" then
        local date = io.popen("date -u +'%Y_%m_%d'"):read()
        note_path = notes_dir .. '/' .. date .. '_' .. flat_title .. '.md'
        new_note = io.open(note_path, 'w')
        -- Write yaml header
        new_note:write("---\n")
        new_note:write("title: " .. title .. "\n")
        new_note:write("date: " .. string.gsub(date, '_', '-') .. "\n")
        new_note:write("tags:\n")
        new_note:write("---\n\n")
        -- Write title and close
        new_note:write("# " .. title .. '\n\n\n')
        new_note:close()
    end

    -- Open in vertical split and move cursor to end of file
    vim.cmd("vsplit | edit " .. note_path)
    vim.cmd("normal! G$")
end

-- M.edit_func_arg = function(count)
--     print(count)
--     local match = false
--     if count == 0 then
--         print('count 0 : go to next ')
--     else if count > 0 then
--         print('count = N > 0 : go to Nth arg')
--     end
--     return
-- end

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
