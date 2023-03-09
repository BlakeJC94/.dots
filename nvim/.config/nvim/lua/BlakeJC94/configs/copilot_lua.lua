local M = {}

M.cmd = "Copilot"

M.event = "InsertEnter"

function M.config()

    require("copilot").setup({
        suggestion = {
            enabled = true,
            auto_refresh = true,
            keymap = {
                accept = "<C-;>",
                accept_word = "<M-.>",
                accept_line = "<M-,>",
                next = "<C-.>",
                prev = "<C-,>",
                dismiss = "<C-l>",
            },
        },
        panel = {
            enabled = true,
            auto_refresh = true,
            keymap = {
                jump_prev = "[[",
                jump_next = "]]",
                accept = "<CR>",
                refresh = "gr",
                open = "<M-CR>"
            },
        },
    })

end


return M

