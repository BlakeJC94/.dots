local M = {}
M.requires = { "rafamadriz/friendly-snippets" }
function M.config() require("luasnip.loaders.from_vscode").lazy_load() end
return M
