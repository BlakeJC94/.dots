local M = {}

M.cmd = "Copilot"

M.event = "InsertEnter"

function M.config()

    require("copilot").setup({
        suggestion = {
            enabled = true,
            auto_refresh = true,
            keymap = {
                accept = "<M-CR>",
                accept_word = "<M-;>",
                accept_line = false,
                next = "<M-.>",
                prev = "<M-,>",
                dismiss = "<M-l>",
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
