VIM_MAPS = {
    [''] = {
        -- Better splitting
        ['_'] = ':split<CR>',
        ['|'] = ':vsplit<CR>',
        -- Move left and right faster
        ['H'] = {map=[[col('.') == match(getline('.'), '\S') + 1 ? '0' : '^']], opts={expr=true, noremap=true}},
        ['L'] = '$',
        -- Prevent x and s from overriding what's in the clipboard
        ['x'] = '\"_x',
        ['X'] = '\"_X',
        ['s'] = '\"_s',
        ['S'] = '\"_S',
        -- Center screen and open folds when flicking through search matches
        ['n'] = 'nzzzv',
        ['N'] = 'Nzzzv',
        -- Easier redo command
        ['U'] = '<C-r>',
        -- Unmap Q
        ['Q'] = '',
        -- Redraw and remove highlights
        ['<C-l>'] = ':set hls!<CR><C-l>',
        -- gJ to split lines
        ['gJ'] = 'm`i<CR><Esc>``',
        -- Better jumplist for large line steps (and step through visual lines with j/k)
        ['j'] = {map=[[(v:count > 5 ? 'm`' . v:count : 'g') . 'j']], opts={expr=true, noremap=true}},
        ['k'] = {map=[[(v:count > 5 ? 'm`' . v:count : 'g') . 'k']], opts={expr=true, noremap=true}},
        -- Insert blank lines
        ['go'] = ':<C-u>call append(line("."), repeat([""], v:count1))<CR>',
        ['gO'] = ':<C-u>call append(line(".") - 1, repeat([""], v:count1))<CR>',
    },
    n = {
        -- Make Y behave like D and C
        ['Y']  = 'y$',
        -- gp: Visually select last pasted block (like gv)
        ['gp'] = '`[v`]',
        -- gF: create new file at filename over cursor
        ['gF'] = ':e <c-r><c-f><CR>',
        -- J doesn't move cursor
        ['J'] = 'mzJ`z',
        -- Change selected word (forward/backwards), . to repeat
        ['c*'] = "/\\<<C-r>=expand('<cword>')<CR>\\>\\C<CR>``cgn",
        ['c#'] = "?\\<<C-r>=expand('<cword>')<CR>\\>\\C<CR>``cgN",
        -- Delete selected word (forward/backwards), . to repeat
        ['d*'] = "/\\<<C-r>=expand('<cword>')<CR>\\>\\C<CR>``dgn",
        ['d#'] = "?\\<<C-r>=expand('<cword>')<CR>\\>\\C<CR>``dgN",
    },
    v = {
        -- Maintain Visual Mode after >/</= actions
        ['<'] = '<gv',
        ['>'] = '>gv',
        ['='] = '=gv',
        -- Move visual block up or down
        ['J'] = ":m '>+1<CR>gv",
        ['K'] = ":m '<-2<CR>gv",
        -- Stop p from overriding unnamed register
        ['p'] = "\"_dp",
        ['P'] = "\"_dP",
        -- Replace spaces in selection with underscores
        ['_']  = ":s/\\%V /_/g<CR>",
        ['g_'] = ":s/\\%V_/ /g<CR>",
        -- Wrap selection in quotes
        ['g"']  = 'm`<Esc>`>a"<Esc>`<i"<Esc>``',
        ['g\''] = "m`<Esc>`>a'<Esc>`<i'<Esc>``",
        ['g`']  = "m`<Esc>`>a`<Esc>`<i`<Esc>``",
        -- Wrap selection in brackets
        ['g(']  = "m`<Esc>`>a)<Esc>`<i(<Esc>``",
        ['g)']  = "m`<Esc>`>a)<Esc>`<i(<Esc>``",
        ['g]']  = "m`<Esc>`>a]<Esc>`<i[<Esc>``",
        ['g[']  = "m`<Esc>`>a]<Esc>`<i[<Esc>``",
        ['g}']  = "m`<Esc>`>a}<Esc>`<i{<Esc>``",
        ['g{']  = "m`<Esc>`>a}<Esc>`<i{<Esc>``",
        ['g>']  = "m`<Esc>`>a><Esc>`<i<<Esc>``",
        ['g<']  = "m`<Esc>`>a><Esc>`<i<<Esc>``",
    },
    i = {
        -- C-s : Quickly guess correct spelling errors (undoable)
        ['<C-s>'] = '<C-g>u<Esc>[S1z=`]a<c-g>u',
        -- Insert undo breakpoints when typing punctuation
        [','] = ',<C-g>u',
        ['.'] = '.<C-g>u',
        ['!'] = '!<C-g>u',
        ['?'] = '?<C-g>u',
        ['('] = '(<C-g>u',
        [')'] = ')<C-g>u',
        ['['] = '[<C-g>u',
        [']'] = ']<C-g>u',
        ['{'] = '{<C-g>u',
        ['}'] = '}<C-g>u',
        ['<'] = '<<C-g>u',
        ['>'] = '><C-g>u',
        ["'"] = "'<C-g>u",
        ['"'] = '"<C-g>u',
        ['`'] = '`<C-g>u',
    },
    o = {
        -- Custom text object: "around document"
        ['ad'] = '<Cmd>normal! ggVG<CR>',
        ['id'] = '<Cmd>normal! ggVG<CR>',
    },
    x = {
        -- Custom text object: "around document"
        ['ad'] = 'gg0oG$',
        ['id'] = 'gg0oG$',
    },
}
LEADER_MAPS = {
    [''] = {
        ['<Leader><CR>']  = ":Lir<CR>",                   -- File explorer
        ['<Leader><BS>']  = ":Telescope find_files<CR>",  -- Fuzzy file finder
        ['<Leader><Tab>'] = "<C-^>",                      -- Last file
        ['<Leader><Esc>'] = ":MaximizerToggle<CR>",       -- Maximise buffer
        ['<Leader>f'] = {map=[[/]], opts={noremap=true, silent=false}},            -- Find
        ['<Leader>F'] = {map=[[:%s///g<Left><Left><Left>]], opts={silent=false}},  -- Replace
        ['<Leader>q'] = ":q<CR>",                      -- L-q to quit
        ['<Leader>d'] = ":cd %:p:h<CR>:pwd<CR>",       -- Change dir to current
        ['<Leader>n'] = ":enew<CR>",                   -- New file
        ['<Leader>N'] = ":bufdo bdel | enew<CR>",      -- New session
        ['<Leader>t'] = ":tabedit<CR>",                -- New tab
        ['<Leader>c'] = ":ToggleCL<CR>",               -- Toggle qflist
        ['<Leader>l'] = ":ToggleLL<CR>",               -- Toggle loclist
        ['<Leader>s'] = ":Obsess<CR>",                 -- Start session
        ['<Leader>S'] = ":Obsess!<CR>",                -- Stop session
    },
}
TERMINAL_MAPS = {
    [''] = {
        -- Toggle terminal
        ['<C-z>']      = '',  -- Prevent vim from going to background
        ['<C-z><C-z>'] = {map=[[:exe v:count . "ToggleTerm direction=float"<CR>]], opts={silent=true, noremap=true}},
        ['<C-z>_']     = {map=[[:exe v:count . "ToggleTerm direction=horizontal"<CR>]], opts={silent=true, noremap=true}},
        ['<C-z>|']     = {map=[[:exe v:count . "ToggleTerm direction=vertical"<CR>]], opts={silent=true, noremap=true}},
        ['<C-z>n']     = ":call v:lua.nvtop_toggle()<CR>",
        ['<C-z>t']     = ":call v:lua.bashtop_toggle()<CR>",
        ['<C-z>g']     = ":call v:lua.lazygit_toggle()<CR>",
    },
    t = {
        -- <Esc><Esc> = (terminal) go to normal mode
        ['<Esc><Esc>'] = '<C-\\><C-n>',
        -- <Esc>: = (terminal) go to command mode
        ['<Esc>:'] = '<C-\\><C-n>:',
        -- ToggleTerm Hide
        ['<C-z>'] = '<C-\\><C-n>:ToggleTerm<CR>',
    },
}
ARROW_MAPS = {
    [''] = {
        -- Disable arrow keys
        ['<Left>']  = '',
        ['<Down>']  = '',
        ['<Up>']    = '',
        ['<Right>'] = '',
        -- [Ctrl + Arrow] to navigate windows
        ['<C-Left>']  = '<C-w>h',
        ['<C-Down>']  = '<C-w>j',
        ['<C-Up>']    = '<C-w>k',
        ['<C-Right>'] = '<C-w>l',
        -- [Shift + Arrow] Move splits (drop <C-\><C-n> if using vim)
        ['<S-Left>']  = '<C-w>H',
        ['<S-Down>']  = '<C-w>J',
        ['<S-Up>']    = '<C-w>K',
        ['<S-Right>'] = '<C-w>L',
        -- [Alt + Arrow] : resize splits
        ['<A-Left>']  = '<C-w>8<',
        ['<A-Down>']  = '<C-w>8-',
        ['<A-Up>']    = '<C-w>8+',
        ['<A-Right>'] = '<C-w>8>',
    },
    t = {
        -- [Ctrl + Arrow] to navigate windows
        ['<C-Left>']  = '<C-\\><C-n><C-w>h',
        ['<C-Down>']  = '<C-\\><C-n><C-w>j',
        ['<C-Up>']    = '<C-\\><C-n><C-w>k',
        ['<C-Right>'] = '<C-\\><C-n><C-w>l',
        -- [Shift + Arrow] Move splits
        ['<S-Left>']  = '<C-\\><C-n><C-w>H',
        ['<S-Down>']  = '<C-\\><C-n><C-w>J',
        ['<S-Up>']    = '<C-\\><C-n><C-w>K',
        ['<S-Right>'] = '<C-\\><C-n><C-w>L',
        -- [Alt + Arrow] : resize splits
        ['<A-Left>']  = '<C-\\><C-n><C-w>8<',
        ['<A-Down>']  = '<C-\\><C-n><C-w>8-',
        ['<A-Up>']    = '<C-\\><C-n><C-w>8+',
        ['<A-Right>'] = '<C-\\><C-n><C-w>8>',
    },
    c = {
        -- Make vertical wildmenu controls behave intuitively
        ['<Down>']  = {
            map=[[wildmenumode() ? "\<Right>" : "\<Down>"]],
            opts={expr=true, noremap=true},
        },
        ['<Up>']    = {
            map  = [[wildmenumode() ? "\<Left>" : "\<Up>"]],
            opts = {expr=true, noremap=true},
        },
        ['<Right>'] = {
            map  = [[wildmenumode() ? "\<Down>" : "\<Right>"]],
            opts = {expr=true, noremap=true},
        },
        ['<Left>']  = {
            map  = [[wildmenumode() ? "\<Up>" : "\<Left>"]],
            opts = {expr=true, noremap=true},
        },
    },
}
LSP_MAPS = {
    [''] = {
        -- Make K use lsp.hover, call twice to jump to hoverdoc
        ['K'] = ':lua vim.lsp.buf.hover()<CR>',
        -- Navigate diagnostics
        [']e'] = ':lua vim.lsp.diagnostic.goto_next()<CR>',
        ['[e'] = ':lua vim.lsp.diagnostic.goto_prev()<CR>',
        -- LSP bindings
        ['gd'] = ':LspDefinition<CR>',
        ['gD'] = ':LspDeclaration<CR>',
        ['gI'] = ':LspImplementation<CR>',
        ['gr'] = ':LspReferences<CR>',
        ['gy'] = ':LspTypeDefinition<CR>',
        -- LSP Leader bindings
        ['<Leader>e'] = ':LspLineDiagnostics<CR>',     -- Show line Diagnostics
        ['<Leader>r'] = ':LspRename<CR>',              -- Rename current symbol
        ['<Leader>k'] = ':LspSignature<CR>',           -- Show signature help
        ['<Leader>a'] = ':LspCodeAction<CR>',          -- Do code action
        ['<Leader>='] = ':LspFormat<CR>',              -- Format buffer
    },
}
GIT_MAPS = {
    [''] = {
        -- Navigate git changes
        [']g'] = {map=[[&diff ? ']g' : '<cmd>Gitsigns next_hunk<CR>']], opts={noremap=true, expr=true}},
        ['[g'] = {map=[[&diff ? '[g' : '<cmd>Gitsigns prev_hunk<CR>']], opts={noremap=true, expr=true}},
        -- Leader maps
        ['<Leader>gg'] = ":call v:lua.lazygit_toggle()<CR>",
        ['<Leader>gs'] = ':Gitsigns stage_hunk<CR>',
        ['<Leader>gu'] = ':Gitsigns undo_stage_hunk<CR>',
        ['<Leader>gr'] = ':Gitsigns reset_hunk<CR>',
        ['<Leader>gR'] = ':Gitsigns reset_buffer<CR>',
        ['<Leader>gp'] = ':Gitsigns preview_hunk<CR>',
        ['<Leader>gb'] = ':lua require("gitsigns").blame_line({full=true})<CR>',
        ['<Leader>gS'] = ':Gitsigns stage_buffer<CR>',
        ['<Leader>gU'] = ':Gitsigns reset_buffer_index<CR>',
    },
}
HARPOON_MAPS = {
    [''] = {
        ['<Leader>i'] = ":Harpoon<CR>",                -- Show Harpoon
        ['<Leader>I'] = ":HarpoonMark<CR>",            -- Mark for harpoon
        ['<leader>1'] = ':HarpoonNav 1<CR>',
        ['<leader>2'] = ':HarpoonNav 2<CR>',
        ['<leader>3'] = ':HarpoonNav 3<CR>',
        ['<leader>4'] = ':HarpoonNav 4<CR>',
        ['<leader>5'] = ':HarpoonNav 5<CR>',
        ['<leader>6'] = ':HarpoonNav 6<CR>',
        ['<leader>7'] = ':HarpoonNav 7<CR>',
        ['<leader>8'] = ':HarpoonNav 8<CR>',
        ['<leader>9'] = ':HarpoonNav 9<CR>',
    }
}
PACKER_MAPS = {
    [''] = {
        ['<Leader>pp'] = ':PackerSync<CR>',
        ['<Leader>pi'] = ':PackerInstall<CR>',
        ['<Leader>pu'] = ':PackerUpdate<CR>',
        ['<Leader>pc'] = ':PackerClean<CR>',
        ['<Leader>ps'] = ':PackerStatus<CR>',
    }
}
TELESCOPE_MAPS = {
    [''] = {
        ['<Leader>tb'] = ":Telescope buffers<CR>",                    -- Switch between buffers
        ['<Leader>tr'] = ":Telescope oldfiles<CR>",                   -- Recently changed files
        ['<Leader>tf'] = ":Telescope current_buffer_fuzzy_find<CR>",  -- Jumping with fuzzyfind
        ['<Leader>tg'] = ":Telescope live_grep<CR>",                  -- Jumping with livegrep
        ['<Leader>tt'] = ":Telescope treesitter<CR>",
        ['<Leader>th'] = ":Telescope help_tags<CR>",
    }
}

M = {}

M.load_mappings = function()
    vim.g.mapleader = " "
    local mappings = {
        VIM_MAPS,
        LEADER_MAPS,
        TERMINAL_MAPS,
        ARROW_MAPS,
        LSP_MAPS,
        GIT_MAPS,
        HARPOON_MAPS,
        PACKER_MAPS,
        TELESCOPE_MAPS,
    }
    for _, maps in ipairs(mappings) do
        require("utils").apply_maps(maps)
    end
end

return M
