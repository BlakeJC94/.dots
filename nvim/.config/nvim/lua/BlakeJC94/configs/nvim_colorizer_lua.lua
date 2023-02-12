local M = {}
function M.config()
    vim.opt.termguicolors = true
    require("colorizer").setup({'*'}, {names=false})
end
return M
