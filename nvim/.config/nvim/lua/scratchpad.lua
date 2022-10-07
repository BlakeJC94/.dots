-- SCRATCHPAD.LUA
-- A place to experiment

local foo = function()
    print("FOO")
end

local main = function()
    foo()
    local val = 420
end

vim.api.nvim_create_user_command("Scratch", main, {force = true})
