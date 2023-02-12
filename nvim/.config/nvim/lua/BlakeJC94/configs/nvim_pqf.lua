local M = {}

function M.config()
    require('pqf').setup({
        signs = {
            error = " ",
            warning = " ",
            info = " " ,
            hint = " ",
        }
    })
end

return M

