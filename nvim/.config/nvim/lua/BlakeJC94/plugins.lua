local plugins = {}

plugins.motions = {
    {   -- Readline keybindings for insert/command mode (<C-a> <A-b> <A-f> <C-e>)
        "tpope/vim-rsi",
    },
    {   -- Better .-repeat actions
        "tpope/vim-repeat",
    },
    {   -- cs]} => Change surrounding brackets
        "tpope/vim-surround",
    },
    {   -- gc<motion> => toggle comments
        "tpope/vim-commentary",
    },
    {   -- gl<obj><char> => align selection to <char>
        "tommcdo/vim-lion",
    },
    {   -- gs<object> => Sort operator across object
        "christoomey/vim-sort-motion",
    },
}

plugins.git = {
    {   -- The ultimate git plugin for Vim
        "tpope/vim-fugitive",
    },
    {   -- Gitgutter, floating hunks, and virtual text blames
        "lewis6991/gitsigns.nvim",
        requires = {'nvim-lua/plenary.nvim'},
    },
}

plugins.interface = {
    {   -- <C-c><C-c> => Send code snippet to terminal
        "jpalardy/vim-slime",
    },
    {   -- Jump to last place when opening a file
        "ethanholz/nvim-lastplace",
    },
    {   -- Ping cursor location after jump
        "danilamihailov/beacon.nvim",
    },
    {
        "glepnir/indent-guides.nvim"
    },
    -- {   -- Indent guides
    --     "lukas-reineke/indent-blankline.nvim",
    --     requires = {"lukas-reineke/virt-column.nvim"},
    -- },
    {   -- Stabilise split creation  TODO remove when merged in 0.9
        "luukvbaal/stabilize.nvim",
    },
    {   -- smarter split resize functions
        "mrjones2014/smart-splits.nvim",
    },
    {   -- Colors Hex codes
        "norcalli/nvim-colorizer.lua",
    },
    {   -- Subtle highlighting of instances of word under cursor
        "RRethy/vim-illuminate",
    },
    {   -- Link :make to pytest
        "5long/pytest-vim-compiler",
    },
}

plugins.textobjs = {
    {   -- Many many more text objects
        "wellle/targets.vim",
    },
    {   -- iv/av => Text objects for substrings in snake/camel/kebab case
        "Julian/vim-textobj-variable-segment",
        requires = {'kana/vim-textobj-user'},
    },
}

plugins.style = {
    {   -- Colorscheme (try nightfox or catpuccin?)
        "ellisonleao/gruvbox.nvim",
        requires = { "rktjmp/lush.nvim" },
    },
    {   -- Better f/t targets
        "unblevable/quick-scope",
        config = function()
            vim.g.qs_max_chars = 800
            vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }
        end
    },
    {   -- Better quickfix list format
        "https://gitlab.com/yorickpeterse/nvim-pqf",
    },
    {   -- Statusline
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", "arkav/lualine-lsp-progress", },
    },
}

plugins.completion = {
    {   -- Snippets
        "L3MON4D3/LuaSnip",
        requires = { "rafamadriz/friendly-snippets", },
    },
    {   -- Completion menu
        "hrsh7th/nvim-cmp",
        requires = {
            "onsails/lspkind-nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "kdheepak/cmp-latex-symbols",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            -- "amarakon/nvim-cmp-buffer-lines",
        },
    },
    {   -- Autoclose brakcets and quotes
        "windwp/nvim-autopairs",
    }
}

plugins.treesitter = {
    {   -- TreeSitter plugin configuration
        "nvim-treesitter/nvim-treesitter",
        requires = {
            "nvim-treesitter/playground",
            "nvim-treesitter/nvim-treesitter-textobjects",
            "lewis6991/nvim-treesitter-context",  -- Pop-up for context
            "danymat/neogen",  -- Generate docstrings
            "andymass/vim-matchup",  -- Extended motions for %
            "phelipetls/jsonpath.nvim",  -- JSON paths require"jsonpath".get()
        },
        run = ":TSUpdate",
    },
}

plugins.telescope = {
    {   -- Telescope!!
        "nvim-telescope/telescope-fzf-native.nvim",
        run = 'make',
    },
    {   -- Extensible Fuzzy finder
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzf-native.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
        },
    },
}

plugins.lsp = {
    {   -- LSP Engine configuration
        "neovim/nvim-lspconfig",
        requires = {
            "hrsh7th/cmp-nvim-lsp",  -- cmp integration for lsp
            "Mofiqul/trld.nvim",  -- display diagnostic status in top right
        },
    },
    {    -- :Lsp <cmd> => Command interface for LSP functions
        "ii14/lsp-command",
    },
    {   -- Extra sources for LSP
        "jose-elias-alvarez/null-ls.nvim",
    },
    {   -- Debugger interfaces
        "mfussenegger/nvim-dap",
        requires = {"mfussenegger/nvim-dap-python"},
    },
    {   -- Installer for external tools
        "williamboman/mason.nvim",
        requires = {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
    },
}


local ensure_packer = function()
    local packer_location = '/site/pack/packer/start/packer.nvim'
    local install_path = vim.fn.stdpath('data') .. packer_location

    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        local packer_url = "https://github.com/wbthomason/packer.nvim"
        vim.fn.system({'git', 'clone', '--depth', '1', packer_url, install_path})
        vim.cmd.packadd('packer.nvim')
        return true
    end
    return false
end


local set_plugins = function(repos)
    local packer_bootstrap = ensure_packer()
    local status_ok, packer = pcall(require, "packer")
    if not status_ok then
        error("Warning: Packer not properly installed, skipping plugin loading.")
        return
    end

    packer.init({
        snapshot_path = vim.fn.stdpath("config") .. "/snapshots",
        snapshot = "packer.json",
    })
    packer.reset()
    packer.use({'wbthomason/packer.nvim'})

    for _, repo_group in pairs(repos) do
        for _, repo in pairs(repo_group) do
            packer.use(repo)
        end
    end

    packer.install()

    if packer_bootstrap then
        packer.sync()
    end
    return
end

set_plugins(plugins)
