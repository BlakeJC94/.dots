local M = {}

M.requires = { "lukas-reineke/virt-column.nvim" }

function M.config()
    require("indent_blankline").setup({
        show_current_context = true,
        show_current_context_start = false,
        filetype_exclude = require("BlakeJC94").filetype_exclude,
        buftype_exclude = {"terminal"},
    })

    local augroup = vim.api.nvim_create_augroup
    local autocmd = vim.api.nvim_create_autocmd
    autocmd(
        {"InsertLeave"},
        {
            group = augroup("indent_blankline_updates", {clear = true}),
            pattern = "*",
            callback = function() vim.cmd.IndentBlanklineRefresh() end,
        }
    )
end

return M

