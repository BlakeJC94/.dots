local M = {}

function M.config()
    require("local-highlight").setup({
        cw_hlgroup = "LocalHighlight",
    })
    vim.api.nvim_create_autocmd("BufRead", {
        pattern = { "*.*" },
        callback = function(data)
            require("local-highlight").attach(data.buf)
        end,
    })
end

return M
