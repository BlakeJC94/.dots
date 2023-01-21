local augroups = {}

local functions = require('BlakeJC94.functions')

augroups.base = {
    {   -- resize vim splits
        events = {"VimResized"},
        pattern = {"*"},
        callback = function() vim.cmd.wincmd("=") end,
    },
    {   -- replace tabs with spaces
        events = {"BufWritePre"},
        pattern = "*",
        callback = function() vim.cmd.retab() end,
    },
    {   -- Auto-remove whitespace
        events = {"BufWritePre"},
        pattern = "*",
        callback = functions.trim_spaces,
    },
    {   -- Make new dirs on save
        events = {"BufWritePre", "FileWritePre"},
        pattern = "*",
        callback = functions.create_dirs,
    },
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

augroups.ft_extra = {
    {   -- close cmdwin with q
        events = {"CmdWinEnter"},
        pattern = "*",
        callback = function()
            functions.set_quit_with_q()
            require('cmp').setup.buffer({enabled = false})
        end,
    },
    {   -- set info buffer opts
        events = {"FileType"},
        pattern = {"qf", "help", "fugitive", "man", "gitcommit"},
        callback = function()
            functions.set_quit_with_q()
            vim.opt_local.spell = false
            vim.opt_local.colorcolumn = {}
            vim.opt_local.foldlevel = 99
            -- restore default K action on help pages
            vim.keymap.set('n', 'K', ":h <C-r>=expand('<cword>')<CR><CR>", {silent=true, buffer=true})
        end,
    },
    {   -- help vert split
        events = {"FileType"},
        pattern = "help",
        callback = function()
            vim.cmd.wincmd('L')
            vim.cmd('vert resize 90')
            vim.opt_local.formatoptions:remove('t')
        end,
    },
    {   -- md makeprg pandoc
        events = {"FileType"},
        pattern = "Markdown",
        callback = function()
            vim.opt_local.makeprg = "pandoc %:p -o %:p:h/out.pdf"
        end,
    },
}

augroups.style = {
    {   -- toggle on insert colorcol cursorline
        events = { "InsertEnter" },
        pattern = "*",
        callback = function()
            local allowed = true
            for _, v in pairs(require("BlakeJC94.globals").filetype_exclude) do
                if vim.bo.filetype == v then
                    allowed = false
                end
            end
            if allowed then
                vim.opt_local.cursorline = true
                vim.opt_local.relativenumber = false
                textwidth = require("BlakeJC94.options").textwidth
                vim.opt_local.colorcolumn = { textwidth + 1, textwidth + 2 }
            end
        end,
    },
    {   -- toggle off insert colorcol cursorline
        events = { "InsertLeave" },
        pattern = "*",
        callback = function()
            local allowed = true
            for _, v in pairs(require("BlakeJC94.globals").filetype_exclude) do
                if vim.bo.filetype == v then
                    allowed = false
                end
            end
            if allowed then
                vim.opt_local.cursorline = false
                vim.opt_local.relativenumber = true
                vim.opt_local.colorcolumn = {}
            end
        end,
    },
    -- {   -- echo vimtip on open
    --     events = { "VimEnter" },
    --     callback = functions.vimtip,
    --     pattern = "*",
    -- },
    {   -- highlight yanks
        events = { "TextYankPost" },
        pattern = "*",
        callback = function()
            vim.highlight.on_yank({ timeout = 700 })
        end,
    },
}

local function set_augroups(augroups)
    for name, augroup in pairs(augroups) do
        local id = vim.api.nvim_create_augroup(name, {clear = true})
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
end
set_augroups(augroups)
