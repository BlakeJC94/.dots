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

    -- Center screen and open folds when flicking through search matches
    map('n', 'n', 'nzzzv')
    map('n', 'N', 'Nzzzv')

    -- Maintain Visual Mode after >/< actions
    map('v', '<', '<gv')
    map('v', '>', '>gv')
    map('v', '=', '=gv')

    -- Move visual block up or down
    map('v', 'J', ":m '>+1<CR>gv")
    map('v', 'K', ":m '<-2<CR>gv")

    -- Make Y behave like D and C
    map('n', 'Y', "y$")

    -- gp: Visually select last pasted block (like gv)
    map('n', 'gp', [['`[' . getregtype()[0] . '`]']], {expr = true})

    -- gF: create new file at filename over cursor
    map('n', 'gF', ":e <c-r><c-f><CR>")

    -- J doesn't move cursor
    map('n', 'J', "mzJ`z")

    -- Better jumplist for large line steps
    map('n', 'j', [[(v:count > 5 ? 'm`' . v:count : '') . 'j']], {expr = true})
    map('n', 'k', [[(v:count > 5 ? 'm`' . v:count : '') . 'k']], {expr = true})


    -- " Make vertical wildmenu controls behave intuitively
    if vim.o.wildmode == 'full' then
        local opts = {expr = true, silent = false}
        map('c', '<Down>',  [[wildmenumode() ? "\<Right>" : "\<Down>"]], opts)
        map('c', '<Up>',    [[wildmenumode() ? "\<Left>"  : "\<Up>"]], opts)
        map('c', '<Right>', [[wildmenumode() ? "\<Down>"  : "\<Right>"]], opts)
        map('c', '<Left>',  [[wildmenumode() ? "\<Up>"    : "\<Left>"]], opts)
    end

    -- " [Arrow] : disable for all
    map('', '<Left>', '')
    map('', '<Down>', '')
    map('', '<Up>', '')
    map('', '<Right>', '')

    -- " [Ctrl + Arrow] to navigate windows (drop <C-\><C-n> if using vim)
    map('n', '<C-Left>', [[<C-w>h]])
    map('n', '<C-Down>', [[<C-w>j]])
    map('n', '<C-Up>', [[<C-w>k]])
    map('n', '<C-Right>', [[<C-w>l]])
    map('t', '<C-Left>', [[<C-\><C-n><C-w>h]])
    map('t', '<C-Down>', [[<C-\><C-n><C-w>j]])
    map('t', '<C-Up>', [[<C-\><C-n><C-w>k]])
    map('t', '<C-Right>', [[<C-\><C-n><C-w>l]])

    -- " [Alt + Arrow] : resize splits (drop <C-\><C-n> if using vim)
    map('t', '<A-Left>', [[<C-\><C-N><C-w>8<]])
    map('t', '<A-Down>', [[<C-\><C-N><C-w>8-]])
    map('t', '<A-Up>', [[<C-\><C-N><C-w>8+]])
    map('t', '<A-Right>', [[<C-\><C-N><C-w>8>]])
    map('n', '<A-Left>', [[<C-w>8<]])
    map('n', '<A-Down>', [[<C-w>8-]])
    map('n', '<A-Up>', [[<C-w>8+]])
    map('n', '<A-Right>', [[<C-w>8>]])
    map('v', '<A-Left>', [[<C-w>8<]])
    map('v', '<A-Down>', [[<C-w>8-]])
    map('v', '<A-Up>', [[<C-w>8+]])
    map('v', '<A-Right>', [[<C-w>8>]])

    -- " [Shift + Arrow] Move splits (drop <C-\><C-n> if using vim)
    map('t', '<S-Left>', [[<C-\><C-N><C-w>H]])
    map('t', '<S-Down>', [[<C-\><C-N><C-w>J]])
    map('t', '<S-Up>', [[<C-\><C-N><C-w>K]])
    map('t', '<S-Right>', [[<C-\><C-N><C-w>L]])
    map('n', '<S-Left>', [[<C-w>H]])
    map('n', '<S-Down>', [[<C-w>J]])
    map('n', '<S-Up>', [[<C-w>K]])
    map('n', '<S-Right>', [[<C-w>L]])
    map('v', '<S-Left>', [[<C-w>H]])
    map('v', '<S-Down>', [[<C-w>J]])
    map('v', '<S-Up>', [[<C-w>K]])
    map('v', '<S-Right>', [[<C-w>L]])

    -- " -----------------------------------------------------------------------------
    -- " " OLD MAPPINGS
    -- " " Parity with prev/next cmd in bash
    -- " cmap <C-p> <Up>
    -- " cmap <C-n> <Down>
    -- " " L-s, L-w : Open search and replace command (with word under cursor)
    -- " nnoremap <Leader>w :%s/<C-r><C-w>//g<Left><Left>
    -- " nnoremap <Leader>s :%s//g<Left><Left>
    -- " vnoremap <Leader>s :s//g<Left><Left>
    -- " " Change selected word (forward/backwards), . to repeat
    -- " nnoremap c* /\<<C-r>=expand('<cword>')<CR>\>\C<CR>``cgn
    -- " nnoremap c# ?\<<C-r>=expand('<cword>')<CR>\>\C<CR>``cgN
    -- " " Delete selected word (forward/backwards), . to repeat
    -- " nnoremap d* /\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dgn
    -- " nnoremap d# ?\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dgN
    end

return M
