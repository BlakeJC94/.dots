local M = {}
M.requires ={
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
}
function M.config() require('refactoring').setup({}) end
return M
