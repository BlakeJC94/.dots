local M = {}

M.requires = {"klafyvel/vim-slime-cells"}

M.mappings = {
    {"n", "<C-c>c", "<Plug>SlimeConfig" },
    {"n", "<C-c><C-c>", "<Plug>SlimeCellsSendAndGoToNext" },
    {"n", "<C-c>j", "<Plug>SlimeCellsNext" },
    {"n", "<C-c>k", "<Plug>SlimeCellsPrev" },
}

function M.config()
    vim.g.slime_python_ipython = 1
    vim.g.slime_target = "tmux"
    vim.g.slime_paste_file = vim.fn.tempname() .. "_slime"
    vim.g.slime_default_config = {socket_name = "default", target_pane = "{last}"}

    vim.g.slime_cell_delimiter = "^\\s*# %%"
    vim.g.slime_dont_ask_default = 1
    vim.g.slime_bracketed_paste = 1
    vim.g.slime_no_mappings = 1

    local augroup = vim.api.nvim_create_augroup
    local autocmd = vim.api.nvim_create_autocmd
    autocmd(
        {"VimLeave"},
        {
            group = augroup("clear_slime", {clear = true}),
            pattern = "*",
            callback = function()
                local slime_files = vim.fn.glob('/tmp/nvim**_slime')
                if #slime_files > 1 then
                    for _, f in pairs(slime_files) do os.remove(f) end
                end
            end,
        }
    )
end


return M
