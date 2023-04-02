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
        {   -- Make fugitive buffers into unmodifiable scratch buffers and update buffer name
            events = {"BufReadPost"},
            pattern = "fugitive://*",
            callback = function()
                vim.bo.bufhidden = "delete"
                vim.bo.buftype = "nofile"
                vim.bo.modifiable = false
                local buffer_name = vim.apu.nvim_buf_get_name(0)
                local commit_hash = string.match(buffer_name, "%.git//([^/]+)/")
                commit_hash = table.concat({"[", commit_hash:sub(1,8), "]"})
                local new_buffer_name = table.concat({vim.fn.basename(buffer_name), commit_hash}, " ")
                vim.api.nvim_buf_set_name(0, new_buffer_name)
            end,
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

