local plugins = {}

plugins.actions = {
    {   -- Readline keybindings for insert/command mode (<C-a> <A-b> <A-f> <C-e>)
        "tpope/vim-rsi",
    },
    {   -- Unix commands
        "tpope/vim-eunuch"
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
    {   -- gc<motion> => toggle comments
        "tpope/vim-unimpaired",
    },
    {   -- gl<obj><char> => align selection to <char>
        "tommcdo/vim-lion",
    },
    {   -- gs<object> => Sort operator across object
        "christoomey/vim-sort-motion",
    },
    {   -- Many many more text objects
        "wellle/targets.vim",
    },
    {   -- iv/av => Text objects for substrings in snake/camel/kebab case
        "Julian/vim-textobj-variable-segment",
        requires = {'kana/vim-textobj-user'},
    },
}

plugins.interface = {
    {   -- The ultimate git plugin for Vim
        "tpope/vim-fugitive",
        requires = {
            "tpope/vim-rhubarb",
            "oguzbilgic/vim-gdiff",
            "christoomey/vim-conflicted",
        },
    },
    -- {   -- TODO revisit this
    --     'sindrets/diffview.nvim',
    --     requires = {'nvim-lua/plenary.nvim'},
    -- },
    {
        -- "BlakeJC94/neozettel",
        "~/Workspace/repos/field-notes.nvim",
        config = function()
                local field_notes_path = vim.fn.expand('~/Workspace/repos/field-notes')
                require("field_notes").setup(
                {
                    field_notes_path = field_notes_path,
                    notes_dir = 'notes',
                    journal_dir = 'journal',
                    journal_subdirs = {
                        day = 'daily',
                        week = 'weekly',
                        month = 'monthly',
                    }
                }
            )
        end,
    },
    {   -- Notes
        "renerocksai/telekasten.nvim",
        config = require("BlakeJC94.configs.interface").config_telekasten,
    },
    {
        "Glench/Vim-Jinja2-Syntax",
    },
    {   -- Gitgutter, floating hunks, and virtual text blames
        "lewis6991/gitsigns.nvim",
        requires = {'nvim-lua/plenary.nvim'},
        config = require("BlakeJC94.configs.interface").config_gitsigns
    },
    {   -- <C-c><C-c> => Send code snippet to terminal
        "jpalardy/vim-slime",
        config = require("BlakeJC94.configs.interface").slime
    },
    {   -- Jump to last place when opening a file
        "ethanholz/nvim-lastplace",
        config = function() require('nvim-lastplace').setup({}) end
    },
    {   -- Ping cursor location after jump
        "danilamihailov/beacon.nvim",
    },
    {   -- Stabilise split creation  TODO remove when merged in 0.9
        "luukvbaal/stabilize.nvim",
        config = function() require("stabilize").setup() end,
    },
    {   -- smarter split resize functions
        "mrjones2014/smart-splits.nvim",
    },
    {   -- Colors Hex codes
        "norcalli/nvim-colorizer.lua",
        config = function() require("colorizer").setup({'*'}, {names=false}) end
    },
    {   -- Subtle highlighting of instances of word under cursor
        "RRethy/vim-illuminate",
        config = require("BlakeJC94.configs.interface").illuminate
    },
    {   -- Link :make to pytest
        "5long/pytest-vim-compiler",
        config = require("BlakeJC94.configs.interface").pytest_compiler
    },
    {   -- :DocsViewToggle
        "amrbashir/nvim-docs-view",
        config = function()
            require("docs-view").setup {
                position = "bottom",
                height = 10,
            }
        end
    },
    {   -- :UndotreeToggle
        'mbbill/undotree',
    },
    {   -- <Leader>gy : Git linker
        "ruifm/gitlinker.nvim",
        config = function() require("gitlinker").setup({}) end,
    },
}

plugins.style = {
    {   -- Colorscheme
        "ellisonleao/gruvbox.nvim", -- rose-pine and tokyonight look neat too
        requires = {"rktjmp/lush.nvim", "RRethy/vim-illuminate"},
        config = require("BlakeJC94.configs.style").configure_gruvbox,
    },
    {   -- Better f/t targets
        "unblevable/quick-scope",
        config = require("BlakeJC94.configs.style").configure_quick_scope,
    },
    {   -- Better quickfix list format
        "https://gitlab.com/yorickpeterse/nvim-pqf",
        config = require("BlakeJC94.configs.style").configure_pqf,
    },
    {   -- Statusline
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", "arkav/lualine-lsp-progress", },
        config = require("BlakeJC94.configs.style").configure_lualine,
    },
    {   -- Indent guides
        "lukas-reineke/indent-blankline.nvim",
        requires = {"lukas-reineke/virt-column.nvim"},
        config = require("BlakeJC94.configs.style").configure_indent_guides,
    },
}

plugins.completion = {
    {   -- Snippets
        "L3MON4D3/LuaSnip",
        requires = { "rafamadriz/friendly-snippets", },
        config = function() require("luasnip.loaders.from_vscode").lazy_load() end,
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
        config = require("BlakeJC94.configs.completion").config_cmp
    },
    {   -- Autoclose brakcets and quotes
        "windwp/nvim-autopairs",
        requires = { "hrsh7th/nvim-cmp", },
        config = require("BlakeJC94.configs.completion").config_cmp_autopairs
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
        config = require("BlakeJC94.configs.treesitter").config
    },
    {
        'ckolkey/ts-node-action',
        requires = { 'nvim-treesitter' },
        config = function() require("ts-node-action").setup({}) end
    },
    {
        "ThePrimeagen/refactoring.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function() require('refactoring').setup({}) end,
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
        config = require("BlakeJC94.configs.telescope").config
    },
}

plugins.lsp = {
    {   -- LSP Engine configuration
        "neovim/nvim-lspconfig",
        requires = {
            "hrsh7th/cmp-nvim-lsp",  -- cmp integration for lsp
            "Mofiqul/trld.nvim",  -- display diagnostic status in top right
        },
        config = require("BlakeJC94.configs.lsp").config_lsp
    },
    {    -- :Lsp <cmd> => Command interface for LSP functions
        "ii14/lsp-command",
    },
    {   -- Extra sources for LSP
        "jose-elias-alvarez/null-ls.nvim",
        config = require("BlakeJC94.configs.lsp").config_null_ls
    },
    {   -- Debugger interfaces
        "mfussenegger/nvim-dap",
        requires = {"mfussenegger/nvim-dap-python"},
        config = require("BlakeJC94.configs.lsp").config_dap
    },
    {   -- Installer for external tools
        "williamboman/mason.nvim",
        requires = {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        config = require("BlakeJC94.configs.lsp").config_mason
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
        max_jobs = 16,
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
end

set_plugins(plugins)
