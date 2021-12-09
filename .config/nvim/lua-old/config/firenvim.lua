-- set specific filetypes for websites
vim.cmd [[ au BufEnter github.com_*.txt set filetype=markdown ]]

vim.g.firenvim_config = {
    globalSettings = {
        alt = 'all',
    },
    localSettings = {
        ['.*'] = {
            cmdline= 'neovim',
            content= 'text',
            priority= 0,
            selector= 'textarea',
            takeover= 'never', -- disable until called with firefox hotkey <C-e>
        }
    },
}

