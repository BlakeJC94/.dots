-- SCRATCHPAD.LUA
-- A place to experiment
-- local M = {}
-- M.Foo = function()
--     print("FOO")
-- end
-- M.Main = function()  -- Pylint disable line
--     M.Foo()
--     local val = 420
--     print("TRACE", "Main", "val:", val)
-- end

-- vim.api.nvim_create_user_command(
--     "Scratch",
--     function() require("scratchpad").Main() end,
--     {force = true}
-- )
-- return M

local M = {}

--- Append a string to the end of the line selected (can be called multiple times)
---@param buf_nr: buffer number selected
---@param line: 1-based index for buffer line to append text to
---@param text: string to append to end of buffer line
M.AppendText = function(buf_nr, line, text)
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

M.GetPylintFlagsFromSys = function(filepath, line)  -- TODO support line = nil?
    local _pylint_command = table.concat({ "pylint", filepath }, " ")
    local _pylint_output_raw = vim.fn.system(_pylint_command) -- string
    local _pylint_output = vim.fn.split(_pylint_output_raw, "\n")
    local pylint_messages = vim.list_slice(_pylint_output, 2, #_pylint_output - 3)

    -- Parse messages from current line
    local _pylint_line_regex = table.concat({ filepath, ":", line, ":%d+:" })
    local pylint_flags = {}
    for _, v in ipairs(pylint_messages) do
        if string.match(v, _pylint_line_regex) then
            local flag = string.match(v, "%(%S+%)$"):sub(2, -2)
            table.insert(pylint_flags, flag)
        end
    end
    return pylint_flags
end

M.GetPylintFlagsFromDiagnostics = function(buf_nr, line)
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

M.PylintDisableLine = function()
    local current_buffer_nr = 0
    local pylint_disable_string = "  # pylint: disable="

    local current_line = vim.api.nvim_win_get_cursor(current_buffer_nr)[1]

    -- Check if current file is a python file
    local _current_filetype = vim.api.nvim_buf_get_option(current_buffer_nr, "filetype")
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

    local pylint_flags = M.GetPylintFlagsFromDiagnostics(current_buffer_nr, current_line)
    M.AppendPylintFlags(current_buffer_nr, current_line, pylint_disable_string, pylint_flags)

    -- TODO write a proper non-blocking fallback
    -- if #pylint_flags == 0 then
    --     local current_filepath = vim.fn.expand("%")
    --     local async = require("plenary.async")
    --     async.run(function()
    --         pylint_flags = M.GetPylintFlagsFromSys(current_filepath, current_line)
    --         M.AppendPylintFlags(current_buffer_nr, current_line, pylint_disable_string, pylint_flags)
    --     end)
    -- end
end

M.Main = function() -- PylintDisableLine TODO make this asynchonrous
    M.PylintDisableLine()
end

M.AppendPylintFlags = function(current_buffer_nr, current_line, pylint_disable_string, pylint_flags)
    if #pylint_flags == 0 then
        -- print("No pylint message on line " .. current_line)
        return
    end
    local pylint_disable_line_str = pylint_disable_string .. table.concat(pylint_flags, ",")
    M.AppendText(current_buffer_nr, current_line, pylint_disable_line_str)
end

vim.api.nvim_create_user_command("Scratch", function()
    require("scratchpad").Main()
end, { force = true })

return M
