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
        'neovim/nvim-lspconfig',
        config = "require('plugin.lspconfig')",
    }

    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
        },
        config = "require('plugin.cmp')",
    }


    --use {
    --    'glepnir/lspsaga.nvim',
    --    config = [[reqiure('plugin.lspsaga')]],
    --}


    -- use {
    --     'glepnir/lspsaga.nvim',
    --     config = function() require'lspsaga'.init_lsp_saga({
    --  error_sign = '',
    --  warn_sign = '',
    --  hint_sign = '',
    --  infor_sign = '',
    --     }) end
    -- }
    --
    -- use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    -- use 'hrsh7th/cmp-nvim-lsp'

    use {"ellisonleao/gruvbox.nvim",
        requires = {"rktjmp/lush.nvim"}
    }
end
return require('packer').startup(packer_startup)
