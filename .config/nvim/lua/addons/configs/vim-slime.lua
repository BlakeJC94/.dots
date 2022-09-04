_G._configs.slime_nvim_terminal = function()
    vim.g.slime_target = "neovim"
end

_G._configs.slime_tmux = function()
    vim.g.slime_target = "tmux"
    vim.g.slime_paste_file = vim.fn.tempname() .. "_slime"
    vim.g.slime_default_config = {socket_name = "default", target_pane = "{last}"}

    local augroup = vim.api.nvim_create_augroup
    local autocmd = vim.api.nvim_create_autocmd
    autocmd(
        {"VimLeave"},
        {
            group = augroup("clear_slime", {clear = true}),
            pattern = "*",
            callback = function()
                local slime_files = vim.fn.glob('/tmp/nvim**_slime')
                if #slime_files > 1 then
                    for _, f in pairs(slime_files) do os.remove(f) end
                end
            end,
        }
    )
end

return {
    config = function()
        vim.g.slime_python_ipython = 1
        _G._configs.slime_tmux()
    end
}
