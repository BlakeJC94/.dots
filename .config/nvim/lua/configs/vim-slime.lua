-- TODO provice options for tmux pipe and refactor
-- Figure out a quick hotkey for maximising/minimising a tmux pane, remove ctrl-space guff
return {
    config = function()
        vim.g.slime_python_ipython = 1
        vim.g.slime_target = "neovim"
        -- vim.g.slime_paste_file = vim.fn.tempname()
        -- vim.g.slime_default_config = {socket_name = "default", target_pane = "{last}"}
    end
}
