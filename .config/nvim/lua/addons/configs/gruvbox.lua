_G._configs.gruvbox_telescope_colors = function()
    vim.cmd("highlight TelescopePromptBorder guibg=#282828")
    vim.cmd("highlight TelescopePromptNormal guibg=#282828")

    vim.cmd("highlight TelescopeResultsBorder guibg=#3c3836")
    vim.cmd("highlight TelescopeResultsNormal guibg=#3c3836")

    vim.cmd("highlight TelescopePreviewBorder guibg=#282828")
    vim.cmd("highlight TelescopePreviewNormal guibg=#282828")
end

return {
    requires = {"rktjmp/lush.nvim"},
    config = function()
        vim.o.background = "dark"

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
                Folded = {bg = "#282828"},
                ColorColumn = {bg = "#282828"},
                CursorLine = {bg = "#282828"},
                CursorLineNr = {bg = "#282828"},
                IndentBlanklineContextChar = {fg = "#a89984"},
                Search = {fg = "#fabd2f", bg = "#282828"},
                CurSearch = {bg = "#fabd2f", fg = "#282828"},
                IncSearch = {fg = "#fabd2f", bg = "#282828"},
                DiffChange = {fg= "", bg = "#24312A"},
                DiffAdd = {fg= "", bg = "#282B20"},
                DiffDelete = {fg= "", bg = "#2D2021"},
                -- DiffText = {bg = ""},
            },
        })

        vim.cmd("colorscheme gruvbox")
    end
}

