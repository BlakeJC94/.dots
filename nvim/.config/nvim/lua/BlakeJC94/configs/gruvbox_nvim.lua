local M = {}

M.requires = { "rktjmp/lush.nvim" }

function M.config()
    local gruvbox = require("gruvbox")
    local palette = require("gruvbox.palette").colors
    local color_midpoint = require("BlakeJC94.utils").functions.color_midpoint

    local bg_diff_delete = color_midpoint(palette.dark0_hard, palette.neutral_red, 10, 1)
    local bg_diff_add = color_midpoint(palette.dark0_hard, palette.neutral_green, 10, 1)
    local bg_diff_change = color_midpoint(palette.dark0_hard, palette.neutral_blue, 10, 1)
    local bg_diff_text = color_midpoint(palette.dark0_hard, palette.neutral_yellow, 10, 3)

    vim.o.background = "dark"

    gruvbox.setup({
        undercurl = true,
        underline = true,
        bold = true,
        italic = false, -- will make italic comments and special strings
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        contrast = "hard", -- can be "hard" or "soft"
        overrides = {
            NormalFloat = { bg = palette.dark0 },
            SignColumn = { bg = palette.dark0_hard },
            Folded = { bg = palette.dark0 },
            ColorColumn = { bg = palette.dark0 },
            CursorLine = { bg = palette.dark0 },
            CursorLineNr = { bg = palette.dark0 },
            Search = { fg = palette.bright_yellow, bg = palette.dark0 },
            CurSearch = { bg = palette.bright_yellow, fg = palette.dark0 },
            IncSearch = { fg = palette.bright_yellow, bg = palette.dark0 },
            DiffChange = { bg = bg_diff_change, fg = "", reverse = false },
            DiffAdd = { bg = bg_diff_add, fg = "", reverse = false },
            DiffDelete = { bg = bg_diff_delete, fg = "", reverse = false },
            DiffText = { bg = bg_diff_text, fg = "", reverse = false },
            MatchWord = { bg = palette.dark0 },
            MatchParenCur = { bg = palette.dark0 },
            MatchWordCur = { bg = palette.dark0 },
            LocalHighlight = { bg = nil, fg = nil, underline = true },
            SymbolsOutline = { bg = nil, fg = palette.neutral_blue },
        },
    })

    vim.cmd.colorscheme("gruvbox")
end

return M
