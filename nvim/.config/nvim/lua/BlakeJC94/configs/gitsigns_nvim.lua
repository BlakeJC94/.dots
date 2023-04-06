local M = {}

M.requires = { "nvim-lua/plenary.nvim" }

function M.config()
    require('gitsigns').setup({
        signcolumn = false,
        numhl      = true,
        linehl     = false,
        keymaps    = {}, -- Keymaps set in mappings.lua
        current_line_blame = true,
        preview_config = {
            border = 'none',
            style = 'minimal',
            relative = 'cursor',
        },
    })
end

return M
