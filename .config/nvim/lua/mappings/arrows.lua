return {
    [''] = {
        -- Disable arrow keys, git gud with hjkl! (and bwe)
        ['<Left>']  = '',
        ['<Down>']  = '',
        ['<Up>']    = '',
        ['<Right>'] = '',
        ['<C-Left>']  = '',
        ['<C-Down>']  = '',
        ['<C-Up>']    = '',
        ['<C-Right>'] = '',
        ['<S-Left>']  = '',
        ['<S-Down>']  = '',
        ['<S-Up>']    = '',
        ['<S-Right>'] = '',
    },
    c = {
        -- Intuitive vertical wildmenu controls
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

