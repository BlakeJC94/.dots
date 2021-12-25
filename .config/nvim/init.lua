local cmd = vim.cmd
local opt = vim.opt
local g = vim.g


-- -- PLUGINS ---------------------------------------------------------
plugins = require('plugins')  -- ~/.config/nvim/lua/plugins.lua

plugins.setup_packer()
plugins.disable_built_ins()
plugins.load_plugins()

-- -- LOAD CUSTOM FUNCTIONS ----------------------------------------------
cmd [[source ~/.config/nvim/vimscript/functions.vim]]

-- -- LOAD OPTIONS ----------------------------------------------

local behaviour_options = {
    -- MAIN INPUT/OUTPUT
    clipboard   = "unnamedplus",
    ttimeoutlen = 10,   --
    updatetime  = 300,  --
    -- TABS AND INDENTS
    smartindent = true,  -- Enable better indenting
    tabstop     = 4,     -- Number of space chars for each tab char
    softtabstop = 4,     -- Number of space chars to insert on pressing tab
    shiftwidth  = 4,     -- Number of space chars used when auto-indenting
    expandtab   = true,  -- Replace tabs with spaces when indenting with </>
    -- SEARCHING
    incsearch  = true,   -- HL while typing, smartcase search
    ignorecase = true,   --
    smartcase  = true,   --
    hlsearch   = false,  --
    -- BACKUPS AND SPELLING
    swapfile = false,  --
    backup   = false,  --
    spell    = true,   --
    undofile = true,   --
    undodir  = os.getenv "HOME" .. '/.vim/undodir',
}

local layout_options = {
    -- WINDOW DISPLAY
    splitbelow = true,  -- Open splits below
    splitright = true,  -- Open vsplits on right
    -- LINE DISPLAY
    scrolloff     = 8,      -- N lines to keep visible above/below cursor
    sidescrolloff = 8,      -- N columns to keep visible left/right of cursor
    textwidth     = 99,     -- Margin for text input
    wrap          = false,  --
    linebreak     = true,   --
    breakindent   = true,   --
    showmatch     = true,   -- Highlight matching brackets
    -- FOLDS
    foldmethod = 'indent',        --
    foldlevel  = 0,               -- Close all folds when opening file
    foldtext   = 'MyFoldText()',  --
    fillchars  = 'fold: ',        --
    -- LEFT MARGIN
    number         = true,     --
    relativenumber = true,     -- Show rel/abs line numbers
    signcolumn     = 'no',     -- Hide sign column
    -- RIGHT MARGIN
    colorcolumn = {100},  -- Set vertical margin
    -- BOTTOM MARGIN
    showcmd    = true,  -- Show command in bottom right
    cmdheight  = 2,     --
    wildignore = {'*.pyc', '**/.git/*', '**/data/*'},
    -- TOP MARGIN
    showtabline = 0,
}

-- Apply options
for _, options in pairs({behaviour_options, layout_options}) do
    for k, v in pairs(options) do
        vim.opt[k] = v
    end
end

-- Set colorscheme
opt.termguicolors           = true
opt.background              = 'dark'
g.gruvbox_italic            = 1
g.gruvbox_italicize_strings = 1
g.gruvbox_contrast_dark     = 'hard'
cmd [[colorscheme gruvbox]]


-- -- LOAD MAPPINGS ------------------------------------------------------

local maps = {
    [''] = {
        -- Better splitting
        ['_']  = ':split<CR>',
        ['|']  = ':vsplit<CR>',
        -- Move left and right faster
        ['H'] = '^',
        ['L'] = '$',
        -- Prevent x and s from overriding what's in the clipboard
        ['x']  = '\"_x',
        ['X']  = '\"_X',
        ['s']  = '\"_s',
        ['S']  = '\"_S',
        -- Center screen and open folds when flicking through search matches
        ['n']  = 'nzzzv',
        ['N']  = 'Nzzzv',
        -- Better jumplist for large line steps (and step through visual lines with j/k)
        ['j']  = {map=[[(v:count > 5 ? 'm`' . v:count : 'g') . 'j']], opts={expr=true, noremap=true}},
        ['k']  = {map=[[(v:count > 5 ? 'm`' . v:count : 'g') . 'k']], opts={expr=true, noremap=true}},
        -- Toggle terminal
        ['<C-z>'] = '',  -- Prevent vim from going to background
        ['<C-z><C-z>'] = {map=[[:exe v:count . "ToggleTerm direction=float"<CR>]], opts={silent=true, noremap=true}},
        ['<C-z>_']     = {map=[[:exe v:count . "ToggleTerm direction=horizontal"<CR>]], opts={silent=true, noremap=true}},
        ['<C-z>|']     = {map=[[:exe v:count . "ToggleTerm direction=vertical"<CR>]], opts={silent=true, noremap=true}},
        -- Disable arrow keys
        ['<Left>']  = '',
        ['<Down>']  = '',
        ['<Up>']    = '',
        ['<Right>'] = '',
    },
    n = {
        -- Make Y behave like D and C
        ['Y']  = 'y$',
        -- gp: Visually select last pasted block (like gv)
        ['gp'] = {map=[['`[' . getregtype()[0] . '`]']], opts={expr=true}},
        -- gF: create new file at filename over cursor
        ['gF'] = ':e <c-r><c-f><CR>',
        -- J doesn't move cursor
        ['J']  = 'mzJ`z',
        -- Make K use lsp.hover when not in a vim help page, call twice to jump to hoverdoc
        ['K']  = '<cmd>call ShowDocumentation()<CR>',
        -- Navigate git changes
        [']c'] = {map=[[&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>']], opts={noremap=true, expr=true}},
        ['[c'] = {map=[[&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>']], opts={noremap=true, expr=true}},
        -- Navigate diagnostics
        [']e'] = '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
        ['[e'] = '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
        -- LSP bindings
        ['gd'] = '<cmd>lua vim.lsp.buf.definition()<CR>',
        ['gD'] = '<cmd>lua vim.lsp.buf.declaration()<CR>',
        ['gI'] = '<cmd>lua vim.lsp.buf.implementation()<CR>',
        ['gr'] = '<cmd>lua vim.lsp.buf.references()<CR>',
        ['gy'] = '<cmd>lua vim.lsp.buf.type_definition()<CR>',
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
    v = {
        -- Maintain Visual Mode after >/</= actions
        ['<'] = '<gv',
        ['>'] = '>gv',
        ['='] = '=gv',
        -- Move visual block up or down
        ['J'] = ":m '>+1<CR>gv",
        ['K'] = ":m '<-2<CR>gv",
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
    t = {
        -- <Esc><Esc> = (terminal) go to normal mode
        ['<Esc><Esc>'] = '<C-\\><C-n>',
        -- <Esc>: = (terminal) go to command mode
        ['<Esc>:'] = '<C-\\><C-n>:',
        -- ToggleTerm Hide
        ['<C-z>'] = '<C-\\><C-n>:ToggleTerm<CR>',
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
    o = {
        -- Custom text object: "around document"
        ['ad'] = '<Cmd>normal! ggVG<CR>',
    },
    x = {
        -- Custom text object: "around document"
        ['ad'] = 'gg0oG$',
    },
}

vim.g.mapleader = " "
local leader_maps = {
    n = {
        -- META MAPS
        ['<Leader><CR>']  = ":lua require'lir.float'.toggle()<CR>",  -- File explorer
        ['<Leader><BS>']  = ":Telescope find_files<CR>",             -- Fuzzy finder
        ['<Leader><Tab>'] = "<C-^>",                                 -- Last file
        ['<Leader><Esc>'] = ":lua require('harpoon.ui').toggle_quick_menu()<CR>",  -- Show Harpoon
        -- KEY MAPS
        ['<Leader>q'] = ":q<CR>",                      -- L-q to quit
        ['<Leader>d'] = ":cd %:p:h<CR>:pwd<CR>",       -- Change dir to current
        ['<Leader>c'] = ":call ToggleQuickFix()<CR>",  -- Toggle qflist
        ['<Leader>l'] = ":call ToggleLocation()<CR>",  -- Toggle loclist
        ['<Leader>s'] = ":Obsess<CR>",                 -- Start recording session
        ['<Leader>s'] = ":Obsess!<CR>",                -- Stop recording session
        ['<Leader>h'] = ":set hls!<CR>",               -- Toggle highlights
        -- LSP MAPS
        ['<Leader>e']  = '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
        ['<Leader>k']  = '<cmd>lua vim.lsp.buf.signature_help()<CR>',
        ['<Leader>r']  = '<cmd>lua vim.lsp.buf.rename()<CR>',
        ['<Leader>a']  = '<cmd>lua vim.lsp.buf.code_action()<CR>',
        ['<Leader>=']  = '<cmd>lua vim.lsp.buf.formatting()<CR>',
        -- TELESCOPE MAPS
        ['<Leader>tb'] = ":Telescope buffers<CR>",                    -- Switch between buffers
        ['<Leader>tr'] = ":Telescope oldfiles<CR>",                   -- Recently changed files
        ['<Leader>tf'] = ":Telescope current_buffer_fuzzy_find<CR>",  -- Jumping with fuzzyfind
        ['<Leader>tg'] = ":Telescope live_grep<CR>",                  -- Jumping with livegrep
        ['<Leader>tt'] = ":Telescope treesitter<CR>",
        ['<Leader>th'] = ":Telescope help_tags<CR>",
        -- HARPOON MAPS
        ['<Leader>p'] = ":lua require('harpoon.mark').add_file()<CR>",         -- Mark for harpoon
        ['<leader>1'] = '<cmd>lua require("harpoon.ui").nav_file(1)<cr>',
        ['<leader>2'] = '<cmd>lua require("harpoon.ui").nav_file(2)<cr>',
        ['<leader>3'] = '<cmd>lua require("harpoon.ui").nav_file(3)<cr>',
        ['<leader>4'] = '<cmd>lua require("harpoon.ui").nav_file(4)<cr>',
        ['<leader>5'] = '<cmd>lua require("harpoon.ui").nav_file(5)<cr>',
        ['<leader>6'] = '<cmd>lua require("harpoon.ui").nav_file(6)<cr>',
        -- TOGGLETERM MAPS
        ['<Leader>n']  = ":call v:lua.nvtop_toggle()<CR>",
        ['<Leader>t']  = ":call v:lua.bashtop_toggle()<CR>",
        ['<Leader>gg'] = ":call v:lua.lazygit_toggle()<CR>",
        -- GITSIGNS MAPS
        ['<Leader>gs'] = '<cmd>Gitsigns stage_hunk<CR>',
        ['<Leader>gu'] = '<cmd>Gitsigns undo_stage_hunk<CR>',
        ['<Leader>gr'] = '<cmd>Gitsigns reset_hunk<CR>',
        ['<Leader>gR'] = '<cmd>Gitsigns reset_buffer<CR>',
        ['<Leader>gp'] = '<cmd>Gitsigns preview_hunk<CR>',
        ['<Leader>gb'] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
        ['<Leader>gS'] = '<cmd>Gitsigns stage_buffer<CR>',
        ['<Leader>gU'] = '<cmd>Gitsigns reset_buffer_index<CR>',
    },
}

-- Apply mappings
for _, list in pairs({maps, leader_maps}) do
    for mode, mappings in pairs(list) do
        for keys, mapping in pairs(mappings) do
            if (type(mapping) == "table") then
                vim.api.nvim_set_keymap(mode, keys, mapping.map, mapping.opts)
            else
                vim.api.nvim_set_keymap(mode, keys, mapping, {noremap=true, silent=true})
            end
        end
    end
end

-- -- LOAD AUTOCOMMANDS -----------------------------------------

autocommands = {
    ['default_cmds'] = {
        ['*'] = {
            {events='VimResized', cmd="wincmd ="},                   -- Auto-resize windows
            {events='BufWritePre', cmd="retab"},                     -- Replace tabs
            {events='BufWritePre', cmd="call TrimTrailingSpace()"},  -- Autoremove whitespace
            {events='InsertEnter', cmd='set cursorline'},            -- Insertmode cursorline on
            {events='InsertLeave', cmd='set nocursorline'},          -- Insertmode cursorline off
            {   -- Auto-highlight yanked text
                events='TextYankPost',
                cmd="silent! lua require'vim.highlight'.on_yank({timeout = 700})"
            },
            {   -- create nested directories if needed when creating files
                events='BufWritePre,FileWritePre',
                cmd="silent! call mkdir(expand('<afile>:p:h'), 'p')"
            },
        },
        ['term://*'] = {
            {   -- Quit vim if terminal is the only window left
                events='BufEnter,WinEnter',
                cmd="if tabpagenr('$') == 1 && winnr('$') == 1 | quit | endif"
            },
        },
    },
    ['extra_filetype_cmds'] = {
        -- help/cmd win/qf list: Press q to close and disable spellcheck
        "CmdwinEnter * nnoremap <buffer> q :q<CR>",
        "Filetype qf,help nnoremap <buffer> q :q<CR>",
        "Filetype qf,help setl nospell",
    },
    -- ['set_prgs'] = {
    --     "FileType c set formatprg=clang-format",
    --     "FileType Markdown set makeprg=pandoc\\ %:p\\ -o\\ %:p:h/out.pdf"
    -- },
    -- ['term_cmds'] = {
    --     ['term://*'] = {
    --         -- Bypass normal mode when changing focus to terminal buffer
    --         {events='BufWinEnter,WinEnter', cmd='startinsert'},
    --         -- Disable numbers and spelling in terminals
    --         {events='TermOpen', cmd='setlocal nonu nornu nospell'},
    --         -- Immediately close terminal window when process finishes
    --         {events='TermClose', cmd='quit'},
    --     }
    -- }
    -- ['cursorline_on_active_buffer'] = {
    --     ['*'] = {
    --         {events='VimEnter,WinEnter,BufWinEnter,Focusgained', cmd="setlocal cursorline"},
    --         {events='WinLeave,FocusLost', cmd="setlocal nocursorline"},
    --     },
    --     ['term://*'] = {
    --         {events='VimEnter,WinEnter,BufWinEnter,Focusgained', cmd="setl nocursorline"},
    --     }
    -- }
}

-- Set Autocommand
for group_name, group in pairs(autocommands) do
    vim.cmd('augroup ' .. group_name)
    vim.cmd('autocmd!')
    for filetype, autocmd in pairs(group) do
        if (type(autocmd) == "table") then
            for _, vals in pairs(autocmd) do
                local command = vim.tbl_flatten({'autocmd', vals.events, filetype, vals.cmd})
                local command = table.concat(command, ' ')
                vim.cmd(command)
            end
        else
            local command = table.concat(vim.tbl_flatten{'autocmd', autocmd}, ' ')
            vim.cmd(command)
        end
    end
    vim.cmd('augroup END')
end
