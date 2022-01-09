-- Select plugins to load
configs = require('configs')  -- ~/.config/nvim/lua/configs.lua
PLUGINS = function()
    use 'wbthomason/packer.nvim'

    use {  -- Extensible Fuzzy finder
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-bibtex.nvim',
        },
        config = configs.telescope,
    }

    use {  -- LSP Engine configuration
        'neovim/nvim-lspconfig',
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "williamboman/nvim-lsp-installer",
            'https://gitlab.com/yorickpeterse/nvim-pqf',
        },
        config = configs.lspconfig,
    }

    use {  -- Autocompletion menu
        "hrsh7th/nvim-cmp",
        requires = {
            "dcampos/nvim-snippy",
            "honza/vim-snippets",
            "onsails/lspkind-nvim",
            "windwp/nvim-autopairs",
            "dcampos/cmp-snippy",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "kdheepak/cmp-latex-symbols",
        },
        config = configs.cmp,
    }

    use {  -- Treesitter
        'nvim-treesitter/nvim-treesitter',
        requires = {
            'nvim-treesitter/playground',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'romgrk/nvim-treesitter-context',
            'lewis6991/spellsitter.nvim',
        },
        run = ':TSUpdate',
        config = configs.treesitter,
    }

    use {  -- Better File explorer
        "tamago324/lir.nvim",
        requires = {
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons',
        },
        config = configs.lir,
    }

    use {  -- Better terminals
        "akinsho/toggleterm.nvim",
        requires = {
            'jpalardy/vim-slime',
        },
        config = configs.toggleterm,
    }

    use {  -- iv/av: Text objects for substrings in snake/camel/kebab case
        'Julian/vim-textobj-variable-segment',
        requires = {
            'kana/vim-textobj-user'
        }
    }

    use {  -- Better git interactions
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'tpope/vim-fugitive',
            'tpope/vim-rhubarb',
            'junegunn/gv.vim',
        },
        config = configs.gitsigns,
    }

    use {  -- File switching
        "ThePrimeagen/harpoon",
        requires={'nvim-lua/plenary.nvim'},
        config = configs.harpoon,
    }

    use {  -- Better statusline
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = configs.lualine,
    }

    use {  -- Landing page
        'goolord/alpha-nvim',
        config = configs.alpha,
    }

    use {  -- Firefox injection
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end,
        config = configs.firenvim,
    }

    use {  -- Colors Hex codes
        "norcalli/nvim-colorizer.lua",
        config = function() require("colorizer").setup({'*'}, {names=false}) end
    }

    use {  -- Colorscheme
        "ellisonleao/gruvbox.nvim",
        requires = { "rktjmp/lush.nvim", },
        config = configs.gruvbox,
    }

    use {  -- Indent guides
        "lukas-reineke/indent-blankline.nvim",
            config = configs.indent_blankline,
        }

    use {  -- Better f/t targets
        "unblevable/quick-scope",
        config = configs.quickscope,
    }

    -- use {  -- Notes plugin
    --     'jakewvincent/mkdnflow.nvim',
    --     config = configs.mkdnflow,
    -- }

    -- use {
    --     'lervag/wiki.vim',
    --     -- requires = {'jakewvincent/mkdnflow.nvim',}
    --     config = configs.wiki,
    -- }

    use {  -- TODO
        'simrat39/symbols-outline.nvim'  -- aerial.nvim also looks cool
    }

    use {  -- Smaller plugins
        'tpope/vim-repeat',                 -- Better .-repeat actions
        'tpope/vim-surround',               -- cs]} : Change surrounding brackets
        'tpope/vim-commentary',             -- gc<motion> : toggle comments
        'tpope/vim-abolish',                -- <sel>crs : coerce to snake_case
        'vim-utils/vim-man',
        'sbdchd/neoformat',
        'alec-gibson/nvim-tetris',
        'danilamihailov/beacon.nvim',       -- Ping cursor location after jump
        'wellle/targets.vim',               -- More text objects
        'michaeljsmith/vim-indent-object',  -- select indent levels with ii or ai
        'szw/vim-maximizer',                -- Toggle maximise buffer
        'tommcdo/vim-lion',                 -- align selection with gl<obj><char>
        'Vimjas/vim-python-pep8-indent',    -- Fix for auto-indent in treesitter
    }
end

DISABLED_BUILT_INS = {
    'netrw',
    'netrwPlugin',
    'gzip',
    'man',
    'shada_plugin',
    'tarPlugin',
    'tar',
    'zipPlugin',
    'zip',
    'netrwPlugin',
    'tutor_mode_plugin',
    'remote_plugins',
    'spellfile_plugin',
    '2html_plugin',
}

M = {}

M.setup_packer = function()
    local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    local packer_url = 'https://github.com/wbthomason/packer.nvim'

    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        install_cmd = table.concat({'!git clone', packer_url, install_path}, ' ')
        vim.fn.execute(install_cmd)
    end

    -- Update plugins after saving changes to plugins.lua
    vim.api.nvim_exec([[
        augroup Packer
            autocmd!
            autocmd BufWritePost plugins.lua source <afile> | PackerCompile
            autocmd BufWritePost configs.lua source <afile> | PackerCompile
        augroup end
    ]], false)
end

M.disable_built_ins = function()
    for _, i in pairs(DISABLED_BUILT_INS) do
      vim.g['loaded_' .. i] = 1
    end
end

M.load_plugins = function()
    return require('packer').startup(PLUGINS)
end

return M

