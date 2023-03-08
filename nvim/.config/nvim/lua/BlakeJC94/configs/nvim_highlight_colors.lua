local M = {}

function M.config()
    require('nvim-highlight-colors').setup({})
    require("nvim-highlight-colors").turnOff()  -- Off by default
end

return M

