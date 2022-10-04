-- SCRATCHPAD.LUA
-- A place to experiment
-- local M = {}
-- M.Foo = function()
--     print("FOO")
-- end
-- M.Main = function()  -- Pylint disable line
--     M.Foo()
-- end

-- vim.api.nvim_create_user_command(
--     "Scratch",
--     function() require("scratchpad").Main() end,
--     {force = true}
-- )
-- return M

local M = {}

M.Foo = function()
    print("FOO")
end

M.Main = function()  -- Pylint disable line
    M.Foo()
    -- TODO Check if currrent file is a python file
    -- TODO Check if pylint is executable

    -- TODO Run pylint for file and store temporary buffer
    -- TODO Get current cursor postion (line number)
    local row, col = vim.api.nvim_win_get_cursor(0)

    -- TODO Append "  # pylint: disable=.." to currentl line
    -- TODO Run pylint and store in temp buffer
    -- TODO Parse message from current line
    -- TODO Get first hypen-seperated message
end

-- foobar  -- get_cursor has 39
-- print(vim.inspect(vim.api.nvim_buf_get_lines(0, 38, 39, false)))

-- nvim_buf_get_text for position
-- nvim_buf_set_text for append


-- Lint number from cursor postion:
-- vim.api.nvim_set_current_win(win_handle)
-- local win_info = vim.fn.getwininfo(win_handle)[1]
-- local win_view = vim.fn.winsaveview()
-- local top_line = win_info.topline - 1
-- local bot_line = win_info.botline



vim.api.nvim_create_user_command(
    "Scratch",
    function() require("scratchpad").Main() end,
    {force = true}
)

return M
