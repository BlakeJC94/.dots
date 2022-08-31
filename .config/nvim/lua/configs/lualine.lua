return function()
    require("lualine").setup({
        options = {
            icons_enabled = true,
            theme = 'gruvbox',
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
            disabled_filetypes = {},
            always_divide_middle = true,
            globalstatus = true,
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = { { 'tabs', mode = 1, } },
            lualine_c = {'lsp_progress'},
            lualine_x = {'filetype'},
            lualine_y = {'location', 'progress', 'diff'},
            lualine_z = {'branch'},
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
        extensions = {}
    })
end
