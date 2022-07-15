local id = vim.api.nvim_create_augroup("base", {clear = true})
-- equally resize windows when terminal is resized
vim.api.nvim_create_autocmd(
    {"VimResized"},
    {
        group = id,
        pattern = {"*"},
        callback = function() vim.cmd("wincmd =") end,
    }
)
-- replace tabs with spaces
vim.api.nvim_create_autocmd(
    {"BufWritePre"},
    {
        group = id,
        pattern = "*",
        callback = function() vim.cmd("retab") end,
    }
)
-- autoremove whitespace without upsetting changelist
vim.api.nvim_create_autocmd(
    {"BufWritePre"},
    {
        group = id,
        pattern = "*",
        callback = _G.TrimSpaces,
    }
)
-- create nested directories if needed when creating files
vim.api.nvim_create_autocmd(
    {"BufWritePre", "FileWritePre"},
    {
        group = id,
        pattern = "*",
        callback = _G.CreateDirs,
    }
)

local id = vim.api.nvim_create_augroup("style", {clear = true})
-- toggle cursorline and colorcolumn when entering/exiting insert mode
vim.api.nvim_create_autocmd(
    {"InsertEnter"},
    {
        group = id,
        pattern = "*",
        callback = function()
            vim.opt_local.cursorline = true
            vim.opt_local.relativenumber = false
            vim.opt_local.colorcolumn = {100, 101}
        end
    }
)
vim.api.nvim_create_autocmd(
    {"InsertLeave"},
    {
        group = id,
        pattern = "*",
        callback = function()
            vim.opt_local.cursorline = false
            vim.opt_local.relativenumber = true
            vim.opt_local.colorcolumn = {}
        end
    }
)
-- echo a vimtip when opening vim
vim.api.nvim_create_autocmd(
    {"VimEnter"},
    {
        group = id,
        pattern = "*",
        callback = _G.VimTip,
    }
)
-- highlight yanked regions
vim.api.nvim_create_autocmd(
    {"TextYankPost"},
    {
        group = id,
        pattern = "*",
        callback = function() vim.highlight.on_yank({timeout = 700}) end,
    }
)


local id = vim.api.nvim_create_augroup("ft_extra", {clear = true})
-- Make cmdwindows close with q
vim.api.nvim_create_autocmd(
    {"CmdWinEnter"},
    {
        group = id,
        pattern = "*",
        callback = function()
            _G.SetQuitWithQ()
            require('cmp').setup.buffer({enabled = false})
        end,
    }
)
-- help/cmd win/qf list: Press q to close and disable spellcheck
vim.api.nvim_create_autocmd(
    {"FileType"},
    {
        group = id,
        pattern = {"qf", "help", "fugitive"},
        callback = function()
            _G.SetQuitWithQ()
            vim.opt_local.spell = false
            vim.opt_local.colorcolumn = {}
        end,
    }
)
-- restore default K action on help pages
vim.api.nvim_create_autocmd(
    {"FileType"},
    {
        group = id,
        pattern = {"vim", "help"},
        callback = function()
            vim.keymap.set('n', 'K', ":h <C-r>=expand('<cword>')<CR><CR>", {silent=true, buffer=true})
        end,
    }
)
-- Always open help in vertical split
vim.api.nvim_create_autocmd(
    {"FileType"},
    {
        group = id,
        pattern = "help",
        callback = function()
            vim.cmd('wincmd L')
            vim.cmd('vert resize 90')
            vim.opt_local.formatoptions:remove('t')
        end,
    }
)
-- Set pandoc as makeprg for markdown files (WARNING untested)
vim.api.nvim_create_autocmd(
    {"FileType"},
    {
        group = id,
        pattern = "Markdown",
        callback = function()
            vim.opt_local.makeprg = "pandoc %:p -o %:p:h/out.pdf"
        end,
    }
)

-- Update plugins after saving changes to plugins.lua
local id = vim.api.nvim_create_augroup("packer_autocompile", {clear = true})
vim.api.nvim_create_autocmd(
    {"BufWritePost"},
    {
        group = id,
        pattern = "plugins.lua",
        callback = function(keys) vim.cmd('source ' .. keys.file .. ' | PackerCompile') end
    }
)
vim.api.nvim_create_autocmd(
    {"BufWritePost"},
    {
        group = id,
        pattern = "configs.lua",
        callback = function(keys) vim.cmd('source ' .. keys.file .. ' | PackerCompile') end
    }
)
