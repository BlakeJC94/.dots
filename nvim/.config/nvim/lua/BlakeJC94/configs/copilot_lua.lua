local M = {}

function M.config()

    require("copilot").setup({
        suggestion = {
            enabled = true,
            auto_refresh = true,
            keymap = {
                accept = "<M-;>",
                accept_word = false,
                accept_line = false,
                next = "<M-.>",
                prev = "<M-,>",
                dismiss = "<C-;>",
            },
        },
        panel = { enabled = true },
    })

end

return M

