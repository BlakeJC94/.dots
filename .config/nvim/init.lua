----- BLAKEJC94S NEOVIM INIT.LUA ------------------------------------------------------------------

MODULES = {
    'modules.completion',
    'modules.git',
    'modules.lir',
    'modules.lsp',
    'modules.lualine',
    'modules.telescope',
    'modules.treesitter',
    'editor',
    'interface',
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
        showcmd    = true,  -- Show command in bottom right
        cmdheight  = 2,     -- Set height of command window
        wildignore = {'*.pyc', '**/.git/*', '**/data/*'},
        -- TOP MARGIN
        showtabline = 0,  -- Display tab line (0, never, 1 auto, 2 always)
    },
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

-- LOAD SELECTED PLUGIN MODULES
require('utils').disable_built_ins()
require('utils').setup_packer()
local status_ok, packer = pcall(require, "packer")
if status_ok then
    packer.init()
    packer.reset()
    packer.use({'wbthomason/packer.nvim'})
    for _, module_name in ipairs(MODULES) do
        module = require('plugins.' .. module_name)
        for k, v in pairs(module) do
            repo = vim.tbl_extend("force", {k}, v)
            packer.use(repo)
        end
    end
    packer.install()
end

-- SET OPTIONS
for i, opts in pairs(OPTIONS) do
    for k, v in pairs(opts) do vim.opt[k] = v end
end

-- DEFINE COMMANDS (VIMSCRIPT AND LUA)
vim.cmd [[
    luafile ~/.config/nvim/utils/functions.lua
    source  ~/.config/nvim/utils/commands.vim
    source  ~/.config/nvim/utils/autogroups.vim
]]

-- DEFINE MAPPINGS FROM SELECTED MAPPING GROUPS
vim.g.mapleader = " "
for _, mapping_group_name in ipairs(MAPPINGS) do
    group = require('mappings.' .. mapping_group_name)
    require('utils').set_mapping_group(group)
end


