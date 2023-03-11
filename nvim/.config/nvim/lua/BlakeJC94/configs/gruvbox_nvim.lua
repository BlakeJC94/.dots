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

    local dap_blue = { fg = palette.bright_blue }
    local dap_blue_grey = { fg = palette.bright_blue, bg = palette.dark1 }
    local dap_green = { fg = palette.bright_green }
    local dap_green_grey = { fg = palette.bright_green, bg = palette.dark1 }
    local dap_red = { fg = palette.bright_red }
    local dap_red_grey = { fg = palette.bright_red, bg = palette.dark1 }
    local dap_purple = { fg = palette.bright_purple }

    vim.o.background = "dark"

    gruvbox.setup({
        undercurl = true,
        underline = true,
        bold = true,
        italic = false,
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
            healthSuccess = { bg = palette.bright_green, fg = palette.dark0_hard },
            healthError = { bg = palette.bright_red, fg = palette.dark0_hard },
            DapUIScope = dap_blue,
            DapUIStepOut = dap_blue,
            DapUIStepBack = dap_blue,
            DapUIStepInto = dap_blue,
            DapUIStepOver = dap_blue,
            DapUIWinSelect = dap_blue,
            DapUIDecoration = dap_blue,
            DapUILineNumber = dap_blue,
            DapUIFloatBorder = dap_blue,
            DapUIModifiedValue = dap_blue,
            DapUIStoppedThread = dap_blue,
            DapUIBreakpointsLine = dap_blue,
            DapUIBreakpointsPath = dap_blue,
            DapUIStepOutNC = dap_blue_grey,
            DapUIStepBackNC = dap_blue_grey,
            DapUIStepIntoNC = dap_blue_grey,
            DapUIStepOverNC = dap_blue_grey,
            DapUIThread = dap_green,
            DapUIRestart = dap_green,
            DapUIPlayPause = dap_green,
            DapUIWatchesValue = dap_green,
            DapUIBreakpointsInfo = dap_green,
            DapUICurrentFrameName = dap_green,
            DapUIBreakpointsCurrentLine = dap_green,
            DapUIRestartNC = dap_green_grey,
            DapUIPlayPauseNC = dap_green_grey,
            DapUIStop = dap_red,
            DapUIWatchesEmpty = dap_red,
            DapUIWatchesError = dap_red,
            DapUIStopNC = dap_red_grey,
            DapUIType = dap_purple,
            DapUISource = dap_purple,
        },
    })

    vim.cmd.colorscheme("gruvbox")
end

return M
