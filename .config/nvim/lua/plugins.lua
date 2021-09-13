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

packer_startup = function()
    use 'wbthomason/packer.nvim'
    use {
        'glepnir/lspsaga.nvim',
        config = function() require('lspsaga').init_lsp_saga() end,
    }

    -- Snippet engine
    use {
        "L3MON4D3/LuaSnip",
        requires = {
            "rafamadriz/friendly-snippets",
        },
        config = "require('config.luasnip')",
    }

    -- Nice icons
    use {
        "onsails/lspkind-nvim",
        config = function() require('lspkind').init() end
    }

    -- Completion engine
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "kdheepak/cmp-latex-symbols",
        },
        config = "require('config.cmp')",
    }

    -- LSP engine
    -- TODO refactor mappings
    -- TODO saga
    use {
        'neovim/nvim-lspconfig',
        requires = {'glepnir/lspsaga.nvim'},
        config = "require('config.lspconfig')",
    }

    -- :Telescope find_files = fuzzy finder
    -- TODO refactor mappings
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = "require('config.telescope')",
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

    -- More text objects
    use {
        'wellle/targets.vim'
    }

    use {
        'AndrewRadev/splitjoin.vim',
    }

    -- :Zenmode = Maximise and focus buffer
    use {
        "folke/zen-mode.nvim",
        config = function() require("zen-mode").setup({}) end
    }

    use {
        "beauwilliams/focus.nvim",
        requires = {'danilamihailov/beacon.nvim'},
        config = function() require("focus").setup() end
    }

    -- cs]} : Change surrounding brackets
    use 'tpope/vim-surround'

    -- reveal registers when needed!
    use {'junegunn/vim-peekaboo'}

    -- select indent levels with <sel>i
    use {
        'michaeljsmith/vim-indent-object'
    }

    -- align with gl<sel><obj><char>
    use {
        'tommcdo/vim-lion'
    }

    -- Git changes indicators
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function() require('gitsigns').setup() end
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


    -- Quicker navigation
    use {
        'phaazon/hop.nvim',
        as = 'hop',
        requires = {'unblevable/quick-scope'},
        config = function() require("config.hop") end,
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

    -- Colorscheme
    use {"ellisonleao/gruvbox.nvim",
        requires = {"rktjmp/lush.nvim"}
    }
end
return require('packer').startup(packer_startup)
