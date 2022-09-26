return {
    requires = {"lukas-reineke/virt-column.nvim"},
    config = function()
        require("indent_blankline").setup({
            show_current_context = true,
            show_current_context_start = false,
            filetype_exclude = _G._configs.filetype_exclude,
            buftype_exclude = {"terminal"},
        })
    end
}
