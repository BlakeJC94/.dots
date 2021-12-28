-- Select plugins to load
configs = require('configs')  -- ~/.config/nvim/lua/configs.lua
PLUGINS = function()
    use 'wbthomason/packer.nvim'
    use {   -- Fuzzy finder
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-bibtex.nvim',
        },
        config = configs.telescope,
    }
    use {  -- LSP Engine
        'neovim/nvim-lspconfig',
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "williamboman/nvim-lsp-installer",
        },
        config = configs.lspconfig,
    }
    use {  -- Completion
        "hrsh7th/nvim-cmp",
        requires = {
            "dcampos/nvim-snippy",
            "honza/vim-snippets",
            "onsails/lspkind-nvim",
            "dcampos/cmp-snippy",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "kdheepak/cmp-latex-symbols",
        },
        config = configs.cmp,
    }
    use {  -- File explorer
        "tamago324/lir.nvim",
        requires = {
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons',
        },
        config = configs.lir,
    }
    use {  -- Treesitter
        'nvim-treesitter/nvim-treesitter',
        requires = {
            'nvim-treesitter/playground',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'lewis6991/spellsitter.nvim',
            'romgrk/nvim-treesitter-context',
        },
        run = ':TSUpdate',
        config = configs.treesitter,
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
    use {  -- [<SEL><C-c><C-c>] = Send to neovim terminal
        'jpalardy/vim-slime',
        config = configs.slime,
    }
    use {  -- Git changes indicators
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = configs.gitsigns,
    }
    use {  -- Colors Hex codes
        "norcalli/nvim-colorizer.lua",
        config = function() require("colorizer").setup({'*'},{names=false}) end
    }
    use {  -- [:Cheat] = Integrate cheat.sh
        'RishabhRD/nvim-cheat.sh',
        requires = {'RishabhRD/popfix'},
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
    use {  -- File switching
        "ThePrimeagen/harpoon",
        requires={'nvim-lua/plenary.nvim'},
        config = configs.harpoon,
    }
    use {  -- Better terminals
        "akinsho/toggleterm.nvim",
        config = configs.toggleterm,
    }
    use {  -- Better statusline
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
        config = configs.lualine,
    }
    use {
        'sindrets/diffview.nvim',
        requires = 'nvim-lua/plenary.nvim'
    }
    use {
        'folke/which-key.nvim',
        config = configs.whichkey,
    }
    use {
        'renerocksai/telekasten.nvim',
        requires = {
            'nvim-telescope/telescope.nvim',
            'nvim-lua/plenary.nvim',
        },
        config = configs.telekasten,
    }
    use {
        'tpope/vim-repeat',                 -- Better .-repeat actions
        'tpope/vim-commentary',             -- [gc<motion>] = Toggle comments
        'tpope/vim-unimpaired',             -- More motions (see docs)
        'tpope/vim-surround',               -- cs]} : Change surrounding brackets
        'tpope/vim-rsi',                    -- Emacs-style binds during insert
        'jiangmiao/auto-pairs',             -- Auto-close brackets
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

