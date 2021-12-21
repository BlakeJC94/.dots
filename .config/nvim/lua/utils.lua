M = {}


M.map = function(mode, lhs, rhs, diff_opts)
    opts = {noremap = true, silent = true}
    if diff_opts then opts = vim.tbl_extend('force', opts, diff_opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

M.b_map = function(mode, lhs, rhs, diff_opts, diff_bufnr)
    opts = {noremap = true, silent = true}
    bufnr = 0
    if diff_opts then opts = vim.tbl_extend('force', opts, diff_opts) end
    if diff_bufnr then bufnr = diff_bufnr end
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
end

M.b_opt = function(lhs, rhs, opts, diff_bufnr)
    bufnr = 0
    if diff_bufnr then bufnr = diff_bufnr end
    vim.api.nvim_buf_set_option(bufnr, lhs, rhs)
end

M.has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    local content = vim.api.nvim_buf_get_lines(0, line - 1, line, true)
    return col ~= 0 and content[1]:sub(col, col):match("%s") == nil
end

return M
