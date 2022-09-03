return {
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
        require('gitsigns').setup({
            signcolumn = false,
            numhl      = true,
            linehl     = false,
            keymaps    = {}, -- Keymaps set in init.lua
            current_line_blame = true,
            preview_config = {
                border = 'none',
                style = 'minimal',
                relative = 'cursor',
            }
        })
    end
}
