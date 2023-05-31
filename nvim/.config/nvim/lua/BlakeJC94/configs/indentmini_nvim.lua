local M = {}

function M.config()
    require('indentmini').setup({char = "│"})
    -- use comment color
    vim.cmd.highlight("default link IndentLine Comment")
end

return M

