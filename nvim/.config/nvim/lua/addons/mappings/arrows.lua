return {
    [''] = {
        -- Disable arrow keys, git gud with hjkl! (and bwe)
        ['<Left>']  = '',
        ['<Down>']  = '',
        ['<Up>']    = '',
        ['<Right>'] = '',
        ['<C-Left>']  = function() require('smart-splits').resize_left(8) end,
        ['<C-Up>']    = function() require('smart-splits').resize_up(4) end,
        ['<C-Down>']  = function() require('smart-splits').resize_down(4) end,
        ['<C-Right>'] = function() require('smart-splits').resize_right(8) end,
        ['<S-Left>']  = '',
        ['<S-Down>']  = '',
        ['<S-Up>']    = '',
        ['<S-Right>'] = '',
        ['<A-Left>']  = '',
        ['<A-Down>']  = '',
        ['<A-Up>']    = '',
        ['<A-Right>'] = '',
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

