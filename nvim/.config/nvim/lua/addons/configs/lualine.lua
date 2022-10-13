_G._configs.lualine_search_count = function()
    if vim.v.hlsearch == 0 then return "" end
    local result = vim.fn.searchcount()
    local total = math.min(result.total, result.maxcount) or 99
    local current = result.current
    return string.format("[%d/%d]", result.current, total)
end

_G._configs.hello = function()
    return [[hello world]]
end

return {
    requires = {
        "kyazdani42/nvim-web-devicons",
        "arkav/lualine-lsp-progress",
    },
    config = function()
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
                lualine_b = { { "tabs", mode = 1 } },
                lualine_c = { "lsp_progress" },
                lualine_x = { _G._configs.lualine_search_count , "filetype" },
                -- lualine_x = { _G._configs._lualine_search_count, "filetype" },
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
    end,
}
