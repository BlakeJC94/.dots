local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

plugins = require('plugins')
mappings = require('mappings')

-- -- PLUGINS ---------------------------------------------------------
-- Download plugins with ~/.config/nvim/lua/plugins.lua
-- Configure plugins with ~/.config/nvim/lua/plugin_configs.lua
plugins.setup_packer()
plugins.disable_built_ins()
plugins.load_plugins()

-- -- LOAD CUSTOM FUNCTIONS ----------------------------------------------
cmd [[source ~/.config/nvim/vimscript/functions.vim]]
cmd [[source ~/.config/nvim/vimscript/autocmds.vim]]

-- -- LOAD MAPPINGS ------------------------------------------------------
-- mappings.load_mappings()
cmd [[source ~/.config/nvim/vimscript/mappings.vim]]
cmd [[source ~/.config/nvim/vimscript/mappings-leader.vim]]
cmd [[source ~/.config/nvim/vimscript/mappings-insert.vim]]

-- -- LOAD OPTIONS ----------------------------------------------

local behaviour_options = {
    -- MAIN INPUT/OUTPUT
    clipboard   = "unnamedplus",
    ttimeoutlen = 10,   --
    updatetime  = 500,  --
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
    cursorline    = true,   -- Highlight current line
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
    signcolumn     = 'no',  -- Always show sign column beside numbers
    -- RIGHT MARGIN
    colorcolumn = {100},  -- Set vertical margin
    -- BOTTOM MARGIN
    showcmd    = true,  -- Show command in bottom right
    cmdheight  = 2,     --
    laststatus = 2,     -- Status line (from Mastering Vim)
    statusline = '%F%m%r%h%w%=(%{&ff}/%Y) (line %l/%L, col %c)',
    wildignore = {'*.pyc', '**/.git/*', '**/data/*'},
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

