TERMINAL = {
    [''] = {
        -- <C-z> => Toggle terminal
        ['<C-z>'] = "<cmd>lua require('FTerm').toggle()<CR>",
    },
    t = {
        -- <Esc><Esc> => (terminal) go to normal mode
        ['<Esc><Esc>'] = '<C-\\><C-n>',
        -- <Esc>: => (terminal) go to command mode
        ['<Esc>:'] = '<C-\\><C-n>:',
        -- <C-z> => ToggleTerm Hide
        ['<C-z>'] = "<C-\\><C-n>:lua require('FTerm').toggle()<CR>",
    },
    i = {
        ['<C-z>'] = "<Esc>:lua require('FTerm').toggle()<CR>",
    }
}

return TERMINAL
