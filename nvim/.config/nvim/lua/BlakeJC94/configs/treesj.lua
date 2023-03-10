local M = {}

M.requires = { 'nvim-treesitter' }

M.config = function()
    require('treesj').setup({ use_default_keymaps = false })
end

return M

