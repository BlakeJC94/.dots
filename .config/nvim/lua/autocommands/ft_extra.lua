local FUNCTIONS = require('functions')

return {
    -- close cmdwin with q
    {
        events = {"CmdWinEnter"},
        pattern = "*",
        callback = function()
            FUNCTIONS.SetQuitWithQ()
            require('cmp').setup.buffer({enabled = false})
        end,
    },
    -- set info buffer opts
    {
        events = {"FileType"},
        pattern = {"qf", "help", "fugitive"},
        callback = function()
            FUNCTIONS.SetQuitWithQ()
            vim.opt_local.spell = false
            vim.opt_local.colorcolumn = {}
            -- restore default K action on help pages
            vim.keymap.set('n', 'K', ":h <C-r>=expand('<cword>')<CR><CR>", {silent=true, buffer=true})
        end,
    },
    -- help vert split
    {
        events = {"FileType"},
        pattern = "help",
        callback = function()
            vim.cmd('wincmd L')
            vim.cmd('vert resize 90')
            vim.opt_local.formatoptions:remove('t')
        end,
    },
    -- md makeprg pandoc
    {
        events = {"FileType"},
        pattern = "Markdown",
        callback = function()
            vim.opt_local.makeprg = "pandoc %:p -o %:p:h/out.pdf"
        end,
    },
}
