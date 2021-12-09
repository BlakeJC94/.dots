M = {}

map_opts = {noremap = true, silent = true}
buffer = 0

M.map = function(mode, lhs, rhs, opts)
    if opts then map_opts = vim.tbl_extend('force', map_opts, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, map_opts)
end

M.b_map = function(mode, lhs, rhs, opts, bufnr)
    if opts then options = vim.tbl_extend('force', map_opts, opts) end
    if bufnr then buffer = bufnr end
    vim.api.nvim_buf_set_keymap(buffer, mode, lhs, rhs, map_opts)
end

M.b_opt = function(lhs, rhs, opts, bufnr)
    if bufnr then buffer = bufnr end
    vim.api.nvim_buf_set_option(buffer, lhs, rhs)
end

M.has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    local content = vim.api.nvim_buf_get_lines(0, line - 1, line, true)
    return col ~= 0 and content[1]:sub(col, col):match("%s") == nil
end

return M
