require'hop'.setup {
    keys = 'asdghklqwertyuiopzxcvbnmfj',
}

vim.api.nvim_set_keymap('n', '<Leader>w', "<cmd>HopWord<CR>", {})
vim.api.nvim_set_keymap('n', '<Leader>r', "<cmd>HopLine<CR>", {})
vim.api.nvim_set_keymap('n', '<Leader>c', "<cmd>HopChar1<CR>", {})

-- vim.cmd [[autocmd! Colorscheme * echo "TRACE" ]]
