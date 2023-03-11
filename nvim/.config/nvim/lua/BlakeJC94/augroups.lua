local M = {}

local functions = require('BlakeJC94.utils').functions

M.base = {
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
    {   -- Autoreload buffers when there's an external change to the file
        events = { "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" },
        pattern = "*",
        callback = function() if vim.cmd.mode() ~= "c" then vim.cmd.checktime() end end,
    },
    {
        events = {"BufHidden"},
        pattern = "*",
        callback = function()
            if not vim.fn.filereadable(vim.fn.expand('%')) then vim.cmd('bd!') end
        end,
    },
    -- {  -- TODO http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
    --     events = {"BufReadPost"},
    --     pattern = "fugitive://*",
    --     callback = function()
    --         local fugitive_buffer = vim.fn[fugitive#buffer]
    --         vim.set.keymap('n', '..', ":edit %:h")
    --     end,
    -- },
}

M.ft_extra = {
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
        pattern = {"qf", "help", "fugitive", "man", "gitcommit", "Outline", "lspinfo"},
        callback = function()
            functions.set_quit_with_q()
            vim.opt_local.spell = false
            vim.opt_local.colorcolumn = {}
            vim.opt_local.foldlevel = 99
            vim.opt_local.formatoptions:remove('t')
            -- restore default K action on help pages
            vim.keymap.set('n', 'K', ":h <C-r>=expand('<cword>')<CR><CR>", {silent=true, buffer=true})
        end,
    },
    {   -- set info buffer opts
        events = {"FileType"},
        pattern = {"dapui_scopes", "dapui_breakpoints", "dapui_stacks", "dapui_watches",
            "dap-repl", "dapui_console",
        },
        callback = function()
            vim.opt_local.spell = false
            vim.opt_local.colorcolumn = {}
            vim.opt_local.foldlevel = 99
        end,
    },
    {   -- help vert split
        events = {"BufWinEnter"},
        pattern = "*.txt",
        callback = function()
            if vim.o.filetype == "help" then
                vim.cmd.wincmd('L')
                vim.cmd('vert resize 90')
            end
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

M.style = {
    {   -- toggle on insert colorcol cursorline
        events = { "InsertEnter" },
        pattern = "*",
        callback = function()
            local allowed = true
            for _, v in pairs(require("BlakeJC94").filetype_exclude) do
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
            for _, v in pairs(require("BlakeJC94").filetype_exclude) do
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

return M
