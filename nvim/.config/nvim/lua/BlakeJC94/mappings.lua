local leader_key = " "

local opts = { silent = true }

local mappings = {
    -- Make Y behave like D and C
    { "n", "Y", "y$", opts },
    -- Better jumplist for large line steps (and step through visual lines with j/k)
    { "n", "j", [[(v:count > 5 ? 'm`' . v:count : 'g') . 'j']], { expr = true } },
    { "n", "k", [[(v:count > 5 ? 'm`' . v:count : 'g') . 'k']], { expr = true } },
    -- gV: Visually select last pasted block (like gv)
    { "n", "gV", "`[v`]", opts },
    -- gF: create new file at filename over cursor
    { "n", "gF", ":e <c-r><c-f><CR>", opts },
    -- J doesn't move cursor
    { "n", "J", "mzJ`z", opts },
    -- S splits line in half
    { "n", "S", "i<CR><Esc>k:sil! keepp s/\\v +$//<CR>:noh<CR>==j^", opts },
    -- Make {/} don't change the jumplist
    { "n", "{", ":<C-u>keepjumps norm! {<CR>", opts },
    { "n", "}", ":<C-u>keepjumps norm! }<CR>", opts },
    -- Override spellchecker  TODO Move to config and link
    { "n", "z=", [[v:count ? v:count . 'z=' : ':FzfLua spell_suggest<CR>']], { expr = true } },
    -- Prevent x and s from overriding what's in the clipboard
    { "n", "x", '"_x', opts },
    { "n", "X", '"_X', opts },
    { "n", "s", '"_s', opts },
    -- Open folds when flicking through search matches
    { "n", "n", "nzv", opts },
    { "n", "N", "Nzv", opts },
    -- Remap q and Q to stop polluting registers accidentally!
    { "n", "q", "gw", opts },
    { "n", "Q", "q", opts },
    -- Better opening of URLs and files
    { "n", "gx", [[:silent execute '!xdg-open ' . shellescape(expand('<cfile>'), 1)<CR>]], opts },
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
    -- Resize split maps TODO move to config and link
    { "n", "<C-Left>", function() require("smart-splits").resize_left(8) end, opts },
    { "n", "<C-Up>", function() require("smart-splits").resize_up(4) end, opts },
    { "n", "<C-Down>", function() require("smart-splits").resize_down(4) end, opts },
    { "n", "<C-Right>", function() require("smart-splits").resize_right(8) end, opts },
    -- Make K (<C-k> for insert mode) use lsp.hover, call twice to jump to hoverdoc
    { "n", "K", function() vim.lsp.buf.hover() end, opts },
    { "i", "<C-k>", function() vim.lsp.buf.hover() end, opts },
    -- LSP bindings
    { "n", "gd", function() vim.lsp.buf.definition() end, opts },
    { "n", "gD", function() vim.lsp.buf.declaration() end, opts },
    { "n", "gI", function() vim.lsp.buf.implementation() end, opts },
    { "n", "gy", function() vim.lsp.buf.type_definition() end, opts },
    { "n", "gR", function() vim.lsp.buf.references() end, opts },
    { "n", "g=", function() vim.lsp.buf.format() end, opts },
    -- Navigate diagnostics
    { "n", "]d", function() vim.diagnostic.goto_next() end, opts },
    { "n", "[d", function() vim.diagnostic.goto_prev() end, opts },
    -- Navigate git changes in file  TODO move to config and link
    { "n", "]c", ":silent Gitsigns next_hunk<CR>", opts },
    { "n", "[c", ":silent Gitsigns prev_hunk<CR>", opts },
    -- Unimpaired  TODO move to config and link
    { "n", "[a", ':try | exec "norm \\<Plug>(unimpaired-previous)" | endtry | args<CR>', { remap = true } },
    { "n", "]a", ':try | exec "norm \\<Plug>(unimpaired-next)"     | endtry | args<CR>', { remap = true } },
    { "n", "[A", ':try | exec "norm \\<Plug>(unimpaired-first)"    | endtry | args<CR>', { remap = true } },
    { "n", "]A", ':try | exec "norm \\<Plug>(unimpaired-last)"     | endtry | args<CR>', { remap = true } },
    -- Splitjoin  TODO move to config and link
    { "n", "gS", ":TSJToggle<CR>", opts },
    -- Maintain Visual Mode after >/</= actions
    { "v", "<", "<gv", opts },
    { "v", ">", ">gv", opts },
    { "v", "=", "=gv", opts },
    -- Move visual block up or down (doesn't like cmdheight=0)
    { "v", "J", ":'<,'>m '>+1 | norm gv<CR>", opts },
    { "v", "K", ":'<,'>m '<-2 | norm gv<CR>", opts },
    -- Swap p and P to stop losing register contents by pasting over
    { "v", "p", "P", opts },
    { "v", "P", "p", opts },
    -- C-s : Quickly guess correct spelling errors (undoable)
    { "i", "<C-s>", "<C-g>u<Esc>[s1z=`]a<C-g>u", { remap = false } },
    { "n", "<C-s>", "i<C-g>u<Esc>[s1z=`]", { remap = false } },
    -- Stop accidentally opening help in insert mode
    { "i", "<F1>", "", opts },
    -- C-r C-r : See registers with fzf  # TODO move to config and link
    { "i", "<C-r><C-r>", "<cmd>FzfLua registers<CR>", opts },
}

local leader_mappings = {
    -- Vim Tab controls
    {"n", '<Leader>t', ':tabedit %<CR>', opts},
    {"n", '<Leader>n', ":tabnext<CR>", opts},
    {"n", '<Leader>p', ":tabnext<CR>", opts},
    {"n", '<Leader>N', ":+tabmove<CR>", opts},
    {"n", '<Leader>P', ":-tabmove<CR>", opts},
    -- Leader maps
    {"n", "<Leader><CR>", ":Ex %:p:h<CR>", opts}, -- File browser
    {"n", "<Leader><BS>", ":FzfLua files<CR>", opts}, -- File finder
    {"n", "<Leader><Tab>", "<C-^>", opts}, -- Last file
    {"n", "<Leader><Leader>","za", opts},
    {"n", "<Leader>aa",":argument | args<CR>", opts},
    {"n", "<Leader>ax",":argdelete | args<CR>", opts},
    {"n", "<Leader>as",":argadd | args<CR>", opts},
    {"n", "<Leader>q",":ToggleQL<CR>", opts}, -- Toggle qflist
    {"n", "<Leader>l",":ToggleLL<CR>", opts}, -- Toggle loclist
    {"n", "<Leader>;",":edit $MYVIMRC | lcd %:p:h<CR>", opts}, -- Edit settings
    {"n", "<Leader>:",":edit $MYVIMRC | lcd %:p:h | edit **/addons.lua <CR>", opts}, -- Edit addons
    {"n", "<Leader>d",":lcd %:p:h<CR>", opts},
    {"n", "<Leader>D",":cd %:p:h<CR>", opts},
    {"n", "<Leader>u",":UndoTreeToggle<CR>", opts},
    {"n", "<Leader>U",":Neogen<CR>", opts}, -- Generate docs
    {"n", "<Leader>J",":J day<CR>", opts},
    -- {"n", ,"<Leader>t",":make -k %:p:t:r<CR>", opts},
    -- LSP Leader bindings
    {"n", '<Leader>e',function() vim.diagnostic.open_float() end, opts},        -- Show line diagnostics
    {"n", '<Leader>E',function() vim.diagnostic.setloclist() end, opts},        -- Show buffer diagnostics
    {"n", '<Leader>=',function() vim.lsp.buf.format({ timeout_ms = 5000 }) end, opts},               -- Format buffer
    {"n", '<Leader>r',function() vim.lsp.buf.rename() end, opts},               -- Rename current symbol
    {"n", '<Leader>R',function() vim.lsp.buf.references() end, opts},
    {"n", '<Leader>k',function() vim.lsp.buf.signature_help() end, opts},       -- Show signature help
    {"n", '<Leader>A',function() vim.lsp.buf.code_action() end, opts},          -- Do code action
    {"n", '<Leader>v',function() vim.lsp.buf.document_symbol() end, opts},
    -- Leader maps
    {"n", '<Leader>cc',':Git<CR>', opts},
    {"n", '<Leader>cp',':Gitsigns preview_hunk<CR>', opts},
    {"n", '<Leader>ch',':Gitsigns toggle_deleted<CR>', opts},
    {"n", '<Leader>cb', function() require("gitsigns").blame_line({full=true}) end, opts},
    {"n", '<Leader>cf',":diffget //2<CR>", opts},  -- select left changes
    {"n", '<Leader>cj',":diffget //3<CR>", opts},  -- select right changes
    -- Packer maps
    {"n", '<Leader>.p',':exec "PackerSync" | echo "Syncing plugins"<CR>', opts},
    {"n", '<Leader>.i',':exec "PackerInstall" | echo "Installing plugins"<CR>', opts},
    {"n", '<Leader>.u',':exec "PackerUpdate" | echo "Updating plugins.."<CR>', opts},
    {"n", '<Leader>.c',':exec "PackerCompile" | echo "Compiling plugins.."<CR>', opts},
    {"n", '<Leader>.C',':exec "PackerClean" | echo "Cleaning plugins.."<CR>', opts},
    {"n", '<Leader>.s',':exec "PackerStatus" | echo "Plugin status"<CR>', opts},
    {"n", '<Leader>.a',":GotoConfig<CR>", opts},
    {"n", '<Leader>.S',":source $MYVIMRC<CR>", opts},
    -- Fzf mappings
    {"n", '<Leader>ff',":FzfLua resume<CR>", opts},
    {"n", '<Leader>fF',":FzfLua<CR>", opts},
    {"n", '<Leader>fb',":FzfLua buffers<CR>", opts},
    {"n", '<Leader>fr',":FzfLua registers<CR>", opts},                  -- Switch between buffers
    {"n", '<Leader>fo',":FzfLua oldfiles cwd_only=true<CR>", opts},     -- Recently changed files
    {"n", '<Leader>fO',":FzfLua oldfiles<CR>", opts},                   -- Recently changed files
    {"n", '<Leader>f/',":FzfLua lgrep_curbuf<CR>", opts},
    {"n", '<Leader>fg',":FzfLua live_grep_native<CR>", opts},                   -- Jumping with livegrep
    {"n", '<Leader>fh',":FzfLua help_tags<CR>", opts},
    {"n", '<Leader>fH',":FzfLua man_pages<CR>", opts},
    {"n", '<Leader>fc',":FzfLua highlights<CR>", opts},
    {"n", '<Leader>fj',":FzfLua jumps<CR>", opts},
    {"n", '<Leader>fJ',":FzfLua changes<CR>", opts},
    {"n", '<Leader>fG',":FzfLua git_status<CR>", opts},
    {"n", '<Leader>fq',":FzfLua quickfix<CR>", opts},
    {"n", '<Leader>fl',":FzfLua loclist<CR>", opts},
    {"n", '<Leader>fs',":FzfLua spell_suggest<CR>", opts},
    {"n", '<Leader>fv',":FzfLua lsp_document_symbols<CR>", opts},
    {"n", '<Leader>fV',":FzfLua lsp_workspace_symbols<CR>", opts},
    {"n", '<Leader>fa',":FzfLua args<CR>", opts},
}

local set_mappings = function(mappings)
    for _, map in pairs(mappings) do vim.keymap.set(unpack(map)) end
end

local add_undo_breakpoints_insert_mode_punctuation = function()
    local undo_mappings = {}
    for _, mark in pairs({ ".", ",", "!", "?", "(", ")", "[", "]", "{", "}", "<", ">", '"', "'" }) do
        undo_mappings[#undo_mappings+1] = {"i", mark, mark .. "<C-g>u", opts}
    end
    set_mappings(undo_mappings)
end

local disable_shift_alt_arrow_keys = function()
    local arrow_mappings = {}
    for _, mod in pairs({ "S-", "A-" }) do
        for _, dir in pairs({ "Left", "Down", "Up", "Right" }) do
            arrow_mappings[#arrow_mappings+1] = {"n", "<" .. mod .. dir .. ">", "", opts}
        end
    end
    set_mappings(arrow_mappings)
end


local M = {}

M.set = function()
    vim.g.mapleader = leader_key

    set_mappings(mappings)
    set_mappings(leader_mappings)

    add_undo_breakpoints_insert_mode_punctuation()
    disable_shift_alt_arrow_keys()
end

return M
