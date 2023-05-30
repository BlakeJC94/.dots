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
    -- local is_fugitive = dir:sub(1,9) == "fugitive:"
    if vim.fn.isdirectory(dir) == 0 and not string.find(dir, ':') then
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
    local lines = {}
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


function M.close_all_except_selected_buffer()
    vim.cmd('%bdelete|edit #|normal `"')
end

function M.toggle_quickfix_list()
    if #vim.fn.filter(vim.fn.getwininfo(), 'v:val.quickfix') == 0 then
        vim.cmd.copen()
    else
        vim.cmd.cclose()
    end
end

function M.toggle_local_list()
    if #vim.fn.filter(vim.fn.getwininfo(), 'v:val.loclist') == 0 then
        vim.cmd.lopen()
    else
        vim.cmd.lclose()
    end
end


function M.resize_vim_splits()
    vim.cmd.wincmd("=")
end

function M.replace_tabs_with_spaces()
    vim.cmd.retab()
end

function M.reload_buffer()
    if vim.cmd.mode() ~= "c" then vim.cmd.checktime() end
end

function M.remove_nonfile_buffer()
    if not vim.fn.filereadable(vim.fn.expand("%")) then
        vim.cmd("bd!")
    end
end

function M.set_info_buffer_opts()
    vim.opt_local.spell = false
    vim.opt_local.colorcolumn = {}
    vim.opt_local.foldlevel = 99
    vim.opt_local.formatoptions:remove("t")
    -- restore default K action on help pages
    vim.keymap.set("n", "K", ":h <C-r>=expand('<cword>')<CR><CR>", { silent = true, buffer = true })
end

function M.help_vert_split()
    if vim.o.filetype == "help" then
        vim.cmd.wincmd("L")
        vim.cmd("vert resize 90")
    end
end

function M.highlight_yanks()
    vim.highlight.on_yank({ timeout = 700 })
end

function M.toggle_insert_target_on()
    local allowed = true
    for _, v in pairs(require("BlakeJC94").filetype_exclude) do
        if vim.bo.filetype == v then
            allowed = false
        end
    end
    if allowed then
        vim.opt_local.cursorline = true
        -- vim.opt_local.relativenumber = false
        local textwidth = vim.api.nvim_buf_get_option(0, "textwidth")
        vim.opt_local.colorcolumn = { textwidth + 1, textwidth + 2 }
    end
end

-- TODO rfc
function M.toggle_insert_target_off()
    local allowed = true
    for _, v in pairs(require("BlakeJC94").filetype_exclude) do
        if vim.bo.filetype == v then
            allowed = false
        end
    end
    if allowed then
        vim.opt_local.cursorline = false
        -- vim.opt_local.relativenumber = true
        vim.opt_local.colorcolumn = {}
    end
end

function M.goto_config(keys)
    local addons_file = "lua/BlakeJC94/addons.lua"
    local addons_filepath = table.concat({ vim.fs.dirname(vim.fn.expand("$MYVIMRC")), addons_file }, "/")

    local config_dir = "lua/BlakeJC94/configs"
    local config_dirpath = table.concat({ vim.fs.dirname(vim.fn.expand("$MYVIMRC")), config_dir }, "/")

    if vim.fn.expand("%:p") ~= addons_filepath then
        return
    end

    local line_nr = keys.line1
    local line_content = vim.api.nvim_buf_get_lines(0, line_nr - 1, line_nr, false)[1]

    local addr = string.match(line_content, "['\"][^'\"]*/([^'\"]*)['\"]") or ""
    if addr == "" then
        return
    end

    local config_filename = M.slugify(addr) .. ".lua"
    local config_path = table.concat({ config_dirpath, config_filename }, "/")

    vim.cmd.edit(config_path)

    local config_path_exists = vim.fn.filereadable(config_path)
    if config_path_exists == 0 then
        local lines = {"local M = {}", "", "function M.config()", "", "end", "", "return M"}
        vim.api.nvim_buf_set_lines(0, 0, 0, true, lines)
    end
end

return M
