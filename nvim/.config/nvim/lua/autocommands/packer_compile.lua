return {
    -- compile on plugins lua write
    {
        events = {"BufWritePost"},
        pattern = "plugins.lua",
        callback = function(keys) vim.cmd.source(keys.file); vim.cmd.PackerCompile() end
    },
    -- compile on configs lua write
    {
        events = {"BufWritePost"},
        pattern = "configs.lua",
        callback = function(keys) vim.cmd.source(keys.file); vim.cmd.PackerCompile() end
    },
}
