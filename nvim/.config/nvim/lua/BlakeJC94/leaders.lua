return {
    [""] = {
        -- Vim Tab controls
        ['<Leader>c'] = ':tabedit %<CR>',
        ['<Leader>n'] = ":tabnext<CR>",
        ['<Leader>p'] = ":tabnext<CR>",
        ['<Leader>N'] = ":+tabmove<CR>",
        ['<Leader>P'] = ":-tabmove<CR>",
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
        ["<Leader>h"] = ":DocsViewToggle<CR>",
        ["<Leader>u"] = ":UndoTreeToggle<CR>",
        ["<Leader>x"] = require("ts-node-action").node_action,
        -- Leader maps
        ['<Leader>gg'] = ':Git<CR>',
        ['<Leader>gp'] = ':Gitsigns preview_hunk<CR>',
        ['<Leader>gs'] = ':w | Gitsigns stage_hunk<CR>',
        ['<Leader>gu'] = ':w | Gitsigns undo_stage_hunk<CR>',
        ['<Leader>gr'] = ':Gitsigns reset_hunk | w<CR>',
        ['<Leader>gS'] = ':w | Gitsigns stage_buffer<CR>',
        ['<Leader>gU'] = ':w | Gitsigns reset_buffer_index<CR>',
        ['<Leader>gR'] = ':Gitsigns reset_buffer | w<CR>',
        ['<Leader>gh'] = ':Gitsigns toggle_deleted<CR>',
        ['<Leader>gb'] = function() require("gitsigns").blame_line({full=true}) end,
        ['<Leader>gB'] = ':GBrowse<CR>',
        ['<Leader>gd'] = ':Gvdiffsplit<CR>',
        ['<Leader>gD'] = ':Gvdiffsplit!<CR>',
        -- Packer maps
        ['<Leader>pp'] = ':exec "PackerSync" | echo "Syncing plugins"<CR>',
        ['<Leader>pi'] = ':exec "PackerInstall" | echo "Installing plugins"<CR>',
        ['<Leader>pu'] = ':exec "PackerUpdate" | echo "Updating plugins.."<CR>',
        ['<Leader>pc'] = ':exec "PackerCompile" | echo "Compiling plugins.."<CR>',
        ['<Leader>pC'] = ':exec "PackerClean" | echo "Cleaning plugins.."<CR>',
        ['<Leader>ps'] = ':exec "PackerStatus" | echo "Plugin status"<CR>',
        -- LSP Leader bindings
        ['<Leader>e'] = function() vim.diagnostic.open_float() end,        -- Show line diagnostics
        ['<Leader>E'] = function() vim.diagnostic.setloclist() end,        -- Show buffer diagnostics
        ['<Leader>='] = function() vim.lsp.buf.format() end,               -- Format buffer
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
        ['<Leader>fH'] = ":Telescope man_pages<CR>",
        ['<Leader>fc'] = ":Telescope highlights<CR>",
        ['<Leader>fG'] = ":Telescope git_status<CR>",
        ['<Leader>fq'] = ":Telescope quickfix<CR>",
        ['<Leader>fl'] = ":Telescope loclist<CR>",
        ['<Leader>fs'] = ":Telescope spell_suggest<CR>",
        ['<Leader>fv'] = ":Telescope lsp_document_symbols<CR>",
        ['<Leader>fV'] = ":Telescope lsp_workspace_symbols<CR>",
    },
    v = {
        -- Gitsigns stage_hunk visual mode
        ["<Leader>gs"] = ":'<,'>Gitsigns stage_hunk<CR>"
    },
}
