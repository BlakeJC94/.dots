local M = {}

function M.config()
    require "lsp_signature".setup({hint_enable=false, move_cursor_key = "<C-x>"})
end

return M

