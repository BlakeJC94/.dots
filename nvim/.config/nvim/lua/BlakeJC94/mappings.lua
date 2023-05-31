local leader_key = " "

local functions = require("BlakeJC94.functions")

local mappings = {
    -- Make Y behave like D and C
    { "n", "Y", "y$" },
    -- Better jumplist for large line steps (and step through visual lines with j/k)
    { "n", "j", [[(v:count > 5 ? 'm`' . v:count : 'g') . 'j']], { expr = true } },
    { "n", "k", [[(v:count > 5 ? 'm`' . v:count : 'g') . 'k']], { expr = true } },
    -- gV: Visually select last pasted block (like gv)
    { "n", "gV", "`[v`]" },
    -- gF: create new file at filename over cursor
    { "n", "gF", ":e <c-r><c-f><CR>" },
    -- J doesn't move cursor
    { "n", "J", "mzJ`z" },
    -- S splits line in half
    { "n", "S", "i<CR><Esc>k:sil! keepp s/\\v +$//<CR>:noh<CR>==j^" },
    -- Make {/} don't change the jumplist
    { "n", "{", ":<C-u>keepjumps norm! {<CR>" },
    { "n", "}", ":<C-u>keepjumps norm! }<CR>" },
    -- Prevent x and s from overriding what's in the clipboard
    { "n", "x", '"_x' },
    { "n", "X", '"_X' },
    { "n", "s", '"_s' },
    -- Open folds when flicking through search matches
    { "n", "n", "nzv" },
    { "n", "N", "Nzv" },
    -- Remap q and Q to stop polluting registers accidentally!
    { "n", "q", "gw" },
    { "n", "Q", "q" },
    -- Better opening of URLs and files
    { "n", "gx", [[:silent execute '!xdg-open ' . shellescape(expand('<cfile>'), 1)<CR>]] },
    -- Maintain Visual Mode after >/</= actions
    { "v", "<", "<gv" },
    { "v", ">", ">gv" },
    { "v", "=", "=gv" },
    -- Move visual block up or down (doesn't like cmdheight=0)
    { "v", "J", ":'<,'>m '>+1 | norm gv<CR>" },
    { "v", "K", ":'<,'>m '<-2 | norm gv<CR>" },
    -- Swap p and P to stop losing register contents by pasting over
    { "v", "p", "P" },
    { "v", "P", "p" },
    -- C-s : Quickly guess correct spelling errors (undoable)
    { "i", "<C-s>", "<C-g>u<Esc>[s1z=`]a<C-g>u", { remap = false } },
    { "n", "<C-s>", "i<C-g>u<Esc>[s1z=`]", { remap = false } },
    -- Stop accidentally opening help in insert mode
    { "i", "<F1>", "" },
    -- Use unused arrow keys
    { "n", "<Left>", "[", { remap = true } },
    { "n", "<Right>", "]", { remap = true } },
    { "n", "<Up>", "[", { remap = true } },
    { "n", "<Down>", "]", { remap = true } },
    -- Fkey maps
    { "n", "<F1>", ":setl relativenumber!<CR>:setl relativenumber?<CR>", { silent = false } },
    { "n", "<F2>", ":setl number!<CR>:setl number?<CR>", { silent = false } },
    { "n", "<F3>", ":setl wrap!<CR>:setl wrap?<CR>", { silent = false } },
    { "n", "<F4>", ":setl spell!<CR>:setl spell?<CR>", { silent = false } },
    { "n", "<F6>", ":wincmd =<CR>", { silent = false } },
    -- Resize split maps
    { "n", "<C-Left>", ":wincmd 8<<CR>" },
    { "n", "<C-Up>", ":wincmd 4+<CR>" },
    { "n", "<C-Down>", ":wincmd 4-<CR>" },
    { "n", "<C-Right>", ":wincmd 8><CR>" },
    -- Vim Tab controls
    { "n", "<Leader>t", ":tabedit %<CR>" },
    { "n", "<Leader>n", ":tabnext<CR>" },
    { "n", "<Leader>p", ":tabnext<CR>" },
    { "n", "<Leader>N", ":+tabmove<CR>" },
    { "n", "<Leader>P", ":-tabmove<CR>" },
    -- Vim arglist commands
    { "n", "<Leader>aa", ":argument | args<CR>" },
    { "n", "<Leader>ax", ":argdelete | args<CR>" },
    { "n", "<Leader>as", ":argadd | args<CR>" },
    -- Leader maps
    { "n", "<Leader><CR>", ":Ex %:p:h<CR>" }, -- File browser
    { "n", "<Leader><BS>", ":FzfLua files<CR>" }, -- File finder
    { "n", "<Leader><Tab>", "<C-^>" }, -- Last file
    { "n", "<Leader><Leader>", "za" },
    { "n", "<Leader>w", ":pwd<CR>" },
    { "n", "<Leader>q", functions.toggle_quickfix_list },
    { "n", "<Leader>l", functions.toggle_local_list },
    { "n", "<Leader>;", ":edit $MYVIMRC | lcd %:p:h<CR>" }, -- Edit settings
    { "n", "<Leader>:", ":edit $MYVIMRC | lcd %:p:h | edit **/addons.lua <CR>" }, -- Edit addons
    { "n", "<Leader>d", ":lcd %:p:h<CR>" },
    { "n", "<Leader>D", ":cd %:p:h<CR>" },
    { "n", "<Leader>u", ":UndoTreeToggle<CR>" },
    { "n", "<Leader>S", ":J day<CR>" },
    { "n", "<Leader>J", ":TSJToggle<CR>" },
    { "n", "<Leader>C", ":make -k %:p:t:r<CR>" },
}

local set_mappings = function(maps)
    for _, map in pairs(maps) do
        local mode, key, value, opts = unpack(map)
        if not opts then
            opts = { silent = true }
        end
        vim.keymap.set(mode, key, value, opts)
    end
end

local add_undo_breakpoints_insert_mode_punctuation = function()
    local undo_mappings = {}
    for _, mark in pairs({ ".", ",", "!", "?", "(", ")", "[", "]", "{", "}", "<", ">", '"', "'" }) do
        undo_mappings[#undo_mappings + 1] = { "i", mark, mark .. "<C-g>u", opts }
    end
    set_mappings(undo_mappings)
end

local disable_shift_alt_arrow_keys = function()
    local arrow_mappings = {}
    for _, mod in pairs({ "S-", "A-" }) do
        for _, dir in pairs({ "Left", "Down", "Up", "Right" }) do
            arrow_mappings[#arrow_mappings + 1] = { "n", "<" .. mod .. dir .. ">", "", opts }
        end
    end
    set_mappings(arrow_mappings)
end

local M = {}

M.set = function()
    vim.g.mapleader = leader_key

    set_mappings(mappings)
    set_mappings(require("BlakeJC94").packer_mappings)
    set_mappings(require("BlakeJC94.configs.fzf_lua").mappings)
    set_mappings(require("BlakeJC94.configs.nvim_lspconfig").mappings)
    set_mappings(require("BlakeJC94.configs.vim_fugitive").mappings)
    set_mappings(require("BlakeJC94.configs.vim_unimpaired").mappings)

    add_undo_breakpoints_insert_mode_punctuation()
    disable_shift_alt_arrow_keys()
end

return M
