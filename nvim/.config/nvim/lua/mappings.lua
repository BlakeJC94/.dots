return {
    [""] = {
        -- Move left faster with `gh`
        ["gh"] = { map = [[col('.') == match(getline('.'), '\S') + 1 ? '0' : '^']], opts = { expr = true } },
        -- Prevent x and s from overriding what's in the clipboard
        ["x"] = '"_x',
        ["X"] = '"_X',
        ["s"] = '"_s',
        -- Open folds when flicking through search matches
        ["n"] = "nzv",
        ["N"] = "Nzv",
        -- Remap q and Q to stop polluting registers accidentally!
        ["q"] = "gq",
        ["Q"] = "q",
        -- Paste and match indent
        ["gp"] = "]p",
        ["gP"] = "]P",
        -- Clear last search hl with <C-l> before <C-l> action
        ["<C-l>"] = ':noh | redraw | echon ""<CR><C-l>',
        -- Replace `gx`
        ["gx"] = require("functions").open_url,
        -- Navigate quickfix list
        ["]c"] = ":cnext<CR>",
        ["[c"] = ":cprev<CR>",
        ["]l"] = ":lnext<CR>",
        ["[l"] = ":lprev<CR>",
        -- Disable <C-z> to stop process
        ["<C-z>"] = {map='', opts={remap=true}},
        -- Vim split controls
        ['<Leader>w'] = "<C-w>",  -- s => split, v => vsplit, q => quit
        -- Vim Tab controls
        ['<Leader>t'] = ':tabedit %<CR>',
        ['<Leader>.'] = ":tabnext<CR>",
        ['<Leader>,'] = ":tabprev<CR>",
        ['<Leader>>'] = ":+tabmove<CR>",
        ['<Leader><'] = ":-tabmove<CR>",
        -- Leader maps
        ["<Leader><CR>"] = ":Telescope file_browser<CR>", -- File browser
        ["<Leader><BS>"] = ":Telescope find_files<CR>", -- File finder
        ["<Leader><Tab>"] = "<C-^>", -- Last file
        ["<Leader><Esc>"] = ":Telescope buffers<CR>", -- Buffers
        ["<Leader>n"] = ":NewFile<CR>",
        ["<Leader>N"] = ":NewSession<CR>",
        ["<Leader>d"] = ":ChangeLocalDir<CR>",
        ["<Leader>D"] = ":ChangeDir<CR>",
        ["<Leader>c"] = ":ToggleQL<CR>", -- Toggle qflist
        ["<Leader>l"] = ":ToggleLL<CR>", -- Toggle loclist
        ["<Leader>;"] = ":Settings<CR>", -- Edit settings
        ["<Leader>:"] = ":luafile $MYVIMRC<CR>", -- Reload settings
        ["<Leader>h"] = ":Neogen<CR>", -- Generate docs
        -- Fkey maps
        ["<F1>"] = { map = ":setl relativenumber!<CR>:setl relativenumber?<CR>", opts = { silent = false } },
        ["<F2>"] = { map = ":setl number!<CR>:setl number?<CR>", opts = { silent = false } },
        ["<F3>"] = { map = ":setl wrap!<CR>:setl wrap?<CR>", opts = { silent = false } },
        ["<F4>"] = { map = ":setl spell!<CR>:setl spell?<CR>", opts = { silent = false } },
        ["<F6>"] = { map = ":wincmd =<CR>", opts = { silent = false } },
    },
    n = {
        -- Make Y and S behave like D and C
        ["Y"] = "y$",
        ["S"] = '"_c$',
        -- Better jumplist for large line steps (and step through visual lines with j/k)
        ["j"] = { map = [[(v:count > 5 ? 'm`' . v:count : 'g') . 'j']], opts = { expr = true } },
        ["k"] = { map = [[(v:count > 5 ? 'm`' . v:count : 'g') . 'k']], opts = { expr = true } },
        -- gV: Visually select last pasted block (like gv)
        ["gV"] = "`[v`]",
        -- gF: create new file at filename over cursor
        ["gF"] = ":e <c-r><c-f><CR>",
        -- J doesn't move cursor
        ["J"] = "mzJ`z",
        -- Make {/} don't change the the jumplist
        ["{"] = ":<C-u>keepjumps norm! {<CR>",
        ["}"] = ":<C-u>keepjumps norm! }<CR>",
        -- Change selected word (forward/backwards), . to repeat
        ["c*"] = "/\\<<C-r>=expand('<cword>')<CR>\\>\\C<CR>``cgn",
        ["c#"] = "?\\<<C-r>=expand('<cword>')<CR>\\>\\C<CR>``cgN",
        -- Delete selected word (forward/backwards), . to repeat
        ["d*"] = "/\\<<C-r>=expand('<cword>')<CR>\\>\\C<CR>``dgn",
        ["d#"] = "?\\<<C-r>=expand('<cword>')<CR>\\>\\C<CR>``dgN",
    },
    v = {
        -- Maintain Visual Mode after >/</= actions
        ["<"] = "<gv",
        [">"] = ">gv",
        ["="] = "=gv",
        -- Move visual block up or down
        ["J"] = ":'<,'>m '>+1 | norm gv<CR>",
        ["K"] = ":'<,'>m '<-2 | norm gv<CR>",
        -- Replace spaces in selection with underscores
        ["_"] = ":s/\\%V /_/g<CR>",
        ["g_"] = ":s/\\%V_/ /g<CR>",
        -- Swap p and P to I stop losing register contents by pasting over
        ["p"] = "P",
        ["P"] = "p",
    },
    i = {
        -- C-s : Quickly guess correct spelling errors (undoable)
        ["<C-s>"] = { map = "<C-g>u<Esc>[s1z=`]a<C-g>u", opts = { remap = true } },
    },
    t = {
        -- <C-l> => Do C-l action in vim as well
        ["<C-l>"] = '<C-l><C-\\><C-n>:noh | redraw | echon ""<CR>i',
    },
    o = {
        -- Custom text object: "around document"
        ["ad"] = "<Cmd>normal! ggVG<CR>",
        ["id"] = "<Cmd>normal! ggVG<CR>",
    },
    x = {
        -- Custom text object: "around document"
        ["ad"] = "gg0oG$",
        ["id"] = "gg0oG$",
    },
}
