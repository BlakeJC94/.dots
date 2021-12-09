-- Install Packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

-- Update plugins after saving changes to plugins.lua
vim.api.nvim_exec([[
    augroup Packer
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]], false)

-- Select plugins to load
packer_startup = function()
    use 'wbthomason/packer.nvim'

    -- :Telescope find_files = fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = "require('config.telescope')",
    }

    -- LSP engine
    use {
        'neovim/nvim-lspconfig',
        config = "require('config.lspconfig')",
    }

    -- Completion and snippet engine
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
            "onsails/lspkind-nvim",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "kdheepak/cmp-latex-symbols",
        },
        config = "require('config.cmp')",
    }

    -- explorer
    use {
        "tamago324/lir.nvim",
        requires = {
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons',
        },
        config = function() require("config.lir") end,
    }

    -- Landing page
    use {
        'goolord/alpha-nvim',
        requires = {'BlakeJC94/alpha-nvim-fortune'},
        config = function() require("config.alpha") end,
    }

    -- firefox injection
    use {
        'glacambre/firenvim',
        config = function() require("config.firenvim") end,
        run = function() vim.fn['firenvim#install'](0) end,
    }
    -- gc<motion> = Toggle comments
    use {
        "tpope/vim-commentary",  -- how is this not default behaviour??
        requires = {'tpope/vim-repeat'},
    }

    -- <C-c><C-c> = Send selection to neovim terminal
    use {
        "jpalardy/vim-slime",
        config = function()
            vim.g.slime_target = "neovim"
            vim.g.slime_python_ipython = 1
        end,
    }

    -- :Zenmode = Maximise and focus buffer
    use {
        "folke/zen-mode.nvim",
        config = function() require("config.zen-mode") end,
    }

    -- Ping cursor location after jump
    use {'danilamihailov/beacon.nvim'}

    -- Git changes indicators
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function() require('gitsigns').setup() end
    }

    -- Integrate cheat.sh
    use {
        'RishabhRD/nvim-cheat.sh',
        requires = {'RishabhRD/popfix'},
    }

    -- Colors Hex codes
    use {
        "norcalli/nvim-colorizer.lua",
        config = function() require("colorizer").setup() end
    }

    -- Shows indent guides
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = "require('config.indent-blankline')",
    }

    -- Maximiser
    use {
        "szw/vim-maximizer",
        config = function()
            vim.g.maximizer_set_default_mapping = 1
            vim.g.maximizer_set_mapping_with_bang = 0
            vim.g.maximizer_default_mapping_key = "\\\\"
        end,
    }

    -- Colorschemes
    use {
        "ellisonleao/gruvbox.nvim",
        requires = {"rktjmp/lush.nvim"}
    }

    -- Enhanced f/t motion cues
    use {
        "unblevable/quick-scope",
        config = "require('config.quickscope')",
    }

    -- File switching
    use {
        "ThePrimeagen/harpoon",
        requires={'nvim-lua/plenary.nvim'},
        config = "require('config.harpoon')",
    }

    -- More text objects
    use 'wellle/targets.vim'
    -- cs]} : Change surrounding brackets
    use 'tpope/vim-surround'
    -- reveal registers when needed!
    use 'junegunn/vim-peekaboo'
    -- select indent levels with <sel>i
    use 'michaeljsmith/vim-indent-object'
    -- align with <sel>gl<obj><char>
    use 'tommcdo/vim-lion'
    -- More language support
    use 'sheerun/vim-polyglot'

end
return require('packer').startup(packer_startup)
