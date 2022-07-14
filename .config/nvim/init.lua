----- BLAKEJC94S NEOVIM INIT.LUA ------------------------------------------------------------------
utils = require('utils')
PLUGINS = {
    -- BASE PLUGINS
    __editor__    = true,
    __interface__ = true,
    -- EXTENSIONS
    cmp        = true,
    git        = true,
    lsp        = true,
    lualine    = true,
    telescope  = true,
    treesitter = true,
}
OPTIONS = {
    BEHAVIOUR_OPTIONS = {
        -- MAIN INPUT/OUTPUT
        clipboard     = "unnamedplus",  -- Allows vim to use "+ for yanks, puts, cuts, and deletes
        timeoutlen    = 1000,           -- Time (ms) between key sequences
        ttimeoutlen   = 10,             -- Time (ms) between key sequences in terminal
        updatetime    = 300,            -- Time (ms) between swapfile writes
        virtualedit   = "block",        -- Allow cursor to move anywhere ('all', 'block', 'insert')
        hidden        = false,          -- Allow buffers to be hidden without saving
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
    },
    LAYOUT_OPTIONS = {
        -- WINDOW DISPLAY
        splitbelow    = true,              -- Open splits below
        splitright    = true,              -- Open vsplits on right
        shortmess     = vim.o.shm .. "I",  -- Disable into message
        termguicolors = true,              -- Wider colorscheme support
        background    = 'dark',            -- Background mode
        -- LINE DISPLAY
        scrolloff      = 8,          -- N lines to keep visible above/below cursor
        sidescrolloff  = 8,          -- N columns to keep visible left/right of cursor
        textwidth      = 99,         -- Margin for text input
        wrap           = false,      -- Soft-wrap long lines and use breakindent opts
        linebreak      = true,       -- Only split/wrap long lines after words
        breakindent    = true,       -- Indent soft-wrapped lines
        breakindentopt = {list=-1},  -- Options for breakindent
        showbreak      = '››› ',     -- Text to print at breakindent
        showmatch      = true,       -- Highlight matching brackets
        -- FOLDS
        foldmethod = 'indent',             -- Auto-create folds by indent levels
        foldlevel  = 0,                    -- Close all folds when opening file
        fillchars  = {fold=' ', eob=' '},  -- Replace dots with spaces in fold head
        foldtext   = 'v:lua.require("utils").my_fold_text()',  -- Custom fold text
        -- LEFT MARGIN
        number         = true,  -- Show line numbers
        relativenumber = true,  -- Show rel/abs line numbers
        signcolumn     = 'no',  -- Set sign column
        -- BOTTOM MARGIN
        laststatus = 3,     -- Show global status line
        showcmd    = true,  -- Show command in bottom right
        cmdheight  = 2,     -- Set height of command window
        wildignore = {'*.pyc', '**/.git/*', '**/data/*'},
        -- TOP MARGIN
        showtabline = 0,  -- Display tab line (0, never, 1 auto, 2 always)
    },
}
MAPS = {
    [''] = {
        ['<F1>'] = {map=':setl relativenumber!<CR>:setl relativenumber?<CR>', opts={silent=false}},
        ['<F2>'] = {map=':setl number!<CR>:setl number?<CR>', opts={silent=false}},
        ['<F3>'] = {map=':setl wrap!<CR>:setl wrap?<CR>', opts={silent=false}},
        ['<F4>'] = {map=':setl spell!<CR>:setl spell?<CR>', opts={silent=false}},
        ['<F6>'] = {map=':wincmd =<CR>', opts={silent=false}},
        -- Move left faster with `gh`
        ['gh'] = {map=[[col('.') == match(getline('.'), '\S') + 1 ? '0' : '^']], opts={expr=true}},
        -- Prevent x and s from overriding what's in the clipboard
        ['x'] = '"_x',
        ['X'] = '"_X',
        ['s'] = '"_s',
        ['S'] = '"_S',
        -- Open folds when flicking through search matches
        ['n'] = 'nzv',
        ['N'] = 'Nzv',
        -- Remap q and Q to stop polluting registers accidentally!
        ['q'] = 'gq',
        ['Q'] = 'q',
        -- Clear last search hl with <C-l> before <C-l> action
        ['<C-l>'] = ':noh | redraw | echon ""<CR><C-l>',
        -- Navigate git changes in file
        [']g'] = {map=[[&diff ? ']g' : '<cmd>Gitsigns next_hunk<CR>']], opts={expr=true}},
        ['[g'] = {map=[[&diff ? '[g' : '<cmd>Gitsigns prev_hunk<CR>']], opts={expr=true}},
        -- Navigate diagnostics
        [']e'] = function() vim.diagnostic.goto_next() end,
        ['[e'] = function() vim.diagnostic.goto_prev() end,
        -- Navigate quickfix list
        [']c'] = ':cnext<CR>',
        ['[c'] = ':cprev<CR>',
        [']l'] = ':lnext<CR>',
        ['[l'] = ':lprev<CR>',
        -- LSP bindings
        ['gd'] = function() vim.lsp.buf.definition() end,
        ['gD'] = function() vim.lsp.buf.declaration() end,
        ['gI'] = function() vim.lsp.buf.implementation() end,
        ['gR'] = function() vim.lsp.buf.references() end,
        ['gy'] = function() vim.lsp.buf.type_definition() end,
        ['gw'] = function() vim.lsp.buf.document_symbol() end,
        -- <C-Space> => Toggle terminal
        ['<C-Space>'] = "",
        ['<C-Space><C-Space>'] = function() require('FTerm').toggle() end,
        ['<C-Space>_'] = function() require('FTerm').toggle(); vim.cmd('wincmd J') end,
        ['<C-Space>|'] = function() require('FTerm').toggle(); vim.cmd('wincmd L') end,
        -- Pane controls
        ['<Leader>_'] = ':split<CR>',
        ['<Leader>|'] = ':vsplit<CR>',
        -- Tmux window control passthrough
        --   <S-Arrow> => Resize split
        --   <C-z><Arrow> => Move to split
        --   <C-z><S-Arrow> => Move pane to direction
        --   <Leader><S-Arrow> => Move split to direction
        ['<C-z>'] = {map='<C-w>', opts={noremap=false}},
        -- Tab controls
        ['<Leader>.'] = ":tabnext<CR>",
        ['<Leader>,'] = ":tabprev<CR>",
        ['<Leader>>'] = ":+tabmove<CR>",
        ['<Leader><'] = ":-tabmove<CR>",
        ['<Leader>t'] = ':tabedit %<CR>',
        -- Leader maps
        ['<Leader><CR>']  = ":Telescope file_browser<CR>",  -- File browser
        ['<Leader><BS>']  = ":Telescope find_files<CR>",    -- File finder
        ['<Leader><Tab>'] = "<C-^>",                        -- Last file
        ['<Leader><Esc>'] = ":Telescope buffers<CR>",       -- Buffers
        ['<Leader>q'] = ":q<CR>",                           -- Quit
        ['<Leader>n'] = ":NewFile<CR>",
        ['<Leader>N'] = ":NewSession<CR>",
        ['<Leader>d'] = ":ChangeLocalDir<CR>",
        ['<Leader>D'] = ":ChangeDir<CR>",
        ['<Leader>c'] = ":ToggleQL<CR>",               -- Toggle qflist
        ['<Leader>l'] = ":ToggleLL<CR>",               -- Toggle loclist
        ['<Leader>;'] = ":Settings<CR>",               -- Edit settings
        ['<Leader>:'] = ":luafile $MYVIMRC<CR>",       -- Reload settings
        ['<Leader>z'] = ":Twilight<CR>",               -- Toggle FocusMode
        ['<Leader>Z'] = ":ZenMode<CR>",                -- Toggle ZenMode
        ['<Leader>A'] = ":Neogen<CR>",                 -- Generate docs
        -- Telescope leader maps
        ['<Leader>ff'] = ":Telescope resume<CR>",                     -- Open last telescope
        ['<Leader>fF'] = ":Telescope<CR>",                            -- Find Telescopes
        ['<Leader>fb'] = ":Telescope buffers<CR>",                    -- Switch between buffers
        ['<Leader>fr'] = ":Telescope registers<CR>",                  -- Switch between buffers
        ['<Leader>fo'] = ":Telescope oldfiles<CR>",                   -- Recently changed files
        ['<Leader>f/'] = ":Telescope current_buffer_fuzzy_find<CR>",  -- Jumping with fuzzyfind
        ['<Leader>fg'] = ":Telescope live_grep<CR>",                  -- Jumping with livegrep
        ['<Leader>fh'] = ":Telescope help_tags<CR>",
        ['<Leader>fG'] = ":Telescope git_status<CR>",
        ['<Leader>fc'] = ":Telescope quickfix<CR>",
        ['<Leader>fl'] = ":Telescope loclist<CR>",
        ['<Leader>fs'] = ":Telescope spell_suggest<CR>",
        ['<Leader>fa'] = ":Telescope lsp_code_actions<CR>",
        -- Packer leader maps
        ['<Leader>pp'] = ':PackerSync<CR>',
        ['<Leader>pi'] = ':PackerInstall<CR>',
        ['<Leader>pu'] = ':PackerUpdate<CR>',
        ['<Leader>pc'] = ':PackerCompile<CR>',
        ['<Leader>pr'] = ':PackerClean<CR>',
        ['<Leader>ps'] = ':PackerStatus<CR>',
        -- Git leader maps
        ['<Leader>gg'] = ':Git<CR>',
        ['<Leader>gs'] = ':Git status<CR>',
        ['<Leader>gc'] = ':Git commit | startinsert<CR>',
        ['<Leader>gp'] = ':Gitsigns preview_hunk<CR>',
        ['<Leader>gs'] = ':Gitsigns stage_hunk<CR>',
        ['<Leader>gu'] = ':Gitsigns undo_stage_hunk<CR>',
        ['<Leader>gr'] = ':Gitsigns reset_hunk<CR>',
        ['<Leader>gS'] = ':Gitsigns stage_buffer<CR>',
        ['<Leader>gU'] = ':Gitsigns reset_buffer_index<CR>',
        ['<Leader>gR'] = ':Gitsigns reset_buffer<CR>',
        ['<Leader>gd'] = ':Git difftool<CR>',
        ['<Leader>gm'] = ':Git mergetool<CR>',
        ['<Leader>gb'] = function() require("gitsigns").blame_line({full=true}) end,
        ['<Leader>g|'] = ':Gvdiffsplit<CR>',
        ['<Leader>g_'] = ':Gdiffsplit<CR>',
        -- LSP Leader bindings
        ['<Leader>e'] = function() vim.diagnostic.open_float() end,        -- Show line diagnostics
        ['<Leader>E'] = function() vim.diagnostic.setloclist() end,        -- Show buffer diagnostics
        ['<Leader>='] = function() vim.lsp.buf.formatting_seq_sync() end,  -- Format buffer
        ['<Leader>r'] = function() vim.lsp.buf.rename() end,               -- Rename current symbol
        ['<Leader>k'] = function() vim.lsp.buf.signature_help() end,       -- Show signature help
        ['<Leader>a'] = function() vim.lsp.buf.code_action() end,          -- Do code action
    },
    n = {
        -- Make Y behave like D and C
        ['Y']  = 'y$',
        -- Better jumplist for large line steps (and step through visual lines with j/k)
        ['j'] = {map=[[(v:count > 5 ? 'm`' . v:count : 'g') . 'j']], opts={expr=true}},
        ['k'] = {map=[[(v:count > 5 ? 'm`' . v:count : 'g') . 'k']], opts={expr=true}},
        -- gp: Visually select last pasted block (like gv)
        ['gp'] = '`[v`]',
        -- gF: create new file at filename over cursor
        ['gF'] = ':e <c-r><c-f><CR>',
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
        -- Make K use lsp.hover, call twice to jump to hoverdoc
        ['K'] = function() vim.lsp.buf.hover() end,
        -- Override spellchecker
        ['z='] = {map=[[v:count ? v:count . 'z=' : ':Telescope spell_suggest<CR>']], opts={expr=true}},
    },
    v = {
        -- Maintain Visual Mode after >/</= actions
        ['<'] = '<gv',
        ['>'] = '>gv',
        ['='] = '=gv',
        -- Move visual block up or down
        ['J'] = ":m '>+1<CR>gv",
        ['K'] = ":m '<-2<CR>gv",
        -- Replace spaces in selection with underscores
        ['_']  = ":s/\\%V /_/g<CR>",
        ['g_'] = ":s/\\%V_/ /g<CR>",
    },
    i = {
        -- C-s : Quickly guess correct spelling errors (undoable)
        ['<C-s>'] = '<C-g>u<Esc>[s1z=`]a<c-g>u', -- Currently borked by spellsitter?
        -- Make <C-k> use lsp.hover, call twice to jump to hoverdoc
        ['<C-k>'] = function() vim.lsp.buf.hover() end,
        -- C-r C-r : See registers with telescope
        ['<C-r><C-r>'] = "<cmd>Telescope registers<CR>",
    },
    t = {
        -- <C-Space> => ToggleTerm Hide
        ['<C-Space><C-Space>'] = function() require('FTerm').toggle() end,
        -- Tab navigation
        ['<C-Space>.'] = function() vim.cmd('tabnext') end,
        ['<C-Space>,'] = function() vim.cmd('tabprev') end,
        ['<C-Space><S-.>'] = function() vim.cmd('+tabmove') end,
        ['<C-Space><S-,>'] = function() vim.cmd('-tabmove') end,
        -- <Esc><Esc> => (terminal) go to normal mode
        ['<C-Space><Esc>'] = '<C-\\><C-n>',
        -- <Esc>: => (terminal) go to command mode
        ['<C-Space>:'] = '<C-\\><C-n>:',
        -- <C-z> => Tmux bindkey passthrough
        ['<C-z>'] = {map="<C-\\><C-n><C-w>", opts={noremap=false}},
        -- <C-l> => Do C-l action in vim as well
        ['<C-l>'] = '<C-\\><C-n><C-l>i<C-l>',
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

-- TODO
-- * [ ] Move mappings loader to utils.lua
-- * [ ] Move options loader to utils.lua
-- * Keep OPTIONS and MAPS tables in init.lua
--     * [ ] Split out some of these "utility" (such as arrows) maps into mappings.lua
-- * [ ] Create AUTOCOMMANDS table in autocommands.lua
--     * Load AUTOCOMMANDS in init.lua via `AUTOCOMMANDS = require('autocommands').AUTOCOMMANDS`
--     * Pass AUTOCOMMANDS to `utils.lua` function
--         * [ ] Create autocommands loader in utils.lua
-- * [ ] Create COMMANDS table in commands.lua
--     * Load COMMANDS in init.lua via `COMMANDS = require('commands').COMMANDS`
--     * Pass COMMANDS to `utils.lua` function
--         * [ ] Create commands loader in utils.lua
-- * [ ] Create `load_typo_commands` in `commands.lua`
--     * Load table in utils?
-- * [ ] Rename `plugins` to `extensions`
--     * Load EXTENSIONS table from extensions.lua?
-- * utils/loaders and utils/functions?

-- LOAD SELECTED PLUGINS
utils.disable_built_ins()
utils.setup_packer()
local status_ok, packer = pcall(require, "packer")
if status_ok then
    packer.init()
    packer.reset()
    packer.use({'wbthomason/packer.nvim'})
    for module_name, opt in pairs(PLUGINS) do
        if opt == true then
            module = require('plugins.' .. module_name)
            for k, v in pairs(module) do
                repo = vim.tbl_extend("force", {k}, v)
                packer.use(repo)
            end
        end
    end
    packer.install()
end

-- SET OPTIONS
for i, opts in pairs(OPTIONS) do
    for k, v in pairs(opts) do vim.opt[k] = v end
end


-- DEFINE FUNCTIONS
utils.load_functions()

-- DEFINE COMMANDS
utils.load_commands()  -- TODO create a nicer API for this

-- DEFINE AUTOCOMMANDS
utils.load_autocommands()  -- TODO create a nicer API for this


-- DEFINE MAPPINGS
-- TODO put this in utils
vim.g.mapleader = " "
local mapping_groups = {
    MAPS,
    utils.arrow_maps,
    utils.insert_undo_maps,
}
for _, group in ipairs(mapping_groups) do
    utils.set_mapping_group(group)
end
