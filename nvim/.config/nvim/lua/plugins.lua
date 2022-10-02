return {
    -- EDITOR
    "tpope/vim-dispatch",  -- Asynchronous job execution (:Make, :Dispatch)
    "tpope/vim-eunuch",  -- Unix commands for vim (:Delete, :Move, :Rename, :Cfind)
    "tpope/vim-rsi",  -- Readline keybindings for insert/command mode (<C-a> <A-b> <A-f> <C-e>)
    -- OPERATIONS
    "tpope/vim-repeat",  -- Better .-repeat actions
    "tpope/vim-surround",  -- cs]} => Change surrounding brackets
    "tpope/vim-commentary",  -- gc<motion> => toggle comments
    "tommcdo/vim-lion",  -- gl<obj><char> => align selection to <char>
    "christoomey/vim-sort-motion",  -- gs<object> ==> Sort operator across object
    "inkarkat/vim-ReplaceWithRegister",  -- ["x]gr<motion> ==> Replace motion region with register x
    -- TEXTOBJS
    "wellle/targets.vim",  -- Many many more text objects
    "Julian/vim-textobj-variable-segment",  -- iv/av => Text objects for substrings in snake/camel/kebab case
    -- TERMINAL
    "jpalardy/vim-slime",  -- <C-c><C-c> => Send code snippet to terminal
    "5long/pytest-vim-compiler",  -- Link :make to pytest
    -- COLOURS
    "ellisonleao/gruvbox.nvim",  -- Colorscheme
    "lukas-reineke/indent-blankline.nvim",  -- Indent guides
    "unblevable/quick-scope",  -- Better f/t targets
    "norcalli/nvim-colorizer.lua",  -- Colors Hex codes
    "RRethy/vim-illuminate",  -- Subtle highlighting of instances of word under cursor
    "danilamihailov/beacon.nvim",  -- Ping cursor location after jump
    -- INTERFACE
    "hrsh7th/nvim-cmp",  -- Completion menu
    "nvim-lualine/lualine.nvim",  -- Statusline
    "https://gitlab.com/yorickpeterse/nvim-pqf",  -- Better quickfix list format
    "milisims/nvim-luaref",  -- Lua reference
    "sam4llis/nvim-lua-gf",  -- Make `gf` work for lua requires
    "ethanholz/nvim-lastplace",  -- Jump to last place when opening a file
    "luukvbaal/stabilize.nvim",  -- Stabilise split creation  TODO remove when merged in 0.9
    "nacro90/numb.nvim",  -- Peek lines when selecting in command mode
    "mrjones2014/smart-splits.nvim",  -- smarter split resize functions
    -- LSP
    "neovim/nvim-lspconfig",  -- LSP Engine configuration
    "jose-elias-alvarez/null-ls.nvim",  -- Extra sources for LSP
    "williamboman/mason.nvim",  -- Installer for external tools
    -- GIT
    "tpope/vim-fugitive",  -- The ultimate git plugin for Vim
    "lewis6991/gitsigns.nvim", -- Gitgutter, floating hunks, and virtual text blames
    -- TELESCOPE
    "nvim-telescope/telescope-fzf-native.nvim",
    "nvim-telescope/telescope.nvim", -- Extensible Fuzzy finder
    -- TREESITTER
    "nvim-treesitter/nvim-treesitter",  -- TreeSitter plugin configuration
}
