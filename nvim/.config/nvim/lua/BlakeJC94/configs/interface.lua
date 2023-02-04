local M = {}

M.illuminate = function()
    require('illuminate').configure({
        filetypes_denylist = require("BlakeJC94.globals").filetype_exclude,
        filetypes_allowlist = require("BlakeJC94.globals").filetype_include,
    })
end

M.slime = function()
    vim.g.slime_python_ipython = 1
    vim.g.slime_target = "tmux"
    vim.g.slime_paste_file = vim.fn.tempname() .. "_slime"
    vim.g.slime_default_config = {socket_name = "default", target_pane = "{last}"}

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

M.pytest_compiler = function()
    local augroup = vim.api.nvim_create_augroup
    local autocmd = vim.api.nvim_create_autocmd
    autocmd(
        {"BufEnter"},
        {
            group = augroup("pytest_vim_compiler", {clear = true}),
            pattern = "*.py",
            callback = function() vim.cmd.compiler("pytest") end,
        }
    )
end

M.config_gitsigns = function()
    require('gitsigns').setup({
        signcolumn = false,
        numhl      = true,
        linehl     = false,
        keymaps    = {}, -- Keymaps set in mappings.lua
        current_line_blame = true,
        preview_config = {
            border = 'none',
            style = 'minimal',
            relative = 'cursor',
        },
        -- _signs_staged_enable = true,
    })

    vim.api.nvim_create_autocmd('User', {
        pattern = 'GitSignsUpdate',
        callback = function()
            vim.fn["fugitive#ReloadStatus"]()
        end
    })
end

M.config_telekasten = function()
    local tk_home = vim.fn.expand("~/Workspace/repos/journal")
    require('telekasten').setup(
        {
            home = tk_home,
            auto_set_filetype = false,
            auto_set_syntax = false,
            dailies      = tk_home .. '/daily',
            weeklies     = tk_home .. '/weekly',
            templates    = tk_home .. '/templates',
            -- new_note_filename = "uuid-title",  -- BUG: telekasten.lua:669 gsub (uuid?)
            uuid_type = "%Y-%m-%d_%H-%M",
            tag_notation = ":tag:",
            template_new_note = tk_home .. '/templates/new_note.md',
            template_new_daily = tk_home .. '/templates/daily.md',  -- BUG: telekasten.lua:669 gsub (uuid?)
            template_new_weekly= tk_home .. '/templates/weekly.md',  -- BUG: telekasten.lua:669 gsub (uuid?)
            plug_into_calendar = false,
            journal_auto_open = true,
        }
    )
end

return M
