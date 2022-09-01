return {
    -- EDITOR
    'tpope/vim-dispatch',  -- Asynchronous job execution (:Make, :Dispatch)
    'tpope/vim-eunuch',  -- Unix commands for vim (:Delete, :Move, :Rename, :Cfind)
    'tpope/vim-rsi',  -- Readline keybindings for insert/command mode (<C-a> <A-b> <A-f> <C-e>)
    -- OPERATIONS
    'tpope/vim-repeat',  -- Better .-repeat actions
    'christoomey/vim-sort-motion',  -- gs<object> ==> Sort operator across object
    'tommcdo/vim-lion',  -- gl<obj><char> => align selection to <char>
    'tpope/vim-surround',  -- cs]} => Change surrounding brackets
    'tpope/vim-commentary',  -- gc<motion> => toggle comments
    'inkarkat/vim-ReplaceWithRegister',  -- ["x]gr<motion> ==> Replace motion region with register x
    -- TEXTOBJS
    'wellle/targets.vim',  -- More text objects
    'Julian/vim-textobj-variable-segment',  -- iv/av => Text objects for substrings in snake/camel/kebab case
    'kana/vim-textobj-entire',  -- TODO replace with mapping, ae/ie ==> Text objects for around/in everything in file
    -- TERMINAL
    'jpalardy/vim-slime',  -- <C-c><C-c> => Send code snippet to terminal
    '5long/pytest-vim-compiler',
    'numToStr/FTerm.nvim',
    'aserowy/tmux.nvim',
    -- COLOURS
    "ellisonleao/gruvbox.nvim",  -- Colorscheme TODO put all gruvbox hlgroups in this config
    "lukas-reineke/indent-blankline.nvim",  -- Indent guides
    "unblevable/quick-scope",  -- Better f/t targets
    'norcalli/nvim-colorizer.lua',  -- Colors Hex codes
    "RRethy/vim-illuminate",  -- Subtle highlighting of instances of word under cursor
    'danilamihailov/beacon.nvim',  -- Ping cursor location after jump
    "fladson/vim-kitty",  -- Highlighting for kitty config
    -- INTERFACE
    "hrsh7th/nvim-cmp",  -- Completion
    'nvim-lualine/lualine.nvim',
    'milisims/nvim-luaref',  -- Lua reference
    'https://gitlab.com/yorickpeterse/nvim-pqf',  -- Better quickfix list format
    'ethanholz/nvim-lastplace',  -- Jump to last place when opening a file
    "luukvbaal/stabilize.nvim",  -- Stabilise split creation  TODO remove when merged
    'nacro90/numb.nvim',
    'Pocco81/true-zen.nvim',  -- True focus mode
    -- LSP
    'neovim/nvim-lspconfig',  -- LSP Engine configuration
    'jose-elias-alvarez/null-ls.nvim',  -- Extra sources for LSP
    "williamboman/mason.nvim",  -- Installer for external tools
    -- GIT
    'lewis6991/gitsigns.nvim', -- Gitgutter, floating hunks, and virtual text blames
    'tpope/vim-fugitive',  -- The ultimate git plugin for Vim
    'junegunn/gv.vim',  -- :gv => better git log
    -- TELESCOPE
    'nvim-telescope/telescope-fzf-native.nvim',
    'nvim-telescope/telescope.nvim', -- Extensible Fuzzy finder
    'nvim-treesitter/nvim-treesitter',  -- TreeSitter plugin configuration
}
