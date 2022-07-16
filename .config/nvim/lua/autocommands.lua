M = {}
FUNCTIONS = require('functions')

M.BASE = {
    resize_vim_splits = {
        {"VimResized"},
        {
            pattern = {"*"},
            callback = function() vim.cmd("wincmd =") end,
        }
    },
    replace_tabs_with_spaces = {
        {"BufWritePre"},
        {
            pattern = "*",
            callback = function() vim.cmd("retab") end,
        }
    },
    autoremove_whitespace = {
        {"BufWritePre"},
        {
            pattern = "*",
            callback = FUNCTIONS.TrimSpaces,
        }
    },
    make_new_dirs_on_save = {
        {"BufWritePre", "FileWritePre"},
        {
            pattern = "*",
            callback = FUNCTIONS.CreateDirs,
        }
    },
}

M.STYLE = {
    toggle_on_insert_colorcol_cursorline = {
        {"InsertEnter"},
        {
            pattern = "*",
            callback = function()
                vim.opt_local.cursorline = true
                vim.opt_local.relativenumber = false
                vim.opt_local.colorcolumn = {100, 101}
            end
        }
    },
    toggle_off_insert_colorcol_cursorline = {
        {"InsertLeave"},
        {
            pattern = "*",
            callback = function()
                vim.opt_local.cursorline = false
                vim.opt_local.relativenumber = true
                vim.opt_local.colorcolumn = {}
            end
        }
    },
    echo_vimtip_on_open = {
        {"VimEnter"},
        {
            callback = FUNCTIONS.VimTip,
            pattern = "*",
        }
    },
    highlight_yanks = {
        {"TextYankPost"},
        {
            pattern = "*",
            callback = function() vim.highlight.on_yank({timeout = 700}) end,
        }
    },
}

M.FT_EXTRA = {
    close_cmdwin_with_q = {
        {"CmdWinEnter"},
        {
            pattern = "*",
            callback = function()
                FUNCTIONS.SetQuitWithQ()
                require('cmp').setup.buffer({enabled = false})
            end,
        }
    },
    set_info_buffer_opts = {
        {"FileType"},
        {
            pattern = {"qf", "help", "fugitive"},
            callback = function()
                FUNCTIONS.SetQuitWithQ()
                vim.opt_local.spell = false
                vim.opt_local.colorcolumn = {}
                -- restore default K action on help pages
                vim.keymap.set('n', 'K', ":h <C-r>=expand('<cword>')<CR><CR>", {silent=true, buffer=true})
            end,
        }
    },
    help_vert_split = {
        {"FileType"},
        {
            pattern = "help",
            callback = function()
                vim.cmd('wincmd L')
                vim.cmd('vert resize 90')
                vim.opt_local.formatoptions:remove('t')
            end,
        }
    },
    md_makeprg_pandoc = {
        {"FileType"},
        {
            pattern = "Markdown",
            callback = function()
                vim.opt_local.makeprg = "pandoc %:p -o %:p:h/out.pdf"
            end,
        }
    },
}

-- TODO update these targets after refactor
M.PACKER_COMPILE = {
    compile_on_plugins_lua_write = {
        {"BufWritePost"},
        {
            pattern = "plugins.lua",
            callback = function(keys) vim.cmd('source ' .. keys.file .. ' | PackerCompile') end
        }
    },
    compile_on_configs_lua_write = {
        {"BufWritePost"},
        {
            pattern = "configs.lua",
            callback = function(keys) vim.cmd('source ' .. keys.file .. ' | PackerCompile') end
        }
    },
}

return M
