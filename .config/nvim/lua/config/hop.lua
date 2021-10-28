require'hop'.setup {
    keys = 'asdghklqwertyuiopzxcvbnmfj',
}

vim.api.nvim_set_keymap('n', 's', "<cmd>HopWord<CR>", {})
vim.api.nvim_set_keymap('n', 'S', "<cmd>HopLine<CR>", {})
vim.api.nvim_set_keymap('n', '<Leader>s', "<cmd>HopChar1<CR>", {})

