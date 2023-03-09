local M = {}

M.requires = { "5long/pytest-vim-compiler" } -- Link :make to pytest

M.config = function()
    local augroup = vim.api.nvim_create_augroup
    local autocmd = vim.api.nvim_create_autocmd
    autocmd(
        {"FileType"},
        {
            group = augroup("dispatch_pytest", {clear = true}),
            pattern = "python",
            callback = function() vim.cmd.compiler("pytest") end,
        }
    )
end

return M

