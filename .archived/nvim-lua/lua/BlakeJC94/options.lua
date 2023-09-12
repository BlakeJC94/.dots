local options = {
    -- MAIN INPUT/OUTPUT
    clipboard     = "unnamedplus",  -- Allows vim to use "+ for yanks, puts, and deletes
    timeout       = false,          -- Allow timing out halfway into a mapping
    timeoutlen    = 1000,           -- Time (ms) between key sequences
    ttimeoutlen   = 10,             -- Time (ms) between key sequences in terminal
    virtualedit   = "block",        -- Allow cursor to move anywhere ('all', 'block', 'insert')
    hidden        = true,           -- Allow buffers to be hidden without saving
    autoread      = true,
    confirm       = true,
    mouse         = "",
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
    -- WINDOW DISPLAY
    splitbelow    = true,              -- Open splits below
    splitright    = true,              -- Open vsplits on right
    shortmess     = vim.o.shm .. "I",  -- Disable into message
    termguicolors = true,              -- Wider colorscheme support
    background    = 'dark',            -- Background mode
    guicursor     = "",                -- Cursor
    -- LINE DISPLAY
    scrolloff      = 999,        -- N lines to keep visible above/below cursor
    sidescrolloff  = 8,          -- N columns to keep visible left/right of cursor
    textwidth      = 100,         -- Margin for text input
    showmatch      = true,       -- Highlight matching brackets
    wrap           = false,      -- Soft-wrap long lines and use breakindent opts
    linebreak      = true,       -- Only split/wrap long lines after words
    breakindent    = true,       -- Indent soft-wrapped lines
    breakindentopt = {list=-1},  -- Options for breakindent
    showbreak      = nil ,     -- Text to print at breakindent
    -- FOLDS
    foldmethod = 'indent',             -- Auto-create folds by indent levels
    foldlevel  = 0,                    -- Close all folds when opening file
    fillchars  = {fold=' ', eob=' '},  -- Replace dots with spaces in fold head
    foldtext   = 'v:lua.require("BlakeJC94.functions").custom_fold_text()',
    -- LEFT MARGIN
    number         = true,      -- Show line numbers
    relativenumber = true,      -- Show rel/abs line numbers
    signcolumn     = 'number',  -- Set sign column
    -- BOTTOM MARGIN
    statusline = "%<%f %h%m%r%{FugitiveStatusline()}%=%{get(b:,'gitsigns_status','')} %-14.(%l,%c%V%) %P",
    laststatus = 2,     -- Show status line mode
    showcmd    = true,  -- Show command in bottom right
    cmdheight  = 1,     -- Set height of command window
    wildignore = {'*.pyc', '**/.git/*', '**/data/*'},
    -- TOP MARGIN
    showtabline = 1,  -- Display tab line (0, never, 1 auto, 2 always)
}

local M = {}

M.set = function()
    for k, v in pairs(options) do vim.opt[k] = v end
end

return M
