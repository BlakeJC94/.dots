BASE = {
    [''] = {
        ['<F1>'] = ':setlocal relativenumber!<CR>',
        ['<F2>'] = ':setlocal number!<CR>',
        ['<F3>'] = ':setlocal wrap!<CR>',
        ['<F4>'] = ':setlocal spell!<CR>',
        ['<F6>'] = ':wincmd =<CR>',
        -- Better splitting
        ['_'] = ':split<CR>',
        ['|'] = ':vsplit<CR>',
        ['\\'] = ':tabedit %<CR>',
        -- Move left and right faster
        ['H'] = {map=[[col('.') == match(getline('.'), '\S') + 1 ? '0' : '^']], opts={expr=true}},
        ['L'] = 'g_',
        -- Prevent x and s from overriding what's in the clipboard
        ['x'] = '"_x',
        ['X'] = '"_X',
        ['s'] = '"_s',
        ['S'] = '"_S',
        -- Open folds when flicking through search matches
        ['n'] = 'nzv',
        ['N'] = 'Nzv',
        -- Unmap q (and map Q to q to stop polluting registers accidentally!)
        ['q'] = '',
        ['Q'] = 'gq',
        -- gJ to split lines
        ['gK'] = 'm`i<CR><Esc>``',
        -- Navigate quickfix lists
        ['[l'] = ':<C-U>lprevious<CR>zv',
        [']l'] = ':<C-U>lnext<CR>zv',
        ['[L'] = ':<C-U>lfirst<CR>zv',
        [']L'] = ':<C-U>llast<CR>zv',
        ['[c'] = ':<C-U>cprevious<CR>zv',
        [']c'] = ':<C-U>cnext<CR>zv',
        ['[C'] = ':<C-U>cfirst<CR>zv',
        [']C'] = ':<C-U>clast<CR>zv',
    },
    n = {
        -- Make Y behave like D and C
        ['Y']  = 'y$',
        -- Clear last search hl with <ESC> before <ESC> action
        ['<ESC>'] = ':noh | redraw | echon ""<CR><ESC>',
        -- Better jumplist for large line steps (and step through visual lines with j/k)
        ['j'] = {map=[[(v:count > 5 ? 'm`' . v:count : 'g') . 'j']], opts={expr=true}},
        ['k'] = {map=[[(v:count > 5 ? 'm`' . v:count : 'g') . 'k']], opts={expr=true}},
        -- gp: Visually select last pasted block (like gv)
        ['gp'] = '`[v`]',
        -- gF: create new file at filename over cursor
        ['gF'] = ':e <c-r><c-f><CR>',
        -- J doesn't move cursor
        ['J'] = 'mzJ`z',
        -- Make {/} don't change the the jumplist
        ['{'] = ':<C-u>keepjumps norm! {<CR>',
        ['}'] = ':<C-u>keepjumps norm! }<CR>',
        -- Change selected word (forward/backwards), . to repeat
        ['c*'] = "/\\<<C-r>=expand('<cword>')<CR>\\>\\C<CR>``cgn",
        ['c#'] = "?\\<<C-r>=expand('<cword>')<CR>\\>\\C<CR>``cgN",
        -- Delete selected word (forward/backwards), . to repeat
        ['d*'] = "/\\<<C-r>=expand('<cword>')<CR>\\>\\C<CR>``dgn",
        ['d#'] = "?\\<<C-r>=expand('<cword>')<CR>\\>\\C<CR>``dgN",
        -- Override spellchecker TODO move to plugin config
        ['z='] = {map=[[v:count ? v:count . 'z=' : ':lua require("telescope.builtin").spell_suggest(require"telescope.themes".get_ivy())<CR>']], opts={expr=true}},
    },
    v = {
        -- Maintain Visual Mode after >/</= actions
        ['<'] = '<gv',
        ['>'] = '>gv',
        ['='] = '=gv',
        -- Move visual block up or down
        ['J'] = ":m '>+1<CR>gv",
        ['K'] = ":m '<-2<CR>gv",
        -- Stop p from overriding unnamed register
        ['p'] = "pgvy",
        ['P'] = "Pgvy",
        -- Replace spaces in selection with underscores
        ['_']  = ":s/\\%V /_/g<CR>",
        ['g_'] = ":s/\\%V_/ /g<CR>",
    },
    i = {
        -- C-s : Quickly guess correct spelling errors (undoable)
        -- ['<C-s>'] = '<C-g>u<Esc>[s1z=`]a<c-g>u', -- Currently borked by spellsitter
        -- C-r : See registers wityh telescope TODO move to plugin config
        ['<C-r>'] = "<cmd>lua require('telescope.builtin').registers(require'telescope.themes'.get_ivy())<CR>",
        -- Bash keyboard shortcut during insert mode
        ['<C-a>'] = "<C-o>0",    -- Goto BEGINNING of command line
        ['<C-e>'] = "<C-o>$",    -- Goto END of command line
        ['<C-b>'] = "<C-o>h",    -- move back one character
        ['<C-f>'] = "<C-o>l",    -- move forward one character
        ['<A-f>'] = "<C-o>w",    -- move cursor FORWARD one word
        ['<A-b>'] = "<C-o>b",    -- move cursor BACK one word
        ['<A-d>'] = "<C-o>dw",   -- delete the word FROM the cursor
        -- Put semicolon/comma at end of line (; is a pseudo-leader)
        [';,'] = "<Esc>m`A,<Esc>``a",
        [';;'] = "<Esc>m`A;<Esc>``a",
        -- Insert undo breakpoints when typing punctuation
        [','] = ',<C-g>u',
        ['.'] = '.<C-g>u',
        ['!'] = '!<C-g>u',
        ['?'] = '?<C-g>u',
        ['('] = '(<C-g>u',
        [')'] = ')<C-g>u',
        ['['] = '[<C-g>u',
        [']'] = ']<C-g>u',
        ['{'] = '{<C-g>u',
        ['}'] = '}<C-g>u',
        ['<'] = '<<C-g>u',
        ['>'] = '><C-g>u',
        ["'"] = "'<C-g>u",
        ['"'] = '"<C-g>u',
        ['`'] = '`<C-g>u',
    },
    o = {
        -- Custom text object: "around document"
        ['ad'] = '<Cmd>normal! ggVG<CR>',
        ['id'] = '<Cmd>normal! ggVG<CR>',
    },
    x = {
        -- Custom text object: "around document"
        ['ad'] = 'gg0oG$',
        ['id'] = 'gg0oG$',
    },
}
return BASE
