M = {}

DEFAULT_MAP_OPTS = {noremap = true, silent = true}
buffer_number = 0

M.map = function(mode, lhs, rhs, opts)
    if opts then options = vim.tbl_extend('force', DEFAULT_MAP_OPTS, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

M.b_map = function(mode, lhs, rhs, opts, bufnr)
    if opts then options = vim.tbl_extend('force', DEFAULT_MAP_OPTS, opts) end
    if bufnr then buffer = bufnr else buffer = DEFAULT_BUFNR end
    vim.api.nvim_buf_set_keymap(buffer, mode, lhs, rhs, options)
end

M.b_opt = function(mode, lhs, rhs, opts, bufnr)
    if opts then options = vim.tbl_extend('force', DEFAULT_MAP_OPTS, opts) end
    if bufnr then buffer = bufnr else buffer = DEFAULT_BUFNR end
    vim.api.nvim_buf_set_option(buffer, mode, lhs, rhs, options)
end

M.check_back_space = function()
    local col = vim.fn.col '.' - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
end

t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

M.tab_complete = function(fallback)
    if require('cmp').visible() then
        vim.cmd [[echo "TRACE" ]]
        cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
    else
        fallback()
    end
end

M.s_tab_complete = function(fallback)
    if cmp.visible() then
        cmp.select_prev_item()
    elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
    else
        fallback()
    end
end

return M
