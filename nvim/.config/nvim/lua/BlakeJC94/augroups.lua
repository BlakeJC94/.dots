local functions = require("BlakeJC94.functions")

local augroups = {}

augroups.base = {
    { "VimResized", { pattern = "*", callback = functions.resize_vim_splits } },
    { "BufWritePre", { pattern = "*", callback = functions.replace_tabs_with_spaces } },
    { "BufWritePre", { pattern = "*", callback = functions.trim_spaces } },
    { { "BufWritePre", "FileWritePre" }, { pattern = "*", callback = functions.create_dirs } },
    {
        { "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" },
        { pattern = "*", callback = functions.reload_buffer },
    },
    { "BufHidden", { pattern = "*", callback = functions.remove_nonfile_buffer } },
    { "CmdWinEnter", { pattern = "*", callback = functions.set_quit_with_q } },
    { "TextYankPost", { pattern = "*", callback = functions.highlight_yanks } },
    { "InsertEnter", { pattern = "*", callback = functions.toggle_insert_target_on } },
    { "InsertLeave", { pattern = "*", callback = functions.toggle_insert_target_off } },
}

augroups.ft_extra = {
    {
        "FileType",
        {
            pattern = { "qf", "help", "fugitive", "man", "gitcommit", "Outline", "lspinfo" },
            callback = functions.set_info_buffer_opts,
        },
    },
    { "FileType", { pattern = "markdown", callback = function() vim.opt.wrap = true end} },
    { "FileType", { pattern = "help", callback = functions.help_vert_split } },
}


local M = {}

M.set = function()
    for name, augroup in pairs(augroups) do
        local id = vim.api.nvim_create_augroup(name, { clear = true })
        for _, aucmd in pairs(augroup) do
            local events, opts = unpack(aucmd)
            opts = vim.tbl_extend("force", opts, { group = id })
            vim.api.nvim_create_autocmd(events, opts)
        end
    end
end

return M
