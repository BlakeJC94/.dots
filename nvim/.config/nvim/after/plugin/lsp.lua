local lsp_settings = {
    pyright = {
        python = {
            venvPath = os.getenv("PYENV_ROOT") .. '/versions',
            venv = string.gsub(os.getenv("VIRTUAL_ENV") or "", "/%S+/", ""),
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "basic",
                diagnosticSeverityOverrides = {
                    -- reportGeneralTypeIssues = "warning",
                    reportGeneralTypeIssues = "none",
                    reportOptionalMemberAccess = "none",
                    reportOptionalSubscript = "none",
                    reportPrivateImportUsage = "none",
                },
            },
        },
    },
    sumneko_lua = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = {'vim'} },
            workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false, },
            telemetry = { enable = false },
        },
    },
    julials = {},
    bashls = {},
    rust_analyzer = {},
}

local function lspconfig_on_attach()
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local function configure_mason()
    require("mason").setup()
    require("mason-tool-installer").setup({
        ensure_installed = {
            -- lspconfig tools
            "pyright",
            "lua-language-server",
            "bash-language-server",
            "julia-lsp",
            "rust-analyzer",
            -- null-ls tools
            "jq",
            "stylua",
            "luacheck",
            "shellcheck",
            -- "black",  -- TODO find a pyenv-compatible solution
            -- "pylint",  -- TODO find a pyenv-compatible solution
            -- dap adapters
            -- "debugpy",  -- TODO find a pyenv-compatible solution
        },
    })
end

local function configure_lspconfig()
    vim.diagnostic.config({
        virtual_text = false,
        signs = false,
        underline = true,
        update_in_insert = false,
        severity_sort = false,
    })

    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for sign_type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. sign_type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    local lspconfig = require('lspconfig')
    for lsp, settings in pairs(lsp_settings) do
        lspconfig[lsp].setup({
            on_attach = lspconfig_on_attach,
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
            flags = { debounce_text_changes = 150 },
            settings = settings,
        })
    end

    require('trld').setup({})
end

local function null_ls_juliaformatter()
    local h = require("null-ls.helpers")
    local methods = require("null-ls.methods")
    return h.make_builtin({
        name = "juliaformatter",
        meta = {
            url = "https://github.com/domluna/JuliaFormatter.jl",
            description = "An opinionated code formatter for Julia. Plot twist - the opinion is your own.",
        },
        method = methods.internal.FORMATTING,
        filetypes = { "julia" },
        generator_opts = {
            command = "julia",
            args = {
                -- "--project=" .. juliaformatter_project,
                "--startup-file=no",
                "--color=no",
                "-e",
                [['using JuliaFormatter; format("$FILENAME")']],
            },
            to_stdin = false,
        },
        factory = h.formatter_factory,
    })
end

local function configure_null_ls()
    local null_ls = require("null-ls")
    null_ls.setup({
        sources = {
            null_ls.builtins.formatting.black,
            null_ls.builtins.diagnostics.pylint,
            null_ls.builtins.formatting.jq,
            null_ls.builtins.diagnostics.luacheck,
            null_ls.builtins.formatting.stylua,
            -- null_ls_juliaformatter(),
        },
    })
end

local function configure_dap()
    local dap = require("dap")
    dap.configurations.python = {
        {
            type = "python",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            pythonPath = function()
                return "/home/blake/.pyenv/shims/python"
            end,
        },
    }

    require('dap-python').test_runner = 'pytest'
    require('dap-python').setup('~/.pyenv/shims/python')
end

local function configure_lsp()
    configure_mason()
    configure_lspconfig()
    configure_null_ls()
    configure_dap()
end

configure_lsp()
