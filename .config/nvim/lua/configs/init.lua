-- TODO split into smaller lists and fix ordering
return {
    ['Julian/vim-textobj-variable-segment'] = {
        requires = {'kana/vim-textobj-user'},
        branch = "main",
    },
    ["ellisonleao/gruvbox.nvim"] = {
        requires = {"rktjmp/lush.nvim"},
        config = require('configs.gruvbox'),
    },
    ['jpalardy/vim-slime'] = {config = require('configs.vim-slime')},
    ['https://gitlab.com/yorickpeterse/nvim-pqf'] = {config = require('configs.nvim-pqf')},
    ['nacro90/numb.nvim'] = {config = function() require('numb').setup() end},
    ['ethanholz/nvim-lastplace'] = {config = function() require('nvim-lastplace').setup{} end},
    ["luukvbaal/stabilize.nvim"] = {config = function() require("stabilize").setup() end},
    ["lukas-reineke/indent-blankline.nvim"] = {
        requires = {"lukas-reineke/virt-column.nvim"},
        config = require('configs.indent-blankline'),
    },
    ["unblevable/quick-scope"] = {config = require('configs.quick-scope')},
    ['norcalli/nvim-colorizer.lua'] = {config = require('configs.nvim-colorizer')},
    ["RRethy/vim-illuminate"] = {config = function() vim.g.Illuminate_ftblacklist = {'lir'} end},
    ['aserowy/tmux.nvim'] = {config = require('configs.tmux')},
    ["hrsh7th/nvim-cmp"] = {
        requires = {
            "onsails/lspkind-nvim",
            "windwp/nvim-autopairs",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "kdheepak/cmp-latex-symbols",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-cmdline",
        },
        config = require('configs.cmp'),
    },
    ['lewis6991/gitsigns.nvim'] = {
        requires = {'nvim-lua/plenary.nvim',},
        config = require('configs.gitsigns'),
    },
    ['nvim-lualine/lualine.nvim'] = {
        requires = {
            'kyazdani42/nvim-web-devicons',
            'arkav/lualine-lsp-progress',
        },
        config = require('configs.lualine'),
    },
    ['nvim-telescope/telescope-fzf-native.nvim'] = {run = 'make'},
    ['nvim-telescope/telescope.nvim'] = {
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzf-native.nvim',
            'nvim-telescope/telescope-file-browser.nvim',
        },
        config = require('configs.telescope'),
    },
    ['nvim-treesitter/nvim-treesitter'] = {
        requires = {
            'nvim-treesitter/playground',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'lewis6991/spellsitter.nvim',
            'lewis6991/nvim-treesitter-context',
            "danymat/neogen",
        },
        run = ':TSUpdate',
        config = require('configs.treesitter'),
    },
    ['neovim/nvim-lspconfig'] = {
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "ii14/lsp-command",
            'williamboman/mason.nvim',
        },
        config = require("configs.lspconfig"),
    },
    ['jose-elias-alvarez/null-ls.nvim'] = {config = require('configs.null_ls')},
    ['williamboman/mason.nvim'] = {
        requires = {"WhoIsSethDaniel/mason-tool-installer.nvim"},
        config = require('configs.mason'),
    },
    ['j-hui/fidget.nvim'] = {config = function() require('fidget').setup({}) end},
    ['Mofiqul/trld.nvim'] = {config = function() require('trld').setup({}) end},
}
