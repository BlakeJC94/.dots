local M = {}

function M.config()
    require "lsp_signature".setup({
        hint_enable = false,
        handler_opts = { border = "none" },
        move_cursor_key = "<C-x>",
    })
end

return M

