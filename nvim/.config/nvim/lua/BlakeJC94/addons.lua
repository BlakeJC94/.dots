return {
    --- ACTIONS ---
    { "tpope/vim-rsi" }, -- Readline keybindings for insert/command mode (<C-a> <A-b> <A-f> <C-e>)
    { "tpope/vim-eunuch" }, -- Unix commands
    { "tpope/vim-repeat" }, -- Better .-repeat actions
    { "tpope/vim-surround" }, -- cs] => Change surrounding brackets
    { "tpope/vim-commentary" }, -- gc<motion> => toggle comments
    { "tpope/vim-unimpaired" },
    { "tpope/vim-apathy" },
    { "tpope/vim-vinegar" },
    { "tpope/vim-dispatch" },
    { "tpope/vim-fugitive" }, -- The ultimate git plugin for Vim
    { "tommcdo/vim-lion" }, -- gl<obj><char> => align selection to <char>
    { "christoomey/vim-sort-motion" }, -- gs<object> => Sort operator across object
    { "kana/vim-operator-replace" },
    { "wellle/targets.vim" }, -- Many many more text objects
    { "Julian/vim-textobj-variable-segment" }, -- iv/av => Text objects for substrings in snake/camel/kebab case
    --- INTERFACE ---
    { "BlakeJC94/field-notes.nvim" },
    { 'ibhagwan/fzf-lua' },
    { "lewis6991/gitsigns.nvim" }, -- Gitgutter, floating hunks, and virtual text blames
    { "jpalardy/vim-slime" }, -- <C-c><C-c> => Send code snippet to terminal
    { "ethanholz/nvim-lastplace" }, -- Jump to last place when opening a file
    { "luukvbaal/stabilize.nvim" }, -- Stabilise split creation  TODO remove when merged in 0.9
    { "mrjones2014/smart-splits.nvim" }, -- smarter split resize functions
    { "mbbill/undotree" }, -- :UndotreeToggle
    { "mfussenegger/nvim-dap" },
    --- LSP ---
    { "neovim/nvim-lspconfig" }, -- LSP Engine configuration
    { "Mofiqul/trld.nvim" }, -- display diagnostic status in top right
    { "jose-elias-alvarez/null-ls.nvim" }, -- Extra sources for LSP
    { "williamboman/mason.nvim" }, -- Installer for external tools
    { "simrat39/symbols-outline.nvim" },
    --- COMPLETION ---
    { "L3MON4D3/LuaSnip" }, -- Snippets
    { "zbirenbaum/copilot.lua" },
    { "hrsh7th/nvim-cmp" },
    { "windwp/nvim-autopairs" }, -- Autoclose brakcets and quotes
    --- TREESITTER ---
    { "nvim-treesitter/nvim-treesitter" }, -- TreeSitter plugin configuration
    { "lewis6991/nvim-treesitter-context" }, -- Pop-up for context
    { "danymat/neogen" }, -- Generate docstrings
    { "ckolkey/ts-node-action" },
    { 'Wansmer/treesj' },
    --- STYLE ---
    { "danilamihailov/beacon.nvim" }, -- Ping cursor location after jump
    { "brenoprata10/nvim-highlight-colors" }, -- Colors Hex codes
    { "tzachar/local-highlight.nvim" },
    { "ellisonleao/gruvbox.nvim" }, -- rose-pine and tokyonight and material.nvim look neat too
    { "rose-pine/neovim" },
    { "folke/tokyonight.nvim" },
    { "unblevable/quick-scope" }, -- Better f/t targets
    { "nvim-lualine/lualine.nvim" }, -- Statusline
    { "alvarosevilla95/luatab.nvim" },
    { "lukas-reineke/indent-blankline.nvim" }, -- Indent guides
}
