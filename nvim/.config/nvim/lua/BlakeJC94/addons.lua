return {
    --- ACTIONS ---
    { "tpope/vim-rsi" }, -- Readline keybindings for insert/command mode (<C-a> <A-b> <A-f> <C-e>)
    { "tpope/vim-eunuch" }, -- Unix commands
    { "tpope/vim-repeat" }, -- Better .-repeat actions
    { "tpope/vim-surround" }, -- cs] => Change surrounding brackets
    { "tpope/vim-commentary" }, -- gc<motion> => toggle comments
    { "tpope/vim-unimpaired" }, -- gc<motion> => toggle comments
    { "tommcdo/vim-lion" }, -- gl<obj><char> => align selection to <char>
    { "christoomey/vim-sort-motion" }, -- gs<object> => Sort operator across object
    { "wellle/targets.vim" }, -- Many many more text objects
    { "Julian/vim-textobj-variable-segment" }, -- iv/av => Text objects for substrings in snake/camel/kebab case
    --- INTERFACE ---
    { "BlakeJC94/field-notes.nvim" },
    { "Glench/Vim-Jinja2-Syntax" },
    { "lewis6991/gitsigns.nvim" }, -- Gitgutter, floating hunks, and virtual text blames
    { "jpalardy/vim-slime" }, -- <C-c><C-c> => Send code snippet to terminal
    { "ethanholz/nvim-lastplace" }, -- Jump to last place when opening a file
    { "danilamihailov/beacon.nvim" }, -- Ping cursor location after jump
    { "luukvbaal/stabilize.nvim" }, -- Stabilise split creation  TODO remove when merged in 0.9
    { "mrjones2014/smart-splits.nvim" }, -- smarter split resize functions
    { "norcalli/nvim-colorizer.lua" }, -- Colors Hex codes
    { "tzachar/local-highlight.nvim" },
    { "5long/pytest-vim-compiler" }, -- Link :make to pytest
    { "amrbashir/nvim-docs-view" }, -- :DocsViewToggle
    { "mbbill/undotree" }, -- :UndotreeToggle
    --- STYLE ---
    { "ellisonleao/gruvbox.nvim" }, -- rose-pine and tokyonight and material.nvim look neat too
    { "marko-cerovac/material.nvim" },
    { "rose-pine/neovim" },
    { "folke/tokyonight.nvim" },
    { "unblevable/quick-scope" }, -- Better f/t targets
    { "https://gitlab.com/yorickpeterse/nvim-pqf" }, -- Better quickfix list format
    { "nvim-lualine/lualine.nvim" }, -- Statusline
    { "lukas-reineke/indent-blankline.nvim" }, -- Indent guides
    --- GIT ---
    { "tpope/vim-fugitive" }, -- The ultimate git plugin for Vim
    { "tpope/vim-rhubarb" },
    { "oguzbilgic/vim-gdiff" },
    { "christoomey/vim-conflicted" },
    { "sindrets/diffview.nvim" },
    --- COMPLETION ---
    { "L3MON4D3/LuaSnip" }, -- Snippets
    { "hrsh7th/nvim-cmp" },
    { "windwp/nvim-autopairs" }, -- Autoclose brakcets and quotes
    --- TREESITTER ---
    { "nvim-treesitter/nvim-treesitter" }, -- TreeSitter plugin configuration
    { "danymat/neogen" }, -- Generate docstrings
    { "lewis6991/nvim-treesitter-context" }, -- Pop-up for context
    { "ckolkey/ts-node-action" },
    { "ThePrimeagen/refactoring.nvim" },
    --- TELESCOPE ---
    { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    { "nvim-telescope/telescope.nvim" }, -- Extensible Fuzzy finder
    --- NEOTEST ---
    { "nvim-neotest/neotest" },
    --- LSP ---
    { "neovim/nvim-lspconfig" }, -- LSP Engine configuration
    { "Mofiqul/trld.nvim" }, -- display diagnostic status in top right
    { "ii14/lsp-command" }, -- :Lsp <cmd> => Command interface for LSP functions
    { "jose-elias-alvarez/null-ls.nvim" }, -- Extra sources for LSP
    { "williamboman/mason.nvim" }, -- Installer for external tools
}
