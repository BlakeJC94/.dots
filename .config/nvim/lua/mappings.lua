map = require('utils').map

M = {}

M.load_mappings = function()
    -- print('hello')
    -- Better splitting
    map('n', '_', ':split<CR>')
    map('n', '|', ':vsplit<CR>')

    -- <Esc><Esc> = (terminal) go to normal mode
    map('t', '<Esc><Esc>', '<C-\\><C-n>')
    -- <Esc>: = (terminal) go to command mode
    map('t', '<Esc>:', '<C-\\><C-n>:')

    -- Prevent x and s from overriding what's in the clipboard
    map('n', 'x', '\"_x')
    map('n', 'X', '\"_X')
    map('n', 's', '\"_s')
    map('n', 'S', '\"_S')

    -- Make <C-a/x> increase/decrease recursively in vblock mode
    map('v', '<C-a>', 'g<C-a>')
    map('v', '<C-x>', 'g<C-x>')
    map('v', 'g<C-a>', '<C-a>')
    map('v', 'g<C-x>', '<C-x>')

    -- ..

    -- gp: Visually select last pasted block (like gv)
    map('n', 'gp', '<C-R>=`[getregtype()[0]`]')
end

return M
