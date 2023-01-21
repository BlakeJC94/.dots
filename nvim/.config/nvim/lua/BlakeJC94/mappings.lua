local DEFAULT_MAP_OPTS = {remap = false, silent = true}

vim.g.mapleader = " "

local mappings = {
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
        -- Navigate quickfix list
        ["]q"] = ":cnext<CR>",
        ["[q"] = ":cprev<CR>",
        ["]l"] = ":lnext<CR>",
        ["[l"] = ":lprev<CR>",
        -- Disable <C-z> to stop process
        ["<C-z>"] = { map = '', opts = { remap = true } },
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
        ["<Leader>q"] = ":ToggleQL<CR>", -- Toggle qflist
        ["<Leader>l"] = ":ToggleLL<CR>", -- Toggle loclist
        ["<Leader>i"] = ":bprev<CR>",
        ["<Leader>o"] = ":bnext<CR>",
        ["<Leader>;"] = ":edit $MYVIMRC | lcd %:p:h<CR>", -- Edit settings
        ["<Leader>:"] = ":source $MYVIMRC<CR>", -- Reload settings
        ["<Leader>d"] = ":Neogen<CR>", -- Generate docs
        ["<Leader>x"] = require("ts-node-action").node_action,
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
        [']g'] = ':silent Gitsigns next_hunk<CR>',
        ['[g'] = ':silent Gitsigns prev_hunk<CR>',
        -- Leader maps
        ['<Leader>gg'] = ':Git<CR>',
        ['<Leader>gG'] = ':Git status<CR>',
        ['<Leader>gc'] = ':Git commit | startinsert<CR>',
        ['<Leader>gC'] = ':Git commit --amend<CR>',
        ['<Leader>gp'] = ':Gitsigns preview_hunk<CR>',
        ['<Leader>gs'] = ':w | Gitsigns stage_hunk<CR>',
        ['<Leader>gu'] = ':w | Gitsigns undo_stage_hunk<CR>',
        ['<Leader>gr'] = ':Gitsigns reset_hunk | w<CR>',
        ['<Leader>gS'] = ':w | Gitsigns stage_buffer<CR>',
        ['<Leader>gU'] = ':w | Gitsigns reset_buffer_index<CR>',
        ['<Leader>gR'] = ':Gitsigns reset_buffer | w<CR>',
        ['<Leader>gb'] = function() require("gitsigns").blame_line({full=true}) end,
        ['<Leader>gB'] = ':GBrowse<CR>',
        ['<Leader>gd'] = ':Gvdiffsplit<CR>',
        ['<Leader>gD'] = ':Gdiffsplit<CR>',
        ['<Leader>gt'] = ':Git difftool<CR>',
        ['<Leader>gT'] = ':Git mergetool<CR>',
        -- Packer maps
        ['<Leader>pp'] = ':exec "PackerSync" | echo "Syncing plugins"<CR>',
        ['<Leader>pi'] = ':exec "PackerInstall" | echo "Installing plugins"<CR>',
        ['<Leader>pu'] = ':exec "PackerUpdate" | echo "Updating plugins.."<CR>',
        ['<Leader>pc'] = ':exec "PackerCompile" | echo "Compiling plugins.."<CR>',
        ['<Leader>pC'] = ':exec "PackerClean" | echo "Cleaning plugins.."<CR>',
        ['<Leader>ps'] = ':exec "PackerStatus" | echo "Plugin status"<CR>',
        -- Navigate diagnostics
        [']e'] = function() vim.diagnostic.goto_next() end,
        ['[e'] = function() vim.diagnostic.goto_prev() end,
        -- LSP bindings
        ['gd'] = function() vim.lsp.buf.definition() end,
        ['gD'] = function() vim.lsp.buf.declaration() end,
        ['gI'] = function() vim.lsp.buf.implementation() end,
        ['gR'] = function() vim.lsp.buf.references() end,
        ['gy'] = function() vim.lsp.buf.type_definition() end,
        ['gw'] = function() vim.lsp.buf.document_symbol() end,
        -- LSP Leader bindings
        ['<Leader>e'] = function() vim.diagnostic.open_float() end,        -- Show line diagnostics
        ['<Leader>E'] = function() vim.diagnostic.setloclist() end,        -- Show buffer diagnostics
        ['<Leader>='] = function() vim.lsp.buf.formatting_seq_sync() end,  -- Format buffer
        ['<Leader>r'] = function() vim.lsp.buf.rename() end,               -- Rename current symbol
        ['<Leader>k'] = function() vim.lsp.buf.signature_help() end,       -- Show signature help
        ['<Leader>a'] = function() vim.lsp.buf.code_action() end,          -- Do code action
        -- Telescope mappings
        ['<Leader>ff'] = ":Telescope resume<CR>",                     -- Open last telescope
        ['<Leader>fF'] = ":Telescope<CR>",                            -- Find Telescopes
        ['<Leader>fb'] = ":Telescope buffers<CR>",                    -- Switch between buffers
        ['<Leader>fr'] = ":Telescope registers<CR>",                  -- Switch between buffers
        ['<Leader>fo'] = ":Telescope oldfiles<CR>",                   -- Recently changed files
        ['<Leader>f/'] = ":Telescope current_buffer_fuzzy_find<CR>",  -- Jumping with fuzzyfind
        ['<Leader>fg'] = ":Telescope live_grep<CR>",                  -- Jumping with livegrep
        ['<Leader>fh'] = ":Telescope help_tags<CR>",
        ['<Leader>fG'] = ":Telescope git_status<CR>",
        ['<Leader>fc'] = ":Telescope quickfix<CR>",
        ['<Leader>fl'] = ":Telescope loclist<CR>",
        ['<Leader>fs'] = ":Telescope spell_suggest<CR>",
        ['<Leader>fa'] = ":Telescope lsp_code_actions<CR>",
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
        -- Make {/} don't change the jumplist
        ["{"] = ":<C-u>keepjumps norm! {<CR>",
        ["}"] = ":<C-u>keepjumps norm! }<CR>",
        -- Change selected word (forward/backwards), . to repeat
        ["c*"] = "/\\<<C-r>=expand('<cword>')<CR>\\>\\C<CR>``cgn",
        ["c#"] = "?\\<<C-r>=expand('<cword>')<CR>\\>\\C<CR>``cgN",
        -- Delete selected word (forward/backwards), . to repeat
        ["d*"] = "/\\<<C-r>=expand('<cword>')<CR>\\>\\C<CR>``dgn",
        ["d#"] = "?\\<<C-r>=expand('<cword>')<CR>\\>\\C<CR>``dgN",
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


for _, mod in pairs({ "S-", "A-" }) do
    for _, dir in pairs({ "Left", "Down", "Up", "Right" }) do
        mappings[""]["<" .. mod .. dir .. ">"] = ""
    end
end
for _, mark in pairs({ ".", ",", "!", "?", "(", ")", "[", "]", "{", "}", "<", ">", '"', "'"  }) do
    mappings["i"][mark] = mark .. "<C-g>u"
end

local function set_mappings(mappings)
    for mode, mode_mappings in pairs(mappings) do
        for keys, mapping in pairs(mode_mappings) do
            if (type(mapping) == "table") then
                local opts = vim.tbl_extend('force', DEFAULT_MAP_OPTS, mapping.opts)
                vim.keymap.set(mode, keys, mapping.map, opts)
            else
                vim.keymap.set(mode, keys, mapping, DEFAULT_MAP_OPTS)
            end
        end
    end
end
set_mappings(mappings)
return mappings
