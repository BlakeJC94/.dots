
local M = {}


M.load_commands = function()
    local cmd = vim.api.nvim_command

    cmd([[
        augroup source ~/.config/nvim/vimscript/commands.vim
    ]])
    cmd("source ~/.config/nvim/vimscript/terminal.vim")
    cmd("source ~/.config/nvim/vimscript/mappings.vim")
end


return M
