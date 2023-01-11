
local configure = {}

configure.indent_blankline = function()
    require("indent_blankline").setup({
        show_current_context = true,
        show_current_context_start = false,
        filetype_exclude = require("BlakeJC94.globals").filetype_exclude,
        buftype_exclude = {"terminal"},
    })
end

configure.nvim_colorizer = function()
    require("colorizer").setup(
        {'*'},
        {names=false}
    )
end

configure.lastplace = function()
    require('nvim-lastplace').setup({})
end

configure.stabilize = function()
    require("stabilize").setup()
end

configure.illuminate = function()
    require('illuminate').configure({
        filetypes_denylist = require("BlakeJC94.globals").filetype_exclude,
        filetypes_allowlist = require("BlakeJC94.globals").filetype_include,
    })
end

configure.slime = function()
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

configure.pytest_compiler = function()
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

local function setup_interface()
    for _, config in pairs(configure) do config() end
end

setup_interface()
