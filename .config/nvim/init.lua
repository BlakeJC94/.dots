-- -- BLAKEJC94S NEOVIM INIT.LUA ------------------------------------------------------------------


MODULES = {
    'plugins.modules.completion',
    'plugins.modules.git',
    'plugins.modules.lir',
    'plugins.modules.lsp',
    'plugins.modules.lualine',
    'plugins.modules.telescope',
    'plugins.modules.treesitter',
    'plugins.editor',
    'plugins.interface',
    'plugins.window',
}
OPTIONS = {
    behaviour_options = {
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
    layout_options = {
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
        showcmd    = true,  -- Show command in bottom right
        cmdheight  = 2,     -- Set height of command window
        wildignore = {'*.pyc', '**/.git/*', '**/data/*'},
        -- TOP MARGIN
        showtabline = 0,  -- Display tab line (0, never, 1 auto, 2 always)
    }
}
COMMANDS = {
    'base',
    'typo'
}
MAPPINGS = {
    'base',
    'leader',
    'terminal',
    'arrow',
    'lsp',
    'git',
    'packer',
    'telescope',
}
AUTOGROUPS = {
    'base',
    'filetype',
    'prg',
}


require('utils.set').modules(MODULES)
require('utils.set').options(OPTIONS)

require('utils.set').commands(COMMANDS)
require('utils.set').mappings(MAPPINGS)
require('utils.set').autogroups(AUTOGROUPS)

