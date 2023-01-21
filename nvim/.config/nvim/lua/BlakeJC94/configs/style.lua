local M = {}


M.configure_gruvbox = function()
    local gruvbox = require("gruvbox")
    local palette = require('gruvbox.palette')
    local color_midpoint = require("BlakeJC94.functions").color_midpoint

    local bg_diff_delete = color_midpoint(palette.dark0_hard, palette.neutral_red,    10, 1)
    local bg_diff_add =    color_midpoint(palette.dark0_hard, palette.neutral_green,  10, 1)
    local bg_diff_change = color_midpoint(palette.dark0_hard, palette.neutral_blue,   10, 1)
    local bg_diff_text =   color_midpoint(palette.dark0_hard, palette.neutral_yellow, 10, 3)

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
            Search =                     { fg = palette.bright_yellow, bg = palette.dark0 },
            CurSearch =                  { bg = palette.bright_yellow, fg = palette.dark0 },
            IncSearch =                  { fg = palette.bright_yellow, bg = palette.dark0 },
            DiffChange =                 { bg = bg_diff_change, fg = "", reverse = false },
            DiffAdd =                    { bg = bg_diff_add,    fg = "", reverse = false },
            DiffDelete =                 { bg = bg_diff_delete, fg = "", reverse = false },
            DiffText =                   { bg = bg_diff_text,   fg = "", reverse = false },
            MatchWord =                  { bg = palette.dark0 },
            MatchParenCur =              { bg = palette.dark0 },
            MatchWordCur =               { bg = palette.dark0 },
        },
    })
end

M.configure_indent_guides = function()
    require("indent_blankline").setup({
        show_current_context = true,
        show_current_context_start = false,
        filetype_exclude = require("BlakeJC94.globals").filetype_exclude,
        buftype_exclude = {"terminal"},
    })
end

M.configure_lualine = function()
    require("lualine").setup({
        options = {
            icons_enabled = true,
            theme = "gruvbox",
            component_separators = { left = "│", right = "│" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {},
            always_divide_middle = true,
            globalstatus = true,
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "filename" },
            -- lualine_b = { { "tabs", mode = 1 } },
            lualine_c = { "lsp_progress" },
            lualine_x = { "searchcount" , "filetype" },
            lualine_y = { "location", "progress", "diff" },
            lualine_z = { "branch" },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
        extensions = {},
    })
end

M.set_quickscope_colors = function()
    vim.cmd.highlight("QuickScopePrimary guifg='#ff007c' gui=bold ctermfg=198 cterm=bold")
    vim.cmd.highlight("QuickScopeSecondary guifg='#00dfff' gui=bold ctermfg=45 cterm=bold")
end

M.configure_quick_scope = function()
    vim.g.qs_max_chars = 800
    vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }

    local augroup = vim.api.nvim_create_augroup
    local autocmd = vim.api.nvim_create_autocmd
    autocmd(
        {"ColorScheme"},
        {
            group = augroup("quick_scope_colors", {clear = true}),
            pattern = "*",
            callback = require("BlakeJC94.configs.style").set_quickscope_colors,
        }
    )

    require("BlakeJC94.configs.style").set_quickscope_colors()
end

M.configure_pqf = function()
    require('pqf').setup({
        signs = {
            error = " ",
            warning = " ",
            info = " " ,
            hint = " ",
        }
    })
end


return M
