
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local v = vim.v
local opt = vim.opt  -- to set options

cmd([[
function! Exec(cmd)
    redir @a
        exec printf('silent %s',a:cmd)
    redir END
    " tabnew
    norm "ap
endfunction
]])


local M = {}

M.load_autocmds = function()

    autocommands = {
        -- equally resize windows when terminal is resized
        "au! VimResized * wincmd =",

        -- replace tabs with spaces
        "au! BufWritePre * retab",

        -- autoremove whitespace
        "au! BufWritePre * %s/\s\+$//e",

        -- help/cmd win/qf list: Press q to close and disable spellcheck
        "au! Filetype qf,help nnoremap <buffer> q :q<CR>",
        "au! Filetype qf,help setl nospell",
        "au! CmdwinEnter * nnoremap <buffer> q :q<CR>",

        -- create nested directories if needed when creating files
        "au! BufWritePre,FileWritePre * silent! call mkdir(expand('<afile>:p:h'), 'p')",

        -- highlight yanked area
        "au TextYankPost * lua vim.highlight.on_yank({timeout = 700})",

        -- show cursorline on active split
        "au! VimEnter,WinEnter,BufWinEnter,Focusgained * setlocal cursorline",
        "au! WinLeave,FocusLost * setlocal nocursorline",
        "au! VimEnter,WinEnter,BufWinEnter,Focusgained term://* setl nocursorline",
    }

    for _, v in pairs(autocommands) do
        cmd(v)
    end
end


return M
