-- -- BLAKEJC94S NEOVIM INIT.LUA ------------------------------------------------------------------

-- -- PLUGINS -------------------------------------------------------------------------------------

plugins = require('plugins')  -- ~/.config/nvim/lua/plugins.lua

plugins.setup_packer()
plugins.disable_built_ins()
plugins.load_plugins()


-- -- LOAD CUSTOM FUNCTIONS -----------------------------------------------------------------------

vim.cmd([[source ~/.config/nvim/vimscript/functions.vim]])
vim.cmd([[source ~/.config/nvim/vimscript/commands.vim]])
vim.cmd([[source ~/.config/nvim/vimscript/abbrevs.vim]])


-- -- LOAD OPTIONS --------------------------------------------------------------------------------

local behaviour_options = {
    -- MAIN INPUT/OUTPUT
    clipboard     = "unnamedplus",  -- Allows vim to use "+ for yanks
    timeoutlen    = 600,      -- Time (ms) between key sequences
    ttimeoutlen   = 10,       -- Time (ms) between key sequences in terminal
    updatetime    = 300,      -- Time (ms) between swapfile writes
    virtualedit   = "block",  -- Allow cursor to move anywhere ('all', 'block', 'insert')
    -- TABS AND INDENTS
    smartindent = true,  -- Enable better indenting
    tabstop     = 4,     -- Number of space chars for each tab char
    softtabstop = 4,     -- Number of space chars to insert on pressing tab
    shiftwidth  = 4,     -- Number of space chars used when auto-indenting
    expandtab   = true,  -- Replace tabs with spaces when indenting with </>
    -- SEARCHING
    ignorecase = true,   -- Ignore cases in search patterns
    smartcase  = true,   -- Use case-sensitve search when an uppercase letter is used
    hlsearch   = true,   -- Highlight matches
    incsearch  = true,   -- Highlight matches while typing
    -- BACKUPS AND SPELLING
    swapfile = false,  -- Allow swap files
    backup   = false,  -- Allow creation of backup files
    spell    = true,   -- Built-in spell-checker
    undofile = true,   -- Create global undofile
    undodir  = os.getenv("HOME") .. '/.vim/undodir',
}

local layout_options = {
    -- WINDOW DISPLAY
    splitbelow    = true,    -- Open splits below
    splitright    = true,    -- Open vsplits on right
    termguicolors = true,    -- Wider colorscheme support
    background    = 'dark',  -- Background mode
    -- LINE DISPLAY
    scrolloff     = 8,      -- N lines to keep visible above/below cursor
    sidescrolloff = 8,      -- N columns to keep visible left/right of cursor
    textwidth     = 99,     -- Margin for text input
    wrap          = false,  -- Soft-wrap long lines
    linebreak     = true,   -- Only split/wrap long lines after words
    breakindent   = true,   -- Indent soft-wrapped lines
    showmatch     = true,   -- Highlight matching brackets
    -- FOLDS
    foldmethod = 'indent',        -- Auto-create folds by indent levels
    foldlevel  = 0,               -- Close all folds when opening file
    foldtext   = 'MyFoldText()',  -- Custom fold text
    fillchars  = 'fold: ',        -- Replace dots with spaces in fold head
    -- LEFT MARGIN
    number         = true,  -- Show line numbers
    relativenumber = true,  -- Show rel/abs line numbers
    signcolumn     = 'no',  -- Set sign column
    -- RIGHT MARGIN
    colorcolumn = {100},  -- Set visual vertical margin
    -- BOTTOM MARGIN
    showcmd    = true,  -- Show command in bottom right
    cmdheight  = 2,     -- Set height of command window
    wildignore = {'*.pyc', '**/.git/*', '**/data/*'},
    -- TOP MARGIN
    title = true,     -- Show doc name in terminal window title
    showtabline = 0,  -- Display tab line
}

for _, options in pairs({behaviour_options, layout_options}) do
    for k, v in pairs(options) do
        vim.opt[k] = v
    end
end


-- -- LOAD MAPPINGS -------------------------------------------------------------------------------

local maps = {
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
        -- Toggle terminal
        ['<C-z>']      = '',  -- Prevent vim from going to background
        ['<C-z><C-z>'] = {map=[[:exe v:count . "ToggleTerm direction=float"<CR>]], opts={silent=true, noremap=true}},
        ['<C-z>_']     = {map=[[:exe v:count . "ToggleTerm direction=horizontal"<CR>]], opts={silent=true, noremap=true}},
        ['<C-z>|']     = {map=[[:exe v:count . "ToggleTerm direction=vertical"<CR>]], opts={silent=true, noremap=true}},
        ['<C-z>n']     = ":call v:lua.nvtop_toggle()<CR>",
        ['<C-z>t']     = ":call v:lua.bashtop_toggle()<CR>",
        ['<C-z>g']     = ":call v:lua.lazygit_toggle()<CR>",
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
        ['J'] = 'mzJ`z',
        -- Make K use lsp.hover when not in a vim help page, call twice to jump to hoverdoc
        ['K'] = '<cmd>call ShowDocumentation()<CR>',
        -- Change selected word (forward/backwards), . to repeat
        ['c*'] = "/\\<<C-r>=expand('<cword>')<CR>\\>\\C<CR>``cgn",
        ['c#'] = "?\\<<C-r>=expand('<cword>')<CR>\\>\\C<CR>``cgN",
        -- Delete selected word (forward/backwards), . to repeat
        ['d*'] = "/\\<<C-r>=expand('<cword>')<CR>\\>\\C<CR>``dgn",
        ['d#'] = "?\\<<C-r>=expand('<cword>')<CR>\\>\\C<CR>``dgN",
        -- Navigate git changes
        [']g'] = {map=[[&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>']], opts={noremap=true, expr=true}},
        ['[g'] = {map=[[&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>']], opts={noremap=true, expr=true}},
        -- Navigate diagnostics
        [']e'] = ':lua vim.lsp.diagnostic.goto_next()<CR>',
        ['[e'] = ':lua vim.lsp.diagnostic.goto_prev()<CR>',
        -- LSP bindings
        ['gd'] = ':LspDefinition<CR>',
        ['gD'] = ':LspDeclaration<CR>',
        ['gI'] = ':LspImplementation<CR>',
        ['gr'] = ':LspReferences<CR>',
        ['gy'] = ':LspTypeDefinition<CR>',
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
        ['id'] = '<Cmd>normal! ggVG<CR>',
    },
    x = {
        -- Custom text object: "around document"
        ['ad'] = 'gg0oG$',
        ['id'] = 'gg0oG$',
    },
}

vim.g.mapleader = " "
local leader_maps = {
    n = {
        -- META MAPS
        ['<Leader><CR>']  = ":Lir<CR>",                   -- File explorer
        ['<Leader><BS>']  = ":Telescope find_files<CR>",  -- Fuzzy file finder
        ['<Leader><Tab>'] = "<C-^>",                      -- Last file
        ['<Leader><Esc>'] = ":MaximizerToggle<CR>",       -- Maximise buffer
        -- KEY MAPS
        ['<Leader>f'] = {map=[[/]], opts={noremap=true, silent=false}},            -- Find
        ['<Leader>F'] = {map=[[:%s///g<Left><Left><Left>]], opts={silent=false}},  -- Replace
        ['<Leader>q'] = ":q<CR>",                      -- L-q to quit
        ['<Leader>d'] = ":cd %:p:h<CR>:pwd<CR>",       -- Change dir to current
        ['<Leader>n'] = ":enew<CR>",                   -- New file
        ['<Leader>N'] = ":bufdo bdel | enew<CR>",      -- New session
        ['<Leader>t'] = ":tabedit<CR>",                -- New tab
        ['<Leader>c'] = ":call ToggleQuickFix()<CR>",  -- Toggle qflist
        ['<Leader>l'] = ":call ToggleLocation()<CR>",  -- Toggle loclist
        ['<Leader>s'] = ":Obsess<CR>",                 -- Start session
        ['<Leader>S'] = ":Obsess!<CR>",                -- Stop session
        ['<Leader>/'] = ":set hls!<CR>",               -- Toggle highlights
        ['<Leader>e'] = ':LspLineDiagnostics<CR>',     -- Show line Diagnostics
        ['<Leader>r'] = ':LspRename<CR>',              -- Rename current symbol
        ['<Leader>k'] = ':LspSignature<CR>',           -- Show signature help
        ['<Leader>a'] = ':LspCodeAction<CR>',          -- Do code action
        ['<Leader>='] = ':LspFormat<CR>',              -- Format buffer
        ['<Leader>i'] = ":Harpoon<CR>",                -- Show Harpoon
        ['<Leader>I'] = ":HarpoonMark<CR>",            -- Mark for harpoon
        -- HARPOON MAPS
        ['<leader>1'] = ':HarpoonNav 1<CR>',
        ['<leader>2'] = ':HarpoonNav 2<CR>',
        ['<leader>3'] = ':HarpoonNav 3<CR>',
        ['<leader>4'] = ':HarpoonNav 4<CR>',
        ['<leader>5'] = ':HarpoonNav 5<CR>',
        ['<leader>6'] = ':HarpoonNav 6<CR>',
        ['<leader>7'] = ':HarpoonNav 7<CR>',
        ['<leader>8'] = ':HarpoonNav 8<CR>',
        ['<leader>9'] = ':HarpoonNav 9<CR>',
        -- PACKER MAPS
        ['<Leader>pp'] = ':PackerSync<CR>',
        ['<Leader>pi'] = ':PackerInstall<CR>',
        ['<Leader>pu'] = ':PackerUpdate<CR>',
        ['<Leader>pc'] = ':PackerClean<CR>',
        ['<Leader>ps'] = ':PackerStatus<CR>',
        -- TELESCOPE MAPS
        ['<Leader>tb'] = ":Telescope buffers<CR>",                    -- Switch between buffers
        ['<Leader>tr'] = ":Telescope oldfiles<CR>",                   -- Recently changed files
        ['<Leader>tf'] = ":Telescope current_buffer_fuzzy_find<CR>",  -- Jumping with fuzzyfind
        ['<Leader>tg'] = ":Telescope live_grep<CR>",                  -- Jumping with livegrep
        ['<Leader>tt'] = ":Telescope treesitter<CR>",
        ['<Leader>th'] = ":Telescope help_tags<CR>",
        -- GIT MAPS
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


-- -- LOAD AUTOCOMMANDS ---------------------------------------------------------------------------

local autogroups = {
    ['default_cmds'] = {
        ['*'] = {
            {events='VimResized',  cmd="wincmd ="},                  -- Auto-resize windows
            {events='BufWritePre', cmd="retab"},                     -- Replace tabs
            {events='BufWritePre', cmd="call TrimTrailingSpace()"},  -- Autoremove whitespace
            {events='FileType',    cmd="set fo=crq2jp"},             -- Override format options
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
        ['*'] = {
            {events='CmdwinEnter', cmd="nnoremap <buffer> q :q<CR>"},
        },
        ['qf,help'] = {
            {events='FileType', cmd="nnoremap <buffer> q :q<CR>"},
            {events='FileType', cmd="setlocal nospell"},
        },
    },
    ['set_prgs'] = {
        "FileType c set formatprg=clang-format",
        "FileType python set formatprg=yapf",
        "FileType Markdown set makeprg=pandoc\\ %:p\\ -o\\ %:p:h/out.pdf"
    },
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

for group_name, group in pairs(autogroups) do
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
