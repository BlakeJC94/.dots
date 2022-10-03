local FUNCTIONS = require('functions')

return {
    -- resize vim splits
    {
        events = {"VimResized"},
        pattern = {"*"},
        callback = function() vim.cmd.wincmd("=") end,
    },
    -- replace tabs with spaces
    {
        events = {"BufWritePre"},
        pattern = "*",
        callback = function() vim.cmd.retab() end,
    },
    -- autoremove whitespace
    {
        events = {"BufWritePre"},
        pattern = "*",
        callback = FUNCTIONS.TrimSpaces,
    },
    -- make new dirs on save
    {
        events = {"BufWritePre", "FileWritePre"},
        pattern = "*",
        callback = FUNCTIONS.CreateDirs,
    },
    -- Auto-start insert mode when switching to a terminal split
    {
        events = {"WinEnter"},
        pattern = "term://*",
        callback = function() vim.cmd.startinsert() end,
    },
}
