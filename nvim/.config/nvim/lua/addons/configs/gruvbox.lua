-- TODO use vim.api.nvim_set_hl(0, group, settings) instead of cmd
_G._configs.gruvbox_telescope_colors = function()
    local palette = require('gruvbox.palette')
end

_G._configs.gruvbox_vim_illuminate_colors = function()
    local palette = require('gruvbox.palette')
end

return {
    after = { "gitsigns.nvim", "telescope.nvim", "nvim-treesitter", "vim-illuminate" },
    requires = { "rktjmp/lush.nvim" },
    config = function()
        vim.o.background = "dark"

        local palette = require('gruvbox.palette')

        require("gruvbox").setup({
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
                DiffChange =                 { bg = "#24312A", fg = "", reverse = false },
                DiffAdd =                    { bg = "#282B20", fg = "", reverse = false },
                DiffDelete =                 { bg = "#2D2021", fg = "", reverse = false },
                DiffText =                   { bg = "#3F3621", fg = "", reverse = false },
                MatchWord =                  { bg = palette.dark0 },
                MatchParenCur =              { bg = palette.dark0 },
                MatchWordCur =               { bg = palette.dark0 },
            },
        })

        -- TODO: find a native lua method for this
        -- Note: Diff* colors are obtained from Colorblender
        --   Color 1: #1D2021  <-- (palette.neutral_red)
        --   Color 2: #CC241D  <-- (palette.neutral_red)
        --   Midpoints: 10

        vim.cmd.colorscheme("gruvbox")

        local ok, _ = pcall(require, "telescope")
        if ok then
            vim.cmd.highlight("TelescopePromptBorder guibg=" .. palette.dark0_hard)
            vim.cmd.highlight("TelescopePromptNormal guibg=" .. palette.dark0_hard)

            vim.cmd.highlight("TelescopeResultsBorder guibg=" .. palette.dark1)
            vim.cmd.highlight("TelescopeResultsNormal guibg=" .. palette.dark1)

            vim.cmd.highlight("TelescopePreviewBorder guibg=" .. palette.dark0_hard)
            vim.cmd.highlight("TelescopePreviewNormal guibg=" .. palette.dark0_hard)
        end

        local ok, _ = pcall(require, "illuminate")
        if ok then
            vim.cmd.highlight("def IlluminatedWordText guibg=" .. palette.dark0)
            vim.cmd.highlight("def IlluminatedWordRead guibg=" .. palette.dark0)
            vim.cmd.highlight("def IlluminatedWordWrite guibg=" .. palette.dark0)
        end
    end,
}




