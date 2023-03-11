local M = {}

function M.config()
    vim.g.qs_max_chars = 800
    vim.g.qs_highlight_on_keys = { "f", "F", "t", "T" }

    local function set_quickscope_colors()
        vim.cmd.highlight("QuickScopePrimary guifg='#ff007c' gui=bold ctermfg=198 cterm=bold")
        vim.cmd.highlight("QuickScopeSecondary guifg='#00dfff' gui=bold ctermfg=45 cterm=bold")
    end

    local augroup = vim.api.nvim_create_augroup
    local autocmd = vim.api.nvim_create_autocmd
    autocmd(
        {"FileType"},
        {
            group = augroup("dap_ui_opts", {clear = true}),
            pattern = {"dapui_scopes", "dapui_breakpoints", "dapui_stacks", "dapui_watches",
                "dap-repl", "dapui_console",
            },
            callback = function()
                vim.opt_local.spell = false
                vim.opt_local.colorcolumn = {}
                vim.opt_local.foldlevel = 99
            end,
        }
    )

    set_quickscope_colors()
end

return M
