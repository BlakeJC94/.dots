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
    use {
        'neovim/nvim-lspconfig',
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
        "terrortylor/nvim-comment",
        event = "BufRead",
        config = function()
            require("nvim_comment").setup()
        end,
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
        config = function() require("zen-mode").setup({}) end
    }

    use 'tpope/vim-surround'            -- cs]} : Change surrounding brackets
    use 'tpope/vim-repeat'              --   Fix . for some plugins
    use 'junegunn/vim-easy-align'       -- [<C-v>]ga*<char> : align to char
    use 'triglav/vim-visual-increment'  -- [<C-v>]<C-a/x> : Increment column

    -- Git changes indicators
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = function() require('gitsigns').setup() end
    }

    -- Landing page
    use {
        "goolord/alpha-nvim",
        config = function() require("config.alpha") end,
    }

    use {
        'glacambre/firenvim',
        config = function() require("config.firenvim") end,
        run = function() vim.fn['firenvim#install'](0) end
    }


    -- Quicker navigation
    use {
        'phaazon/hop.nvim',
        as = 'hop',
        config = function()
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }
    -- Colors Hex codes
    use {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end
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
