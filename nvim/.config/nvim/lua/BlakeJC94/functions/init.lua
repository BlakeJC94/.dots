-- This module is for lua functions that can be used anywhere else in the configuration. Just use
-- `require('BlakeJC94.functions').function_name` wherever needed.
local M = {}

-- Generate new md file with auto-generated header and filename
M.new_note = function(in_str)  -- TODO update this
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
    -- TODO use vim.api.nvim_win_set_cursor(..) for this
    -- vim.cmd.vsplit()
    vim.cmd.edit(note_path)
    vim.cmd.normal("G$")  -- bang needed?
end

M.show_syntax_group = function()
    local s = vim.fn.synID(vim.fn.line('.'), vim.fn.col('.'), 1)
    local out_str = vim.fn.synIDattr(s, 'name') .. ' -> ' .. vim.fn.synIDattr(vim.fn.synIDtrans(s), 'name')
    print(out_str)
end

M.trim_spaces = function(keys)  -- TODO update input args and investigate keeppatterns
    local winstate = vim.fn.winsaveview()
    vim.cmd("keeppatterns %s/\\s\\+$//e")  -- escape `\`
    vim.fn.winrestview(winstate)
end

M.create_dirs = function()
    local dir = vim.fn.expand('<afile>:p:h')
    if vim.fn.isdirectory(dir) == 0 then
        vim.fn.mkdir(dir, 'p')
    end
end

M.shell_exec = function(command)
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()
    return result
end

M.print_lines = function(mutiline_string)
    for line in string.gmatch(mutiline_string, "[^\n]+") do
        print(line)
    end
end

M.put_lines = function(mutiline_string)
    lines = {}
    for line in string.gmatch(mutiline_string, "[^\n]+") do
        table.insert(lines, line)
    end
    vim.api.nvim_put(lines, "", true, true)
end

M.vimtip = function()
    if vim.g.vimtip == nil then
        vim.g.vimtip = require('functions').shell_exec('fortune ~/.config/nvim/extras/vim-tips')
        require('functions').print_lines(vim.g.vimtip)
    else
        require('functions').put_lines(vim.g.vimtip)
    end
end

M.set_quit_with_q = function()
    vim.keymap.set('n', 'q', ':q<CR>', {buffer=true, silent=true})
end

M.custom_fold_text = function()
    local line = vim.fn.getline(vim.v.foldstart)

    local indent_str = string.rep(" ", vim.fn.indent(vim.v.foldstart - 1))
    local fold_str = indent_str .. line .. string.rep(" ", 100)

    local fold_size = vim.v.foldend - vim.v.foldstart + 1
    local fold_size_str = " (" .. fold_size .. ") "

    return string.sub(fold_str, 0, 100 - #fold_size_str) .. fold_size_str
end

M.count_words = function()
    return tostring(vim.fn.wordcount().words)
end

M.color_midpoint = function(color1, color2, n_midpoints, point_idx)
    n_midpoints = n_midpoints or 1
    point_idx = point_idx or 1

    if n_midpoints < 1 then error("Invalid n_midpoints, expected >= 1") end
    if point_idx < 1 or point_idx > n_midpoints then error("Invalid point_idx") end

    local color_coords = {}
    for _, color in ipairs({color1, color2}) do
        if type(color) ~= "string" or #color ~= 7 or color:sub(1,1) ~= "#" then
            error("Invalid color given, expected format '#xxxxxx'")
        end
        color_coords[color] = {
            tonumber("0x" .. color:sub(2):sub(1, 2)),
            tonumber("0x" .. color:sub(2):sub(3, 4)),
            tonumber("0x" .. color:sub(2):sub(5, 6)),
        }
    end

    local delta_x = 1/(n_midpoints + 1)
    local result = "#"

    for i = 1, 3 do
        local m = color_coords[color2][i] - color_coords[color1][i]
        local c = color_coords[color1][i]
        local step = point_idx * delta_x

        local val = step * m + c
        result = result .. string.format("%02x", math.floor(val + 0.5))
    end

    return result
end

--- Append a string to the end of the line selected (can be called multiple times)
---@param buf_nr: buffer number selected
---@param line: 1-based index for buffer line to append text to
---@param text: string to append to end of buffer line
local append_text = function(buf_nr, line, text)
    if not line then
        error("Line number required for AppendText.")
    end

    buf_nr = buf_nr or vim.api.nvim_get_current_buf()
    text = text or ""

    local _current_line = vim.api.nvim_buf_get_lines(buf_nr, line - 1, line, false)[1]

    local insert_row_idx = line - 1
    local insert_col_idx = #_current_line
    vim.api.nvim_buf_set_text(buf_nr, insert_row_idx, insert_col_idx, insert_row_idx, insert_col_idx, { text })
end

local get_pylint_flags_from_diagnostics = function(buf_nr, line)
    local _diagnostics = vim.diagnostic.get(buf_nr)
    local pylint_flags = {}
    for _, v in ipairs(_diagnostics) do
        if v.source == "pylint" and v.row == line then
            -- print(vim.inspect(v))
            table.insert(pylint_flags, v.code)
        end
    end
    return pylint_flags
end

local append_pylint_flags = function(current_buffer_nr, current_line, pylint_disable_string, pylint_flags)
    if #pylint_flags == 0 then
        -- print("No pylint message on line " .. current_line)
        return
    end
    local pylint_disable_line_str = pylint_disable_string .. table.concat(pylint_flags, ",")
    append_text(current_buffer_nr, current_line, pylint_disable_line_str)
end

M.pylint_disable_line = function()
    local current_buf_nr = 0
    local pylint_disable_string = "  # pylint: disable="

    local current_line = vim.api.nvim_win_get_cursor(current_buf_nr)[1]

    -- Check if current file is a python file
    local _current_filetype = vim.api.nvim_buf_get_option(current_buf_nr, "filetype")
    local current_buffer_is_python = (_current_filetype == "python")
    if not current_buffer_is_python then
        print("Current buffer isn't a python file.")
        return
    end

    -- Check if pylint is executable
    local pylint_is_executable = (vim.fn.executable("pylint") == 1)
    if not pylint_is_executable then
        print("Couldn't find a pylint executable.")
        return
    end

    local pylint_flags = get_pylint_flags_from_diagnostics(current_buf_nr, current_line)
    append_pylint_flags(current_buf_nr, current_line, pylint_disable_string, pylint_flags)
end

return M
