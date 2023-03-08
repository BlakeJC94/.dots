local M = {}

M.requires = {
    "tpope/vim-rhubarb",
    "christoomey/vim-conflicted",
}



function M.config()
    local augroup = {
        {   -- Auto-refresh fugitive status window
            events = {"BufWritePre", "FileWritePre"},
            pattern = "*",
            callback = function() vim.fn["fugitive#ReloadStatus"]() end,
        },
        {   -- Auto-remove fugitive buffers when closed
            events = {"BufReadPost"},
            pattern = "fugitive://*",
            callback = function() vim.bo.bufhidden = "delete" end,
        },
    }

    local id = vim.api.nvim_create_augroup("fugitive", {clear = true})
    for _, autocmd in pairs(augroup) do
        vim.api.nvim_create_autocmd(
            autocmd.events,
            {
                group = id,
                pattern = autocmd.pattern,
                callback = autocmd.callback,
            }
        )
    end
end

return M

