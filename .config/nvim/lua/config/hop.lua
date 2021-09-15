require'hop'.setup {
    keys = 'asdghklqwertyuiopzxcvbnmfj',
}

vim.api.nvim_set_keymap('n', 's', "<cmd>HopWord<CR>", {})
vim.api.nvim_set_keymap('n', 'S', "<cmd>HopLine<CR>", {})
vim.api.nvim_set_keymap('n', '<Leader>s', "<cmd>HopChar1<CR>", {})

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
