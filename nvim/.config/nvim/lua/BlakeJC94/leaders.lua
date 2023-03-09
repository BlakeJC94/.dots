return {
    [""] = {
        -- Vim Tab controls
        ['<Leader>c'] = ':tabedit %<CR>',
        ['<Leader>n'] = ":tabnext<CR>",
        ['<Leader>p'] = ":tabnext<CR>",
        ['<Leader>N'] = ":+tabmove<CR>",
        ['<Leader>P'] = ":-tabmove<CR>",
        -- Leader maps
        ["<Leader><CR>"] = ":Ex %:p:h<CR>", -- File browser
        ["<Leader><BS>"] = ":FzfLua files<CR>", -- File finder
        ["<Leader><Tab>"] = "<C-^>", -- Last file
        ["<Leader><Leader>"] = "za",
        ["<Leader><Left>"] = "zc",
        ["<Leader><Right>"] = "zo",
        ["<Leader>q"] = ":ToggleQL<CR>", -- Toggle qflist
        ["<Leader>l"] = ":ToggleLL<CR>", -- Toggle loclist
        ["<Leader>;"] = ":edit $MYVIMRC | lcd %:p:h<CR>", -- Edit settings
        ["<Leader>:"] = ":edit $MYVIMRC | lcd %:p:h | edit **/addons.lua <CR>", -- Edit addons
        ["<Leader>d"] = ":lcd %:p:h<CR>",
        ["<Leader>D"] = ":cd %:p:h<CR>",
        ["<Leader>v"] = ":DocsViewToggle<CR>",
        ["<Leader>V"] = ":SymbolsOutline<CR>",
        ["<Leader>u"] = ":UndoTreeToggle<CR>",
        ["<Leader>U"] = ":Neogen<CR>", -- Generate docs
        ["<Leader>J"] = ":J day<CR>",
        ["<Leader>x"] = function() require("ts-node-action").node_action() end,
        ["<Leader>H"] = function() require("nvim-highlight-colors").toggle() end,
        ["<Leader>o"] = function() require("copilot.panel").open() end,
        -- LSP Leader bindings
        ['<Leader>e'] = function() vim.diagnostic.open_float() end,        -- Show line diagnostics
        ['<Leader>E'] = function() vim.diagnostic.setloclist() end,        -- Show buffer diagnostics
        ['<Leader>='] = function() vim.lsp.buf.format({ timeout_ms = 5000 }) end,               -- Format buffer
        ['<Leader>r'] = function() vim.lsp.buf.rename() end,               -- Rename current symbol
        ['<Leader>R'] = function() vim.lsp.buf.references() end,
        ['<Leader>k'] = function() vim.lsp.buf.signature_help() end,       -- Show signature help
        ['<Leader>a'] = function() vim.lsp.buf.code_action() end,          -- Do code action
        -- Leader maps
        ['<Leader>g'] = ':Git<CR>',
        ['<Leader>B'] = ':GBrowse<CR>',
        ['<Leader>cp'] = ':Gitsigns preview_hunk<CR>',
        ['<Leader>cs'] = ':w | Gitsigns stage_hunk<CR>',
        ['<Leader>cu'] = ':w | Gitsigns undo_stage_hunk<CR>',
        ['<Leader>cr'] = ':Gitsigns reset_hunk | w<CR>',
        ['<Leader>cS'] = ':w | Gitsigns stage_buffer<CR>',
        ['<Leader>cU'] = ':w | Gitsigns reset_buffer_index<CR>',
        ['<Leader>cR'] = ':Gitsigns reset_buffer | w<CR>',
        ['<Leader>ch'] = ':Gitsigns toggle_deleted<CR>',
        ['<Leader>cb'] = function() require("gitsigns").blame_line({full=true}) end,
        -- Packer maps
        ['<Leader>.p'] = ':exec "PackerSync" | echo "Syncing plugins"<CR>',
        ['<Leader>.i'] = ':exec "PackerInstall" | echo "Installing plugins"<CR>',
        ['<Leader>.u'] = ':exec "PackerUpdate" | echo "Updating plugins.."<CR>',
        ['<Leader>.c'] = ':exec "PackerCompile" | echo "Compiling plugins.."<CR>',
        ['<Leader>.C'] = ':exec "PackerClean" | echo "Cleaning plugins.."<CR>',
        ['<Leader>.s'] = ':exec "PackerStatus" | echo "Plugin status"<CR>',
        ['<Leader>.a'] = ":GotoConfig<CR>",
        ['<Leader>.S'] = ":source $MYVIMRC<CR>",
        -- Fzf mappings
        ['<Leader>ff'] = ":FzfLua resume<CR>",                     -- Open last telescope
        ['<Leader>fF'] = ":FzfLua<CR>",                            -- Find Telescopes
        ['<Leader>fb'] = ":FzfLua buffers<CR>",                    -- Switch between buffers
        ['<Leader>fr'] = ":FzfLua registers<CR>",                  -- Switch between buffers
        ['<Leader>fo'] = ":FzfLua oldfiles<CR>",                   -- Recently changed files
        ['<Leader>f/'] = ":FzfLua current_buffer_fuzzy_find<CR>",  -- Jumping with fuzzyfind
        ['<Leader>fg'] = ":FzfLua live_grep<CR>",                  -- Jumping with livegrep
        ['<Leader>fh'] = ":FzfLua help_tags<CR>",
        ['<Leader>fH'] = ":FzfLua man_pages<CR>",
        ['<Leader>fc'] = ":FzfLua highlights<CR>",
        ['<Leader>fG'] = ":FzfLua git_status<CR>",
        ['<Leader>fq'] = ":FzfLua quickfix<CR>",
        ['<Leader>fl'] = ":FzfLua loclist<CR>",
        ['<Leader>fs'] = ":FzfLua spell_suggest<CR>",
        ['<Leader>fv'] = ":FzfLua lsp_document_symbols<CR>",
        ['<Leader>fV'] = ":FzfLua lsp_workspace_symbols<CR>",
    },
    v = {
        -- Gitsigns stage_hunk visual mode
        ["<Leader>hs"] = ":'<,'>Gitsigns stage_hunk<CR>",
    },
}
