local functions = {}

-- Generate new md file with auto-generated header and filename
functions['NewNote'] = function(in_str)
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
    vim.cmd.vsplit()
    vim.cmd.edit(note_path)
    vim.cmd.normal("G$")  -- bang needed?
end

functions['ShowSyntaxGroup'] = function()
    -- Call with ":call ShowSyntaxGroup()"
    local s = vim.fn.synID(vim.fn.line('.'), vim.fn.col('.'), 1)
    local out_str = vim.fn.synIDattr(s, 'name') .. ' -> ' .. vim.fn.synIDattr(vim.fn.synIDtrans(s), 'name')
    print(out_str)
end

functions['TrimSpaces'] = function(keys)
    local winstate = vim.fn.winsaveview()
    vim.cmd("keeppatterns %s/\\s\\+$//e")  -- escape `\`
    vim.fn.winrestview(winstate)
end

functions['CreateDirs'] = function()
    local dir = vim.fn.expand('<afile>:p:h')
    if vim.fn.isdirectory(dir) == 0 then
        vim.fn.mkdir(dir, 'p')
    end
end

functions['ShellExec'] = function(command)
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()
    return result
end

functions['PrintLines'] = function(mutiline_string)
    for line in string.gmatch(mutiline_string, "[^\n]+") do
        print(line)
    end
end

functions['PutLines'] = function(mutiline_string)
    lines = {}
    for line in string.gmatch(mutiline_string, "[^\n]+") do
        table.insert(lines, line)
    end
    vim.api.nvim_put(lines, "", true, true)
end

functions['VimTip'] = function()
    if vim.g.vimtip == nil then
        vim.g.vimtip = require('functions').ShellExec('fortune ~/.config/nvim/extras/vim-tips')
        require('functions').PrintLines(vim.g.vimtip)
    else
        require('functions').PutLines(vim.g.vimtip)
    end
end

functions['SetQuitWithQ'] = function()
    vim.keymap.set('n', 'q', ':q<CR>', {buffer=true, silent=true})
end

functions['CustomFoldText'] = function()
    local line = vim.fn.getline(vim.v.foldstart)

    local indent_str = string.rep(" ", vim.fn.indent(vim.v.foldstart - 1))
    local fold_str = indent_str .. line .. string.rep(" ", 100)

    local fold_size = vim.v.foldend - vim.v.foldstart + 1
    local fold_size_str = " (" .. fold_size .. ") "

    return string.sub(fold_str, 0, 100 - #fold_size_str) .. fold_size_str
end

functions['GetWords'] = function()
    return tostring(vim.fn.wordcount().words)
end

functions['OpenURL'] = function()
    local uri = vim.fn.expand('<cWORD>')
    uri = string.gsub(uri, '?', '\\?')
    uri = vim.fn.shellescape(uri, 1)
    if uri ~= '' then
        vim.fn.execute("!xdg-open " .. uri)
    elseif string.match(uri, "%S+/%S+") then
        vim.fn.execute("!xdg-open https://github.com/" .. uri)
    end
end

functions['ColorMidpoint'] = function(color1, color2, n_midpoints, point_idx)
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

return functions
