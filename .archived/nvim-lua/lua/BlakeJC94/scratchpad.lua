-- SCRATCHPAD.LUA
-- A place to experiment

-- local foo = function()
--     print("FOO")
-- end

-- local main = function()
--     foo()
--     local val = 420
-- end

local foo = function(buf_idx)
    local _
    buf_idx = buf_idx or 0
    if not vim.fn.executable('git') then return end

    -- Get path of current buffer
    local buffer_path = vim.api.nvim_buf_get_name(buf_idx)
    local buffer_dir = vim.fs.dirname(buffer_path)
    if not vim.fn.isdirectory(buffer_dir) then return end

    local cmd = table.concat({
        "git",
        "-C",
        buffer_dir,
        "rev-parse",
        "--git-dir",
    }, ' ')

    local git_dir = vim.fn.system(cmd)
    git_dir, _ = string.gsub(git_dir, '\n', '')

    if not vim.fn.isdirectory(git_dir) then return end
    vim.cmd.cd(vim.fs.dirname(git_dir))
end

local main = function()
    foo()
    local val = 420
end

vim.api.nvim_create_user_command("Scratch", main, {force = true})
