return {
    config = function()
        local augroup = vim.api.nvim_create_augroup
        local autocmd = vim.api.nvim_create_autocmd

        autocmd(
            {"ColorScheme"},
            {
                group = augroup("pytest_vim_compiler", {clear = true}),
                pattern = "*.py",
                callback = function() vim.cmd.compiler("pytest") end,
            }
        )
    end
}
