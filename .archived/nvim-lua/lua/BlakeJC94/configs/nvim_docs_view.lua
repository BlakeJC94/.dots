local M  = {}
function M.config()
    require("docs-view").setup {
        position = "bottom",
        height = 10,
    }
end
return M
