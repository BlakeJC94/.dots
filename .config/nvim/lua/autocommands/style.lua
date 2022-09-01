local FUNCTIONS = require('functions')

return {
    -- toggle on insert colorcol cursorline
    {
        events = {"InsertEnter"},
        pattern = "*",
        callback = function()
            vim.opt_local.relativenumber = false
            vim.opt_local.colorcolumn = {100, 101}
        end
    },
    -- toggle off insert colorcol cursorline
    {
        events = {"InsertLeave"},
        pattern = "*",
        callback = function()
            vim.opt_local.cursorline = false
            vim.opt_local.relativenumber = true
            vim.opt_local.colorcolumn = {}
        end
    },
    -- echo vimtip on open
    {
        events = {"VimEnter"},
        callback = FUNCTIONS.VimTip,
        pattern = "*",
    },
    -- highlight yanks
    {
        events = {"TextYankPost"},
        pattern = "*",
        callback = function() vim.highlight.on_yank({timeout = 700}) end,
    },
}
