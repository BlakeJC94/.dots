_G._configs.quick_scope_colors = function()
    vim.cmd.highlight("QuickScopePrimary guifg='#ff007c' gui=bold ctermfg=198 cterm=bold")
    vim.cmd.highlight("QuickScopeSecondary guifg='#00dfff' gui=bold ctermfg=45 cterm=bold")
end

return {
    config = function()
        vim.g.qs_max_chars = 800
        vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }

        _G._configs.quick_scope_colors()

        local augroup = vim.api.nvim_create_augroup
        local autocmd = vim.api.nvim_create_autocmd

        autocmd(
            {"ColorScheme"},
            {
                group = augroup("quick_scope_colors", {clear = true}),
                pattern = "*",
                callback = _G._configs.quick_scope_colors,
            }
        )
    end,
}
