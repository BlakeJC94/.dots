VIM_MAPS = {
    [''] = {
        -- Better splitting
        ['_'] = ':split<CR>',
        ['|'] = ':vsplit<CR>',
        ['\\'] = ':tabedit %<CR>',
        -- Move left and right faster
        ['H'] = {map=[[col('.') == match(getline('.'), '\S') + 1 ? '0' : '^']], opts={expr=true}},
        ['L'] = 'g_',
        -- Prevent x and s from overriding what's in the clipboard
        ['x'] = '"_x',
        ['X'] = '"_X',
        ['s'] = '"_s',
        ['S'] = '"_S',
        -- Open folds when flicking through search matches
        ['n'] = 'nzv',
        ['N'] = 'Nzv',
        -- Unmap q (and map Q to q to stop polluting registers accidentally!)
        ['q'] = '',
        ['Q'] = 'q',
        -- Redraw and toggle highlights
        -- ['<C-l>'] = ':set hls!<CR><C-l>',
        -- tab out
        -- ['<S-Tab>'] = ':lua require("utils").jabarg()<CR>',  -- TODO
        -- gJ to split lines
        ['gK'] = 'm`i<CR><Esc>``',
        -- Navigate quickfix lists
        ['[l'] = ':<C-U>lprevious<CR>zv',
        [']l'] = ':<C-U>lnext<CR>zv',
        ['[L'] = ':<C-U>lfirst<CR>zv',
        [']L'] = ':<C-U>llast<CR>zv',
        ['[c'] = ':<C-U>cprevious<CR>zv',
        [']c'] = ':<C-U>cnext<CR>zv',
        ['[C'] = ':<C-U>cfirst<CR>zv',
        [']C'] = ':<C-U>clast<CR>zv',
    },
    n = {
        -- Make Y behave like D and C
        ['Y']  = 'y$',
        -- Clear last search hl with <ESC> before <ESC> action
        ['<ESC>'] = ':noh<CR><ESC>',
        -- Better jumplist for large line steps (and step through visual lines with j/k)
        ['j'] = {map=[[(v:count > 5 ? 'm`' . v:count : 'g') . 'j']], opts={expr=true}},
        ['k'] = {map=[[(v:count > 5 ? 'm`' . v:count : 'g') . 'k']], opts={expr=true}},
        -- gp: Visually select last pasted block (like gv)
        ['gp'] = '`[v`]',
        -- gF: create new file at filename over cursor
        ['gF'] = ':e <c-r><c-f><CR>',
        -- Insert blank lines
        ['go'] = ':<C-u>call append(line("."), repeat([""], v:count1))<CR>',
        ['gO'] = ':<C-u>call append(line(".") - 1, repeat([""], v:count1))<CR>',
        -- Insert spaces
        ['g<Space>'] = 'i ',
        -- J doesn't move cursor
        ['J'] = 'mzJ`z',
        -- Make {/} don't change the the jumplist
        ['{'] = ':<C-u>keepjumps norm! {<CR>',
        ['}'] = ':<C-u>keepjumps norm! }<CR>',
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
        ['p'] = "pgvy",
        ['P'] = "Pgvy",
        -- Replace spaces in selection with underscores
        ['_']  = ":s/\\%V /_/g<CR>",
        ['g_'] = ":s/\\%V_/ /g<CR>",
        -- Wrap selection in quotes  USE v<sel>S<char> or ys<motion><char>
        -- ['g"']  = 'm`<Esc>`>a"<Esc>`<i"<Esc>``',
        -- ['g\''] = "m`<Esc>`>a'<Esc>`<i'<Esc>``",
        -- ['g`']  = "m`<Esc>`>a`<Esc>`<i`<Esc>``",
        -- -- Wrap selection in brackets
        -- ['g(']  = "m`<Esc>`>a)<Esc>`<i(<Esc>``",
        -- ['g)']  = "m`<Esc>`>a)<Esc>`<i(<Esc>``",
        -- ['g]']  = "m`<Esc>`>a]<Esc>`<i[<Esc>``",
        -- ['g[']  = "m`<Esc>`>a]<Esc>`<i[<Esc>``",
        -- ['g}']  = "m`<Esc>`>a}<Esc>`<i{<Esc>``",
        -- ['g{']  = "m`<Esc>`>a}<Esc>`<i{<Esc>``",
        -- ['g>']  = "m`<Esc>`>a><Esc>`<i<<Esc>``",
        -- ['g<']  = "m`<Esc>`>a><Esc>`<i<<Esc>``",
    },
    i = {
        -- C-s : Quickly guess correct spelling errors (undoable)
        ['<C-s>'] = '<C-g>u<Esc>[s1z=`]a<c-g>u',
        -- Bash keyboard shortcut during insert mode
        ['<C-a>'] = "<C-o>0",    -- Goto BEGINNING of command line
        ['<C-e>'] = "<C-o>$",    -- Goto END of command line
        ['<C-b>'] = "<C-o>h",    -- move back one character
        ['<C-f>'] = "<C-o>l",    -- move forward one character
        ['<A-f>'] = "<C-o>w",    -- move cursor FORWARD one word
        ['<A-b>'] = "<C-o>b",    -- move cursor BACK one word
        ['<A-d>'] = "<C-o>dw",   -- delete the word FROM the cursor
        -- Put semicolon/comma at end of line (; is a pseudo-leader)
        [';,'] = "<Esc>m`A,<Esc>``a",
        [';;'] = "<Esc>m`A;<Esc>``a",
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
        ['<Leader><BS>']  = ":Telescope find_files<CR>",  -- File finder
        ['<Leader><Tab>'] = "<C-^>",                      -- Last file
        ['<Leader><Esc>'] = ":Telescope buffers<CR>",     -- Buffers
        ['<Leader>q'] = ":q<CR>",                      -- Quit
        ['<Leader>Q'] = ":q!<CR>",                     -- Quit without saving
        ['<Leader>d'] = ":lcd %:p:h<CR>:pwd<CR>",      -- Change dir to current
        ['<Leader>D'] = ":cd %:p:h<CR>:pwd<CR>",       -- Change buffer dir to current
        ['<Leader>n'] = ":enew<CR>",                   -- New file
        ['<Leader>N'] = ":bufdo bdel | enew<CR>",      -- New session
        ['<Leader>h'] = ":set hls!<CR>",               -- Toggle highlights
        ['<Leader>c'] = ":ToggleCL<CR>",               -- Toggle qflist
        ['<Leader>l'] = ":ToggleLL<CR>",               -- Toggle loclist
        ['<Leader>s'] = ":setl spell!<CR>",            -- Toggle spelling
        ['<Leader>;'] = ":Settings<CR>",               -- Edit settings
        ['<Leader>:'] = ":luafile $MYVIMRC<CR>",       -- Reload settings
        ['<Leader>z'] = ":Twighlight<CR>",             -- Toggle FocusMode
        ['<Leader>Z'] = ":ZenMode<CR>",                -- Toggle ZenMode
        ['<Leader>v'] = ":lua Toggle_venn()<CR>",      -- Draw diagrams with <sel> and HJKL
        ['<Leader>x'] = ':lua require("nabla").action()<CR>',
        ['<Leader>X'] = ':lua require("nabla").popup()<CR>',
        ['<Leader>A'] = ":Neogen<CR>",
    },
}
TERMINAL_MAPS = {
    [''] = {
        -- Toggle terminal
        -- ['<C-z>'] = "<cmd>exe (v:count > 0 ? v:count : '' ) . 'ToggleTerm direction=float'<CR>",
        ['<C-z>'] = "<cmd>exe v:count . 'ToggleTerm direction=float'<CR>",
        -- ['<C-z>_']     = ":exe v:count1 . 'ToggleTerm direction=horizontal'<CR>",
        -- ['<C-z>|']     = ":exe v:count1 . 'ToggleTerm direction=vertical'<CR>",
        -- ['<C-z>n']     = ":call v:lua.nvtop_toggle()<CR>",
        -- ['<C-z>t']     = ":call v:lua.bashtop_toggle()<CR>",
        -- ['<C-z>g']     = ":call v:lua.lazygit_toggle()<CR>",
    },
    t = {
        -- <Esc><Esc> = (terminal) go to normal mode
        ['<Esc><Esc>'] = '<C-\\><C-n>',
        -- <Esc>: = (terminal) go to command mode
        ['<Esc>:'] = '<C-\\><C-n>:',
        -- ToggleTerm Hide
        ['<C-z>'] = '<C-\\><C-n>:ToggleTerm<CR>',
    },
    i = {
        ['<C-z>'] = "<Esc><cmd>exe v:count . 'ToggleTerm direction=float'<CR>",
    }
}
ARROW_MAPS = {
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
LSP_MAPS = {
    [''] = {
        -- Navigate diagnostics
        [']e'] = ':lua vim.diagnostic.goto_next()<CR>',
        ['[e'] = ':lua vim.diagnostic.goto_prev()<CR>',
        -- LSP bindings
        ['gd'] = ':LspDefinition<CR>',
        ['gD'] = ':LspDeclaration<CR>',
        ['gI'] = ':LspImplementation<CR>',
        ['gr'] = ':LspReferences<CR>',
        ['gy'] = ':LspTypeDefinition<CR>',
        -- LSP Leader bindings
        ['<Leader>e'] = ':LspLineDiagnostics<CR>',     -- Show line diagnostics
        ['<Leader>E'] = ':lua vim.diagnostic.setloclist()<CR>',  -- Show buffer diagnostics
        ['<Leader>r'] = ':LspRename<CR>',              -- Rename current symbol
        ['<Leader>k'] = ':LspSignature<CR>',           -- Show signature help
        ['<Leader>a'] = ':LspCodeAction<CR>',          -- Do code action
        ['<Leader>='] = ':LspFormat<CR>',              -- Format buffer
    },
    n = {
        -- Make K use lsp.hover, call twice to jump to hoverdoc
        ['K'] = ':lua vim.lsp.buf.hover()<CR>',
    }
}
GIT_MAPS = {
    [''] = {
        -- Navigate git changes in file
        [']g'] = {map=[[&diff ? ']g' : '<cmd>Gitsigns next_hunk<CR>']], opts={expr=true}},
        ['[g'] = {map=[[&diff ? '[g' : '<cmd>Gitsigns prev_hunk<CR>']], opts={expr=true}},
        -- Leader maps
        ['<Leader>G']  = ':Git<CR>',
        ['<Leader>gg'] = ':Gitsigns setqflist<CR>',
        ['<Leader>gs'] = ':Gitsigns stage_hunk<CR>',
        ['<Leader>gu'] = ':Gitsigns undo_stage_hunk<CR>',
        ['<Leader>gr'] = ':Gitsigns reset_hunk<CR>',
        ['<Leader>gR'] = ':Gitsigns reset_buffer<CR>',
        ['<Leader>gp'] = ':Gitsigns preview_hunk<CR>',
        ['<Leader>gb'] = ':lua require("gitsigns").blame_line({full=true})<CR>',
        ['<Leader>gS'] = ':Gitsigns stage_buffer<CR>',
        ['<Leader>gU'] = ':Gitsigns reset_buffer_index<CR>',
        ['<Leader>gd'] = ':vert Gdiffsplit<CR>',
        ['<Leader>gc'] = ':GV<CR>',
    },
}
PACKER_MAPS = {
    [''] = {
        ['<Leader>pp'] = ':PackerSync<CR>',
        ['<Leader>pi'] = ':PackerInstall<CR>',
        ['<Leader>pu'] = ':PackerUpdate<CR>',
        ['<Leader>pc'] = ':PackerCompile<CR>',
        ['<Leader>pr'] = ':PackerClean<CR>',
        ['<Leader>ps'] = ':PackerStatus<CR>',
    }
}
TELESCOPE_MAPS = {
    [''] = {
        ['<Leader>tt'] = ":Telescope<CR>",                            -- Find Telescopes
        ['<Leader>tb'] = ":Telescope buffers<CR>",                    -- Switch between buffers
        ['<Leader>tr'] = ":Telescope registers<CR>",                  -- Switch between buffers
        ['<Leader>to'] = ":Telescope oldfiles<CR>",                   -- Recently changed files
        ['<Leader>tf'] = ":Telescope current_buffer_fuzzy_find<CR>",  -- Jumping with fuzzyfind
        ['<Leader>tF'] = ":Telescope live_grep<CR>",                  -- Jumping with livegrep
        ['<Leader>th'] = ":Telescope help_tags<CR>",
        ['<Leader>tg'] = ":Telescope git_status<CR>",
        ['<Leader>tc'] = ":Telescope quickfix<CR>",
        ['<Leader>tl'] = ":Telescope loclist<CR>",
        ['<Leader>ts'] = ":Telescope spell_suggest<CR>",
        ['<Leader>ta'] = ":Telescope lsp_code_actions<CR>",
    }
}

M = {}

M.apply_maps = function(maps)
    -- TODO docs
    local default_opts = {noremap = true, silent = true}

    for mode, mappings in pairs(maps) do
        for keys, mapping in pairs(mappings) do
            if (type(mapping) == "table") then
                local opts = vim.tbl_extend('force', default_opts, mapping.opts)
                vim.api.nvim_set_keymap(mode, keys, mapping.map, opts)
            else
                vim.api.nvim_set_keymap(mode, keys, mapping, default_opts)
            end
        end
    end
end

M.load_mappings = function()
    vim.g.mapleader = " "
    local mappings = {
        VIM_MAPS,
        LEADER_MAPS,
        TERMINAL_MAPS,
        ARROW_MAPS,
        LSP_MAPS,
        GIT_MAPS,
        PACKER_MAPS,
        TELESCOPE_MAPS,
    }
    for _, maps in ipairs(mappings) do
        require("mappings").apply_maps(maps)
    end
end

return M
