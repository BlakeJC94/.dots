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

-- DEFINE OPTIONS
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
}
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
    foldtext   = 'v:lua.require("functions").CustomFoldText()',
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
}


-- init.lua should just be the place where all the config tables are loaded,
-- config tables can be defined in init.lua or defined elsewere and imported to init.lua.
-- should call loaders in init.lua so nothing is hidden
-- TODO
-- * [X] Move mappings loader to utils.lua
-- * [X] Move options loader to utils.lua
-- * Keep OPTIONS and MAPS tables in init.lua
--     * [X] Split out some of these "utility" (such as arrows) maps into mappings.lua
-- * [x] Create AUTOCOMMANDS table in autocommands.lua
--     * Load AUTOCOMMANDS in init.lua via `AUTOCOMMANDS = require('autocommands').AUTOCOMMANDS`
--     * Pass AUTOCOMMANDS to `utils.lua` function
--         * [x] Create autocommands loader in utils.lua
-- * [x] Create COMMANDS table in commands.lua
--     * Load COMMANDS in init.lua via `COMMANDS = require('commands').COMMANDS`
--     * Pass COMMANDS to `utils.lua` function
--         * [x] Create commands loader in utils.lua
-- * [x] Create `load_typo_commands` in `commands.lua`
-- * [ ] Rename `plugins` to `extensions`
--     * Load EXTENSIONS table from extensions.lua?
-- * utils/loaders and utils/functions and utils/helpers?

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
utils.load_options(
    BEHAVIOUR_OPTIONS,
    LAYOUT_OPTIONS
)

-- DEFINE FUNCTIONS
functions = require('functions')
utils.load_functions(functions)

-- LOAD COMMANDS
commands = require('commands')
utils.load_commands(
    commands.CMDS,
    commands.NOTES_CMDS,
    commands.TYPO_CMDS
)

-- DEFINE AUTOCOMMANDS
autocommands = require('autocommands')
utils.load_autocommands(autocommands)  -- TODO create a nicer API for this

-- LOAD MAPPINGS
vim.g.mapleader = " "
mappings = require('mappings')
utils.load_mappings(
    mappings.MAPS,
    mappings.LEADER_MAPS,
    mappings.NAVIGATION_MAPS,
    mappings.FKEY_MAPS,
    mappings.QFLIST_MAPS,
    mappings.LSP_MAPS,
    mappings.GIT_MAPS,
    mappings.TELESCOPE_MAPS,
    mappings.PACKER_MAPS,
    mappings.DISABLE_ARROW_MAPS,
    mappings.INSERT_UNDO_MAPS
)
