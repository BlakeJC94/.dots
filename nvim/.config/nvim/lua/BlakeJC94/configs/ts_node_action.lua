local M = {}
M.requires = { "nvim-treesitter/nvim-treesitter" }
function M.config() require("ts-node-action").setup({}) end
return M

