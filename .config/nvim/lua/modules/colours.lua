M = {}

-- Colorscheme
M["ellisonleao/gruvbox.nvim"] = {
    requires = {"rktjmp/lush.nvim"},
    config = function()
        vim.cmd [[
            augroup colorscheme_overrides
                autocmd!
                autocmd ColorScheme * hi Folded guibg='#282828'
                autocmd ColorScheme * hi ColorColumn guibg='#282828'
                autocmd ColorScheme * hi CursorLine guibg='#282828'
                autocmd ColorScheme * hi CursorLineNr guibg='#282828'
            augroup END
        ]]
        vim.g.gruvbox_italic            = 1
        vim.g.gruvbox_contrast_dark     = 'hard'
        vim.g.gruvbox_italicize_strings = 1
        vim.cmd [[colorscheme gruvbox]]
    end,
}

-- Better f/t targets
M["unblevable/quick-scope"] = {
    config = function()
        vim.g.qs_max_chars=800
        vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}
        vim.cmd [[
            function! QSColors()
                highlight QuickScopePrimary guifg='#ff007c' gui=bold ctermfg=198 cterm=bold
                highlight QuickScopeSecondary guifg='#00dfff' gui=bold ctermfg=45 cterm=bold
            endfunction
            call QSColors()
            augroup qs_colors
                autocmd!
                autocmd ColorScheme * call QSColors()
            augroup END
        ]]
    end
}

-- Colors Hex codes
M['norcalli/nvim-colorizer.lua'] = {
    config = function() require("colorizer").setup({'*'}, {names=false}) end
}

return M
