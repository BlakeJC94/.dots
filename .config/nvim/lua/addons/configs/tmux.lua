return {
    config = function()
        require("tmux").setup({
            copy_sync = {
                enable = false,
            },
            navigation = {
                enable_default_keybindings = false,
            },
            resize = {
                enable_default_keybindings = false,
                resize_step_x = 8,
                resize_step_y = 4,
            }
        })
    end
}
