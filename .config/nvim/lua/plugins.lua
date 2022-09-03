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
    "wellle/targets.vim",  -- Many more text objects
    "Julian/vim-textobj-variable-segment",  -- iv/av => Text objects for substrings in snake/camel/kebab case
    -- TERMINAL
    "jpalardy/vim-slime",  -- <C-c><C-c> => Send code snippet to terminal
    "5long/pytest-vim-compiler",  -- Link :make to pytest
    "numToStr/FTerm.nvim",  -- TODO investigate using max/min tmux pane and remove
    "aserowy/tmux.nvim",  -- TODO investigate using max/min tmux pane and remove
    -- COLOURS
    "ellisonleao/gruvbox.nvim",  -- Colorscheme
    "lukas-reineke/indent-blankline.nvim",  -- Indent guides
    "unblevable/quick-scope",  -- Better f/t targets
    "norcalli/nvim-colorizer.lua",  -- Colors Hex codes
    "RRethy/vim-illuminate",  -- Subtle highlighting of instances of word under cursor
        -- TODO figure out hls here, also cursorline? might have to replace augroup
        -- https://github.com/yamatsum/nvim-cursorline
        -- https://github.com/yamatsum/nvim-cursorline/blob/804f0023692653b2b2368462d67d2a87056947f9/lua/nvim-cursorline.lua#L90
    "danilamihailov/beacon.nvim",  -- Ping cursor location after jump
    "fladson/vim-kitty",  -- Highlighting for kitty config
    -- INTERFACE
    "hrsh7th/nvim-cmp",  -- Completion menu
    "nvim-lualine/lualine.nvim",  -- Statusline
    "https://gitlab.com/yorickpeterse/nvim-pqf",  -- Better quickfix list format
    "milisims/nvim-luaref",  -- Lua reference
    "ethanholz/nvim-lastplace",  -- Jump to last place when opening a file
    "luukvbaal/stabilize.nvim",  -- Stabilise split creation  TODO remove when merged
    "nacro90/numb.nvim",  -- Peek lines when selecting in command mode
    -- LSP
    "neovim/nvim-lspconfig",  -- LSP Engine configuration
    "jose-elias-alvarez/null-ls.nvim",  -- Extra sources for LSP
    "williamboman/mason.nvim",  -- Installer for external tools
    -- GIT
    "tpope/vim-fugitive",  -- The ultimate git plugin for Vim
    "lewis6991/gitsigns.nvim", -- Gitgutter, floating hunks, and virtual text blames
    "junegunn/gv.vim",  -- :gv => better git log
    -- TELESCOPE
    "nvim-telescope/telescope-fzf-native.nvim",
    "nvim-telescope/telescope.nvim", -- Extensible Fuzzy finder
    "nvim-treesitter/nvim-treesitter",  -- TreeSitter plugin configuration
}
