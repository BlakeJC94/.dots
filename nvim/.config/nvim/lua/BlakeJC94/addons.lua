return {
    --- ACTIONS ---
    { "tpope/vim-rsi" }, -- Readline keybindings for insert/command mode (<C-a> <A-b> <A-f> <C-e>)
    { "tpope/vim-eunuch" }, -- Unix commands
    { "tpope/vim-repeat" }, -- Better .-repeat actions
    { "tpope/vim-surround" }, -- cs] => Change surrounding brackets
    { "tpope/vim-commentary" }, -- gc<motion> => toggle comments
    { "tpope/vim-unimpaired" },
    { "tpope/vim-dispatch" },
    { "tpope/vim-fugitive" }, -- The ultimate git plugin for Vim
    { "tommcdo/vim-lion" }, -- gl<obj><char> => align selection to <char>
    { "chrisgrieser/nvim-various-textobjs" },
    --- INTERFACE ---
    -- { "~/Workspace/repos/field-notes.nvim" },
    { "BlakeJC94/field-notes.nvim", branch = "dev" },
    { 'ibhagwan/fzf-lua' },
    { "lewis6991/gitsigns.nvim" }, -- Gitgutter, floating hunks, and virtual text blames
    { "jpalardy/vim-slime" }, -- <C-c><C-c> => Send code snippet to terminal
    { "ethanholz/nvim-lastplace" }, -- Jump to last place when opening a file
    { "mrjones2014/smart-splits.nvim" }, -- smarter split resize functions
    { "mbbill/undotree" }, -- :UndotreeToggle
    --- LSP ---
    { "neovim/nvim-lspconfig" }, -- LSP Engine configuration
    { "Mofiqul/trld.nvim" }, -- display diagnostic status in top right
    { "jose-elias-alvarez/null-ls.nvim" }, -- Extra sources for LSP
    { "williamboman/mason.nvim" }, -- Installer for external tools
    { "simrat39/symbols-outline.nvim" },
    { "ray-x/lsp_signature.nvim" },
    --- COMPLETION ---
    { "zbirenbaum/copilot.lua" },
    { "hrsh7th/nvim-cmp" },
    { "windwp/nvim-autopairs" }, -- Autoclose brakcets and quotes
    --- TREESITTER ---
    { "nvim-treesitter/nvim-treesitter" }, -- TreeSitter plugin configuration
    { "nvim-treesitter/nvim-treesitter-context" }, -- Pop-up for context
    { "danymat/neogen" }, -- Generate docstrings
    { 'Wansmer/treesj' },
    --- STYLE ---
    { "danilamihailov/beacon.nvim" }, -- Ping cursor location after jump
    { "brenoprata10/nvim-highlight-colors" }, -- Colors Hex codes
    { "tzachar/local-highlight.nvim" },
    { "ellisonleao/gruvbox.nvim" },
    { "nvim-lualine/lualine.nvim" }, -- Statusline
    { "alvarosevilla95/luatab.nvim" },
    { "lukas-reineke/indent-blankline.nvim" }, -- Indent guides
}
