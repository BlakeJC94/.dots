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
        ["<Leader><BS>"] = ":Telescope find_files<CR>", -- File finder
        ["<Leader><Tab>"] = "<C-^>", -- Last file
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
        -- ["<Leader>C"] = require("nvim-highlight-colors").toggle,
        ["<Leader>x"] = require("ts-node-action").node_action,
        -- ["<Leader>o"] = require("copilot.panel").open,
        ["<Leader><Left>"] = "zc",
        ["<Leader><Right>"] = "zo",
        ["<Leader><Down>"] = "zj",
        ["<Leader><Up>"] = "zk",
        -- LSP Leader bindings
        ['<Leader>e'] = function() vim.diagnostic.open_float() end,        -- Show line diagnostics
        ['<Leader>E'] = function() vim.diagnostic.setloclist() end,        -- Show buffer diagnostics
        ['<Leader>='] = function() vim.lsp.buf.format() end,               -- Format buffer
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
        -- Clone mappings
        -- ['<Leader>,p'] = 'yap}p',
        -- ['<Leader>,P'] = 'yap{p',
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
        ["<Leader>cs"] = ":'<,'>Gitsigns stage_hunk<CR>",
    },
}
