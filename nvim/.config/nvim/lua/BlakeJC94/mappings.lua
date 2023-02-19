return {
    [""] = {
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
        -- Fkey maps
        ["<F1>"] = { map = ":setl relativenumber!<CR>:setl relativenumber?<CR>", opts = { silent = false } },
        ["<F2>"] = { map = ":setl number!<CR>:setl number?<CR>", opts = { silent = false } },
        ["<F3>"] = { map = ":setl wrap!<CR>:setl wrap?<CR>", opts = { silent = false } },
        ["<F4>"] = { map = ":setl spell!<CR>:setl spell?<CR>", opts = { silent = false } },
        ["<F6>"] = { map = ":wincmd =<CR>", opts = { silent = false } },
        -- Resize split maps
        ["<C-Left>"] = function() require("smart-splits").resize_left(8) end,
        ["<C-Up>"] = function() require("smart-splits").resize_up(4) end,
        ["<C-Down>"] = function() require("smart-splits").resize_down(4) end,
        ["<C-Right>"] = function() require("smart-splits").resize_right(8) end,
        -- Better opening of URLs and files
        ["gx"] = [[:silent execute '!xdg-open ' . shellescape(expand('<cfile>'), 1)<CR>]],
        -- Navigate git changes in file
        [']h'] = ':silent Gitsigns next_hunk<CR>',
        ['[h'] = ':silent Gitsigns prev_hunk<CR>',
        -- Navigate diagnostics
        [']d'] = function() vim.diagnostic.goto_next() end,
        ['[d'] = function() vim.diagnostic.goto_prev() end,
        -- LSP bindings
        ['gd'] = function() vim.lsp.buf.definition() end,
        ['gD'] = function() vim.lsp.buf.declaration() end,
        ['gI'] = function() vim.lsp.buf.implementation() end,
        ['gy'] = function() vim.lsp.buf.type_definition() end,
        ['gw'] = function() vim.lsp.buf.document_symbol() end,
    },
    n = {
        -- Make Y behave like D and C
        ["Y"] = "y$",
        -- Better jumplist for large line steps (and step through visual lines with j/k)
        ["j"] = { map = [[(v:count > 5 ? 'm`' . v:count : 'g') . 'j']], opts = { expr = true } },
        ["k"] = { map = [[(v:count > 5 ? 'm`' . v:count : 'g') . 'k']], opts = { expr = true } },
        -- gV: Visually select last pasted block (like gv)
        ["gV"] = "`[v`]",
        -- gF: create new file at filename over cursor
        ["gF"] = ":e <c-r><c-f><CR>",
        -- J doesn't move cursor
        ["J"] = "mzJ`z",
        -- S splits line in half
        ['S'] = 'i<CR><Esc>k:sil! keepp s/\\v +$//<CR>:noh<CR>==j^',
        -- Make {/} don't change the jumplist
        ["{"] = ":<C-u>keepjumps norm! {<CR>",
        ["}"] = ":<C-u>keepjumps norm! }<CR>",
        -- Make K use lsp.hover, call twice to jump to hoverdoc
        ['K'] = function() vim.lsp.buf.hover() end,
        -- Override spellchecker with telescope
        ['z='] = {map=[[v:count ? v:count . 'z=' : ':Telescope spell_suggest<CR>']], opts={expr=true}},
        -- Use unused arrow keys
        ["<Left>"] = {map="[", opts={remap=true}},
        ["<Right>"] = {map="]", opts={remap=true}},
    },
    v = {
        -- Maintain Visual Mode after >/</= actions
        ["<"] = "<gv",
        [">"] = ">gv",
        ["="] = "=gv",
        -- Move visual block up or down (doesn't like cmdheight=0)
        ["J"] = ":'<,'>m '>+1 | norm gv<CR>",
        ["K"] = ":'<,'>m '<-2 | norm gv<CR>",
        -- Swap p and P to I stop losing register contents by pasting over
        ["p"] = "P",
        ["P"] = "p",
    },
    i = {
        -- C-s : Quickly guess correct spelling errors (undoable)
        ["<C-s>"] = { map = "<C-g>u<Esc>[s1z=`]a<C-g>u", opts = { remap = false } },
        -- Stop accidentlly opening helkp in insert mode
        ["<F1>"] = "",
        -- Make <C-k> use lsp.hover, call twice to jump to hoverdoc
        ['<C-k>'] = function() vim.lsp.buf.hover() end,
        -- C-r C-r : See registers with telescope
        ['<C-r><C-r>'] = "<cmd>Telescope registers<CR>",
    },
    o = {
        -- Custom text object: "around everything"
        ["ae"] = "<Cmd>normal! ggVG<CR>",
        ["ie"] = "<Cmd>normal! ggVG<CR>",
        -- Use unused arrow keys
        ["<Left>"] = {map="[", opts={remap=true}},
        ["<Right>"] = {map="]", opts={remap=true}},
    },
    x = {
        -- Custom text object: "around everything"
        ["ae"] = "gg0oG$",
        ["ie"] = "gg0oG$",
        -- Use unused arrow keys
        ["<Left>"] = {map="[", opts={remap=true}},
        ["<Right>"] = {map="]", opts={remap=true}},
    },
}
