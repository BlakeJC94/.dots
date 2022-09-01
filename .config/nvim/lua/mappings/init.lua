local mappings_dir = vim.fn.expand('$HOME') .. '/.config/nvim/lua/mappings'
local mappings = {
    [''] = {
        -- Move left faster with `gh`
        ['gh'] = {map=[[col('.') == match(getline('.'), '\S') + 1 ? '0' : '^']], opts={expr=true}},
        -- Prevent x and s from overriding what's in the clipboard
        ['x'] = '"_x',
        ['X'] = '"_X',
        ['s'] = '"_s',
        -- Open folds when flicking through search matches
        ['n'] = 'nzv',
        ['N'] = 'Nzv',
        -- Remap q and Q to stop polluting registers accidentally!
        ['q'] = 'gq',
        ['Q'] = 'q',
        -- Clear last search hl with <C-l> before <C-l> action
        ['<C-l>'] = ':noh | redraw | echon ""<CR><C-l>',
        -- Replace `gx`
        ['gx'] = require('functions').OpenURL,
        -- Navigate quickfix list
        [']c'] = ':cnext<CR>',
        ['[c'] = ':cprev<CR>',
        [']l'] = ':lnext<CR>',
        ['[l'] = ':lprev<CR>',
        -- Leader maps
        ['<Leader><CR>']  = ":Telescope file_browser<CR>",  -- File browser
        ['<Leader><BS>']  = ":Telescope find_files<CR>",    -- File finder
        ['<Leader><Tab>'] = "<C-^>",                        -- Last file
        ['<Leader><Esc>'] = ":Telescope buffers<CR>",       -- Buffers
        ['<Leader>q'] = ":q<CR>",                           -- Quit
        ['<Leader>w'] = ":w<CR>",                           -- Save
        ['<Leader>n'] = ":NewFile<CR>",
        ['<Leader>N'] = ":NewSession<CR>",
        ['<Leader>d'] = ":ChangeLocalDir<CR>",
        ['<Leader>D'] = ":ChangeDir<CR>",
        ['<Leader>c'] = ":ToggleQL<CR>",               -- Toggle qflist
        ['<Leader>l'] = ":ToggleLL<CR>",               -- Toggle loclist
        ['<Leader>;'] = ":Settings<CR>",               -- Edit settings
        ['<Leader>:'] = ":luafile $MYVIMRC<CR>",       -- Reload settings
        -- Fkey maps
        ['<F1>'] = {map=':setl relativenumber!<CR>:setl relativenumber?<CR>', opts={silent=false}},
        ['<F2>'] = {map=':setl number!<CR>:setl number?<CR>', opts={silent=false}},
        ['<F3>'] = {map=':setl wrap!<CR>:setl wrap?<CR>', opts={silent=false}},
        ['<F4>'] = {map=':setl spell!<CR>:setl spell?<CR>', opts={silent=false}},
        ['<F6>'] = {map=':wincmd =<CR>', opts={silent=false}},
    },
    n = {
        -- Make Y and S behave like D and C
        ['Y']  = 'y$',
        ['S']  = '"_c$',
        -- Better jumplist for large line steps (and step through visual lines with j/k)
        ['j'] = {map=[[(v:count > 5 ? 'm`' . v:count : 'g') . 'j']], opts={expr=true}},
        ['k'] = {map=[[(v:count > 5 ? 'm`' . v:count : 'g') . 'k']], opts={expr=true}},
        -- gV: Visually select last pasted block (like gv)
        ['gV'] = '`[v`]',
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
    },
    v = {
        -- Maintain Visual Mode after >/</= actions
        ['<'] = '<gv',
        ['>'] = '>gv',
        ['='] = '=gv',
        -- Move visual block up or down
        ['J'] = ":m '>+1<CR>gv",
        ['K'] = ":m '<-2<CR>gv",
        -- Replace spaces in selection with underscores
        ['_']  = ":s/\\%V /_/g<CR>",
        ['g_'] = ":s/\\%V_/ /g<CR>",
    },
    i = {
        -- C-s : Quickly guess correct spelling errors (undoable)
        ['<C-s>'] = '<C-g>u<Esc>[s1z=`]a<c-g>u', -- Currently borked by spellsitter?
    },
    t = {
        -- <C-l> => Do C-l action in vim as well
        ['<C-l>'] = '<C-l><C-\\><C-n>:noh | redraw | echon ""<CR>i',
    },
    c = {},
}

local file_list = vim.fn.readdir(mappings_dir)
for _, file in pairs(file_list) do
    if file ~= 'init.lua' then
        local name = string.sub(file, 1, -5)
        local mapping_group = require('mappings.' .. name)

        for mode, maps in pairs(mapping_group) do
            for key, map in pairs(maps) do
                if mappings[mode][key] ~= nil then
                    print("Warning: Overriding key `" .. key .."` in mode `" .. mode .. "`.")
                end
                mappings[mode][key] = map
            end
        end
    end
end

return mappings
