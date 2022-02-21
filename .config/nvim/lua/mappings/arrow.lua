ARROW = {
    [''] = {
        -- Disable arrow keys
        ['<Left>']  = '',
        ['<Down>']  = '',
        ['<Up>']    = '',
        ['<Right>'] = '',
        -- [Ctrl + Arrow] to navigate windows
        ['<C-Left>']  = ':wincmd h<CR>',
        ['<C-Down>']  = ':wincmd j<CR>',
        ['<C-Up>']    = ':wincmd k<CR>',
        ['<C-Right>'] = ':wincmd l<CR>',
        -- [Shift + Arrow] Move splits (drop <C-\><C-n> if using vim)
        ['<S-Left>']  = ':wincmd H<CR>',
        ['<S-Down>']  = ':wincmd J<CR>',
        ['<S-Up>']    = ':wincmd K<CR>',
        ['<S-Right>'] = ':wincmd L<CR>',
        -- [Alt + Arrow] : resize splits
        ['<A-Left>']  = ':vertical resize -8<CR>',
        ['<A-Down>']  = ':resize -8<CR>',
        ['<A-Up>']    = ':resize +8<CR>',
        ['<A-Right>'] = ':vertical resize +8<CR>',
    },
    t = {
        -- [Ctrl + Arrow] to navigate windows
        ['<C-Left>']  = '<C-\\><C-n>:wincmd h<CR>',
        ['<C-Down>']  = '<C-\\><C-n>:wincmd j<CR>',
        ['<C-Up>']    = '<C-\\><C-n>:wincmd k<CR>',
        ['<C-Right>'] = '<C-\\><C-n>:wincmd l<CR>',
        -- [Shift + Arrow] Move splits
        ['<S-Left>']  = '<C-\\><C-n>:wincmd H<CR>',
        ['<S-Down>']  = '<C-\\><C-n>:wincmd J<CR>',
        ['<S-Up>']    = '<C-\\><C-n>:wincmd K<CR>',
        ['<S-Right>'] = '<C-\\><C-n>:wincmd L<CR>',
        -- [Alt + Arrow] : resize splits
        ['<A-Left>']  = '<C-\\><C-n>:vertical resize -8<CR>',
        ['<A-Down>']  = '<C-\\><C-n>:resize -8<CR>',
        ['<A-Up>']    = '<C-\\><C-n>:resize +8<CR>',
        ['<A-Right>'] = '<C-\\><C-n>:vertical resize +8<CR>',
    },
    c = {
        -- Make vertical wildmenu controls behave intuitively
        ['<Down>']  = {
            map  = [[wildmenumode() ? "\<Right>" : "\<Down>"]],
            opts = {expr=true, silent=false},
        },
        ['<Up>']    = {
            map  = [[wildmenumode() ? "\<Left>" : "\<Up>"]],
            opts = {expr=true, silent=false},
        },
        ['<Right>'] = {
            map  = [[wildmenumode() ? "\<Down>" : "\<Right>"]],
            opts = {expr=true, silent=false},
        },
        ['<Left>']  = {
            map  = [[wildmenumode() ? "\<Up>" : "\<Left>"]],
            opts = {expr=true, silent=false},
        },
    },
}

return ARROW
