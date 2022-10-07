return {
    after = { "gitsigns.nvim", "telescope.nvim", "nvim-treesitter", "vim-illuminate" },
    requires = { "rktjmp/lush.nvim" },
    config = function()
        local gruvbox = require("gruvbox")
        local palette = require('gruvbox.palette')

        local bg_diff_delete = _G.color_midpoint(palette.dark0_hard, palette.neutral_red,    10, 1)
        local bg_diff_add =    _G.color_midpoint(palette.dark0_hard, palette.neutral_green,  10, 1)
        local bg_diff_change = _G.color_midpoint(palette.dark0_hard, palette.neutral_blue,   10, 1)
        local bg_diff_text =   _G.color_midpoint(palette.dark0_hard, palette.neutral_yellow, 10, 3)

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
                Folded =                     { bg = palette.dark0 },
                ColorColumn =                { bg = palette.dark0 },
                CursorLine =                 { bg = palette.dark0 },
                CursorLineNr =               { bg = palette.dark0 },
                IndentBlanklineContextChar = { fg = palette.light4 },
                Search =                     { fg = palette.bright_yellow, bg = palette.dark0 },
                CurSearch =                  { bg = palette.bright_yellow, fg = palette.dark0 },
                IncSearch =                  { fg = palette.bright_yellow, bg = palette.dark0 },
                DiffChange =                 { bg = bg_diff_change, fg = "", reverse = false },
                DiffAdd =                    { bg = bg_diff_add,    fg = "", reverse = false },
                DiffDelete =                 { bg = bg_diff_delete, fg = "", reverse = false },
                DiffText =                   { bg = bg_diff_text, fg = "", reverse = false },
                MatchWord =                  { bg = palette.dark0 },
                MatchParenCur =              { bg = palette.dark0 },
                MatchWordCur =               { bg = palette.dark0 },
            },
        })
        vim.cmd.colorscheme("gruvbox")

        local plugin_overrides = {
            telescope = {
                TelescopePromptBorder  = { bg = palette.dark0_hard },
                TelescopePromptNormal  = { bg = palette.dark0_hard },
                TelescopeResultsBorder = { bg = palette.dark1 },
                TelescopeResultsNormal = { bg = palette.dark1 },
                TelescopePreviewBorder = { bg = palette.dark0_hard },
                TelescopePreviewNormal = { bg = palette.dark0_hard },
            },
            illuminate = {
                IlluminatedWordText = { bg = palette.dark0 },
                IlluminatedWordRead = { bg = palette.dark0 },
                IlluminatedWordWrite= { bg = palette.dark0 },
            },
        }

        for plugin, overrides in pairs(plugin_overrides) do
            local ok, _ = pcall(require, plugin)
            if ok then
                for group, settings in pairs(overrides) do
                    vim.api.nvim_set_hl(0, group, settings)
                end
            end
        end
    end,
}




