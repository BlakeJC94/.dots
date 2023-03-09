local M = {}

function M.config()
    local actions = require "fzf-lua.actions"
    require'fzf-lua'.setup {
        winopts = {
            border = "none",
        },
        previewers = {
            man = { cmd = "man %s | col -bx" },
        }
    }
end

return M

