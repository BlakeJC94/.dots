-- Install Packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

-- Update plugins after saving changes to plugins.lua
vim.api.nvim_exec([[
    augroup Packer
        autocmd!
        autocmd BufWritePost plugins.lua PackerCompile
    augroup end
]], false)

packer_startup = function()
    use 'wbthomason/packer.nvim'

    use {
        "L3MON4D3/LuaSnip",
        requires = {
            "rafamadriz/friendly-snippets",
        },
        config = "require('plugin.luasnip')",
    }

    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
        },
        config = "require('plugin.cmp')",
    }

    use {
        'neovim/nvim-lspconfig',
        config = "require('plugin.lspconfig')",
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        },
        config = "require('plugin.telescope')",
    }

    --use {
    --    'glepnir/lspsaga.nvim',
    --    config = [[reqiure('plugin.lspsaga')]],
    --}

    use {
        "terrortylor/nvim-comment",
        event = "BufRead",
        config = function()
            require("nvim_comment").setup()
        end,
    }


    -- TODO add startify

    use {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end
    }

    use {
        "lukas-reineke/indent-blankline.nvim",
        config = "require('plugin.indent-blankline')",
    }

    use {"ellisonleao/gruvbox.nvim",
        requires = {"rktjmp/lush.nvim"}
    }
end
return require('packer').startup(packer_startup)
