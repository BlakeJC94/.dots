local default_colourscheme = "gruvbox"

local color_midpoint = require("BlakeJC94.functions").color_midpoint

local function configure_gruvbox()
    local gruvbox = require("gruvbox")
    local palette = require('gruvbox.palette')

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
        indent_blankline = {
            IndentBlanklineContextChar = { fg = palette.light4 },
        }
    }

    for plugin, overrides in pairs(plugin_overrides) do
        local ok, _ = pcall(require, plugin)
        if ok then
            for group, settings in pairs(overrides) do
                vim.api.nvim_set_hl(0, group, settings)
            end
        end
    end
end


local function configure_lualine(colourscheme)
    local colourscheme = colourscheme or default_coloursscheme
    require("lualine").setup({
        options = {
            icons_enabled = true,
            theme = colourscheme,
            component_separators = { left = "│", right = "│" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {},
            always_divide_middle = true,
            globalstatus = true,
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { { "tabs", mode = 1 } },
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


local function configure_quick_scope()
    vim.cmd.highlight("QuickScopePrimary guifg='#ff007c' gui=bold ctermfg=198 cterm=bold")
    vim.cmd.highlight("QuickScopeSecondary guifg='#00dfff' gui=bold ctermfg=45 cterm=bold")
end

local function configure_pqf()
    require('pqf').setup({
        signs = {
            error = " ",
            warning = " ",
            info = " " ,
            hint = " ",
        }
    })
end

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
autocmd(
    {"ColorScheme"},
    {
        group = augroup("quick_scope_colors", {clear = true}),
        pattern = "*",
        callback = configure_quick_scope,
    }
)

local function setup_colours(colourscheme)
    local colourscheme = colourscheme or default_colourscheme
    if colourscheme == 'gruvbox' then configure_gruvbox() end
    configure_lualine(colourscheme)
    configure_quick_scope()
    configure_pqf()
    vim.cmd.colorscheme(colourscheme)
end

setup_colours()

