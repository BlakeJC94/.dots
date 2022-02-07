-- Select plugins to load
configs = require('configs')  -- ~/.config/nvim/lua/configs.lua
PLUGINS = function()
    use 'wbthomason/packer.nvim'

    use {  -- Colorscheme
        "ellisonleao/gruvbox.nvim",
        requires = {"rktjmp/lush.nvim"},
        config = configs.gruvbox,
    }

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
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            'https://gitlab.com/yorickpeterse/nvim-pqf',
            "williamboman/nvim-lsp-installer",
        },
        config = configs.lspconfig,
    }

    use {
        'j-hui/fidget.nvim',
        config = function() require('fidget').setup({}) end,
    }

    use {  -- Autocompletion menu
        "hrsh7th/nvim-cmp",
        requires = {
            "onsails/lspkind-nvim",
            "windwp/nvim-autopairs",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "kdheepak/cmp-latex-symbols",
            "hrsh7th/cmp-copilot",
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
            -- "SmiteshP/nvim-gps",
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
        requires = {'jpalardy/vim-slime'},
        config = configs.toggleterm,
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

    use {  -- Better statusline
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            'arkav/lualine-lsp-progress',
        },
        config = configs.lualine,
    }

    -- use {  -- Landing page
    --     'goolord/alpha-nvim',
    --     config = configs.alpha,
    -- }

    use {
        "folke/which-key.nvim",
        config = configs.whichkey,
    }

    use {  -- Stabilise split creation
        "luukvbaal/stabilize.nvim",
        config = function() require("stabilize").setup() end
    }

    use {  -- Colors Hex codes
        "norcalli/nvim-colorizer.lua",
        config = function() require("colorizer").setup({'*'}, {names=false}) end
    }

    use {  -- Indent guides
        "lukas-reineke/indent-blankline.nvim",
        requires = {"lukas-reineke/virt-column.nvim"},
        config = configs.indent_blankline,
    }

    use {  -- Better f/t targets
        "unblevable/quick-scope",
        config = configs.quickscope,
    }

    use {  -- Firefox injection
        'glacambre/firenvim',
        run = function() vim.fn['firenvim#install'](0) end,
        config = configs.firenvim,
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

    use {
        "folke/zen-mode.nvim",
        requires = {"folke/twilight.nvim"},
        config = function() require("zen-mode").setup({}) end
    }

    use {  -- iv/av: Text objects for substrings in snake/camel/kebab case
        'Julian/vim-textobj-variable-segment',
        requires = {'kana/vim-textobj-user'}
    }

    use {
        "winston0410/range-highlight.nvim",
        config = function() require('range-highlight').setup({}) end,
        requires = {'winston0410/cmd-parser.nvim'}
    }

    use {
        "jbyuki/venn.nvim",
        config = configs.venn,
    }

    use {
        'jose-elias-alvarez/null-ls.nvim',
        config = configs.null_ls,
    }

    use {
        'AckslD/nvim-revJ.lua',
        requires = {'wellle/targets.vim'},
        config = configs.revj,
    }

    use {  -- :Neogen => Generate annotations for function
        "danymat/neogen",
        config = function() require('neogen').setup { enabled = true } end,
        requires = "nvim-treesitter/nvim-treesitter"
    }

    use {
        'nacro90/numb.nvim',
        config = function() require('numb').setup() end,
    }

    use {
        'ethanholz/nvim-lastplace',
        config = function() require'nvim-lastplace'.setup{} end,
    }

    use {
        'github/copilot.vim',
        config = function()
            vim.g.copilot_no_tab_map = true
            vim.g.copilot_assume_mapped = true
            vim.g.copilot_tab_fallback = ""
        end,
    }

    use {  -- Smaller plugins
        'tpope/vim-repeat',                           -- Better .-repeat actions
        'tpope/vim-surround',                         -- cs]} : Change surrounding brackets
        'tpope/vim-commentary',                       -- gc<motion> : toggle comments
        'tpope/vim-abolish',                          -- crs : coerce cursor word to snake_case
        'alec-gibson/nvim-tetris',                    -- :Tetris
        'danilamihailov/beacon.nvim',                 -- Ping cursor location after jump
        'wellle/targets.vim',                         -- More text objects
        'tommcdo/vim-lion',                           -- align selection with gl<obj><char>
        'Vimjas/vim-python-pep8-indent',              -- Fix for auto-indent in treesitter
        'jbyuki/nabla.nvim',
        'ekickx/clipboard-image.nvim',                -- :PasteImg => Link to imafe in clipboard
        'sheerun/vim-polyglot',                       -- Language pack to use if TS not present
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

