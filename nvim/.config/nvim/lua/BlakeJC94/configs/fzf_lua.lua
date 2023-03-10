local M = {}

function M.config()
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

