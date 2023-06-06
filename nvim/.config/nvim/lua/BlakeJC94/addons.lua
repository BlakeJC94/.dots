local repos = {
    --- ACTIONS ---
    { "tpope/vim-rsi" }, -- Readline keybindings for insert/command mode (<C-a> <A-b> <A-f> <C-e>)
    { "tpope/vim-eunuch" }, -- Unix commands
    { "tpope/vim-repeat" }, -- Better .-repeat actions
    { "tpope/vim-surround" }, -- cs] => Change surrounding brackets
    { "tpope/vim-commentary" }, -- gc<motion> => toggle comments
    { "tpope/vim-unimpaired" },
    { "tpope/vim-dispatch" },
    { "tpope/vim-fugitive" }, -- The ultimate git plugin for Vim
    { "tpope/vim-sleuth" },
    { "junegunn/vim-easy-align" }, -- ga<obj><char> => align selection to <char>
    { "Julian/vim-textobj-variable-segment" },
    { "lervag/wiki.vim" },
    --- INTERFACE ---
    { "BlakeJC94/field-notes.nvim", branch = "dev" },
    { "ibhagwan/fzf-lua" },
    { "lewis6991/gitsigns.nvim" }, -- Gitgutter, floating hunks, and virtual text blames
    { "jpalardy/vim-slime" }, -- <C-c><C-c> => Send code snippet to terminal
    { "ethanholz/nvim-lastplace" }, -- Jump to last place when opening a file
    { "mbbill/undotree" }, -- :UndotreeToggle
    --- LSP ---
    { "neovim/nvim-lspconfig" }, -- LSP Engine configuration
    { "ray-x/lsp_signature.nvim" },
    { "Mofiqul/trld.nvim" }, -- display diagnostic message in top right
    { "jose-elias-alvarez/null-ls.nvim" }, -- Extra sources for LSP
    { "williamboman/mason.nvim" }, -- Installer for external tools
    { "simrat39/symbols-outline.nvim" },
    --- COMPLETION ---
    { "zbirenbaum/copilot.lua", cmd = "Copilot", event = "InsertEnter" },
    { "hrsh7th/nvim-cmp" },
    { "windwp/nvim-autopairs" }, -- Autoclose brakcets and quotes
    --- TREESITTER ---
    { "nvim-treesitter/nvim-treesitter" }, -- TreeSitter plugin configuration
    { "nvim-treesitter/nvim-treesitter-context" }, -- Pop-up for context
    { "danymat/neogen" }, -- Generate docstrings
    { "Wansmer/treesj" },
    --- STYLE ---
    { "ellisonleao/gruvbox.nvim" },
    { "danilamihailov/beacon.nvim" }, -- Ping cursor location after jump
    { "tzachar/local-highlight.nvim" },
    { "brenoprata10/nvim-highlight-colors" }, -- Colors Hex codes
    { "nvimdev/indentmini.nvim" },
}

local function ensure_packer()
    local packer_location = "/site/pack/packer/start/packer.nvim"
    local packer_url = "https://github.com/wbthomason/packer.nvim"
    local install_path = vim.fn.stdpath("data") .. packer_location

    local packer_bootstrap = false
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.fn.system({ "git", "clone", "--depth", "1", packer_url, install_path })
        vim.cmd.packadd("packer.nvim")
        packer_bootstrap = true
    end

    return packer_bootstrap
end

local function assemble_packer_module(repo)
    local repo_name = string.match(repo[1], "[^/]+$")
    local config_name = require("BlakeJC94.functions").slugify(repo_name)

    local status_ok, config = pcall(require, "BlakeJC94.configs." .. config_name)
    if not status_ok then
        if vim.fn.filereadable(vim.fn.stdpath("config") .. "/lua/BlakeJC94/configs/" .. config_name .. ".lua") == 1 then
            local msg = "WARN: issue loading additional config for " .. repo_name .. " (cont Y/n)? "
            if vim.fn.input(msg) == "n" then
                error("abort")
            end
        end
        return repo
    end

    repo = vim.tbl_extend("force", repo, config)
    local repo_processed = { repo[1] }
    local packer_keys = {
        "disable",
        "as",
        "installer",
        "updater",
        "after",
        "rtp",
        "opt",
        "bufread",
        "branch",
        "tag",
        "commit",
        "lock",
        "run",
        "requires",
        "config",
        "rocks",
        "cmd",
        "ft",
        "keys",
        "event",
        "fn",
        "cond",
        "setup",
        "module",
        "module_pattern",
    }
    for _, k in ipairs(packer_keys) do
        if repo[k] then
            repo_processed[k] = repo[k]
        end
    end

    return repo_processed
end

local function configure_packer(packer)
    packer.init({
        snapshot_path = vim.fn.stdpath("config") .. "/snapshots",
        snapshot = "packer.json",
        max_jobs = 16,
    })
    packer.reset()
    packer.use({ "wbthomason/packer.nvim" })
end

local function setup_goto_config_command()
    vim.api.nvim_create_user_command(
        "GotoConfig",
        require("BlakeJC94.functions").goto_config,
        { force = true, range = true }
    )
end

local M = {}

function M.set()
    local packer_bootstrap = ensure_packer()
    local status_ok, packer = pcall(require, "packer")
    if not status_ok then
        print("Warning: Packer not properly installed, skipping plugin loading.")
        return
    end
    configure_packer(packer)
    for _, repo in ipairs(repos) do
        packer.use(assemble_packer_module(repo))
    end
    packer.install()
    if packer_bootstrap then
        packer.sync()
    end

    setup_goto_config_command()
end

return M
