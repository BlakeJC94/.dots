M = {}

-- Better terminals
-- TODO reconsider complexity of this wrapper
M["akinsho/toggleterm.nvim"] = {
    config = function()
        require('toggleterm').setup({
            -- size can be a number or function which is passed the current terminal
            size = function(term)
                if term.direction == "horizontal" then
                    return 15
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            hide_numbers = true, -- hide the number column in toggleterm buffers
            shade_filetypes = false,
            shade_terminals = false,
            start_in_insert = true,
            persist_size = true,
            close_on_exit = true, -- close the terminal window when the process exits
        })
    end
}

-- <C-c><C-c> => Send code snippet to neovim terminal
M['jpalardy/vim-slime'] = {
    config = function()
        vim.g.slime_target = "neovim"
        vim.g.slime_python_ipython = 1
    end
}

return M
