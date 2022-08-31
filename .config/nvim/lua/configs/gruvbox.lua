-- TODO add all the hlgroups here and refactor
return function()
    vim.o.background = "dark"
    require("gruvbox").setup({
        undercurl = true,
        underline = true,
        bold = true,
        italic = true, -- will make italic comments and special strings
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
        },
    })
    vim.cmd("colorscheme gruvbox")
end

