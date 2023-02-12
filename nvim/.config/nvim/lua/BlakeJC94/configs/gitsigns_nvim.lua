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
        -- _signs_staged_enable = true,
    })

    vim.api.nvim_create_autocmd('User', {
        pattern = 'GitSignsUpdate',
        callback = function()
            vim.fn["fugitive#ReloadStatus"]()
        end
    })
end

return M
