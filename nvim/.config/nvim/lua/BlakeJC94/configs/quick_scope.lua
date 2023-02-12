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
        {"ColorScheme"},
        {
            group = augroup("quick_scope_colors", {clear = true}),
            pattern = "*",
            callback = set_quickscope_colors,
        }
    )

    set_quickscope_colors()
end

return M
