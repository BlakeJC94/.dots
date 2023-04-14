return {
    [""] = {
        -- Vim Tab controls
        ['<Leader>t'] = ':tabedit %<CR>',
        ['<Leader>n'] = ":tabnext<CR>",
        ['<Leader>p'] = ":tabnext<CR>",
        ['<Leader>N'] = ":+tabmove<CR>",
        ['<Leader>P'] = ":-tabmove<CR>",
        -- Leader maps
        ["<Leader><CR>"] = ":Ex %:p:h<CR>", -- File browser
        ["<Leader><BS>"] = ":FzfLua files<CR>", -- File finder
        ["<Leader><Tab>"] = "<C-^>", -- Last file
        ["<Leader><Leader>"] = "za",
        ["<Leader>aa"] = ":argument | args<CR>",
        ["<Leader>ax"] = ":argdelete | args<CR>",
        ["<Leader>as"] = ":argadd | args<CR>",
        ["<Leader>q"] = ":ToggleQL<CR>", -- Toggle qflist
        ["<Leader>l"] = ":ToggleLL<CR>", -- Toggle loclist
        ["<Leader>;"] = ":edit $MYVIMRC | lcd %:p:h<CR>", -- Edit settings
        ["<Leader>:"] = ":edit $MYVIMRC | lcd %:p:h | edit **/addons.lua <CR>", -- Edit addons
        ["<Leader>d"] = ":lcd %:p:h<CR>",
        ["<Leader>D"] = ":cd %:p:h<CR>",
        ["<Leader>V"] = ":SymbolsOutline<CR>",
        ["<Leader>u"] = ":UndoTreeToggle<CR>",
        ["<Leader>U"] = ":Neogen<CR>", -- Generate docs
        ["<Leader>J"] = ":J day<CR>",
        -- ["<Leader>t"] = ":make -k %:p:t:r<CR>"
        ["<Leader>x"] = function() require("ts-node-action").node_action() end,
        -- ["<Leader>o"] = ":echo 'Toggling Copilot trigger' | Copilot suggestion toggle_auto_trigger<CR>",
        ["<Leader>O"] = ":Copilot panel open<CR>",
        -- LSP Leader bindings
        ['<Leader>e'] = function() vim.diagnostic.open_float() end,        -- Show line diagnostics
        ['<Leader>E'] = function() vim.diagnostic.setloclist() end,        -- Show buffer diagnostics
        ['<Leader>='] = function() vim.lsp.buf.format({ timeout_ms = 5000 }) end,               -- Format buffer
        ['<Leader>r'] = function() vim.lsp.buf.rename() end,               -- Rename current symbol
        ['<Leader>R'] = function() vim.lsp.buf.references() end,
        ['<Leader>k'] = function() vim.lsp.buf.signature_help() end,       -- Show signature help
        ['<Leader>A'] = function() vim.lsp.buf.code_action() end,          -- Do code action
        ['<Leader>v'] = function() vim.lsp.buf.document_symbol() end,
        -- Leader maps
        ['<Leader>cc'] = ':Git<CR>',
        ['<Leader>cp'] = ':Gitsigns preview_hunk<CR>',
        ['<Leader>ch'] = ':Gitsigns toggle_deleted<CR>',
        ['<Leader>cb'] = function() require("gitsigns").blame_line({full=true}) end,
        ['<Leader>cf'] = ":diffget //2<CR>",  -- select left changes
        ['<Leader>cj'] = ":diffget //3<CR>",  -- select right changes
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
        ['<Leader>ff'] = ":FzfLua resume<CR>",
        ['<Leader>fF'] = ":FzfLua<CR>",
        ['<Leader>fb'] = ":FzfLua buffers<CR>",
        ['<Leader>fr'] = ":FzfLua registers<CR>",                  -- Switch between buffers
        ['<Leader>fo'] = ":FzfLua oldfiles cwd_only=true<CR>",     -- Recently changed files
        ['<Leader>fO'] = ":FzfLua oldfiles<CR>",                   -- Recently changed files
        ['<Leader>f/'] = ":FzfLua lgrep_curbuf<CR>",
        ['<Leader>fg'] = ":FzfLua live_grep_native<CR>",                  -- Jumping with livegrep
        ['<Leader>fh'] = ":FzfLua help_tags<CR>",
        ['<Leader>fH'] = ":FzfLua man_pages<CR>",
        ['<Leader>fc'] = ":FzfLua highlights<CR>",
        ['<Leader>fj'] = ":FzfLua jumps<CR>",
        ['<Leader>fJ'] = ":FzfLua changes<CR>",
        ['<Leader>fG'] = ":FzfLua git_status<CR>",
        ['<Leader>fq'] = ":FzfLua quickfix<CR>",
        ['<Leader>fl'] = ":FzfLua loclist<CR>",
        ['<Leader>fs'] = ":FzfLua spell_suggest<CR>",
        ['<Leader>fv'] = ":FzfLua lsp_document_symbols<CR>",
        ['<Leader>fV'] = ":FzfLua lsp_workspace_symbols<CR>",
        ['<Leader>fa'] = ":FzfLua args<CR>",
        -- debugger
        ["<Leader>bb"] = function() require('dap').toggle_breakpoint() end, -- Toggle Breakpoint
        ["<Leader>bB"] = function() require('dap').set_breakpoint(vim.fn.input '[Condition] > ') end, -- Conditional Breakpoint
        ["<Leader>bc"] = function() require('dap').continue() end,
        ["<Leader>bh"] = function() require('dap').step_back() end, -- Step Back
        ["<Leader>bk"] = function() require('dap').step_over() end, -- Step Over
        ["<Leader>bj"] = function() require('dap').step_into() end, -- Step Into
        ["<Leader>bl"] = function() require('dap').step_out() end, -- Step Out
        ["<Leader>bQ"] = function() require('dap').terminate() end, -- Terminate
        ["<Leader>bq"] = function() require('dap').close() end, -- Quit
        ["<Leader>be"] = function() require('dapui').eval() end, -- Evaluate
        ["<Leader>bE"] = function() require('dapui').eval(vim.fn.input '[Expression] > ') end, -- Evaluate Input
        ["<Leader>B"] = function() require('dapui').toggle() end, -- Toggle UI
        ["<Leader>bx"] = function() require('dap').disconnect() end, -- Disconnect
        ["<Leader>bs"] = function() require('dap').session() end, -- Get Session
        ["<Leader>bR"] = function() require('dap').run_to_cursor() end, -- Run to Cursor
        ["<Leader>bK"] = function() require('dap.ui.widgets').hover() end, -- Hover Variables
        ["<Leader>bS"] = function() require('dap.ui.widgets').scopes() end, -- Scopes
        ["<Leader>bp"] = function() require('dap').pause.toggle() end, -- Pause
        ["<Leader>br"] = function() require('dap').repl.toggle() end, -- Toggle Repl
    },
    v = {
        -- Debugger eval
        ['<Leader>be'] = function() require('dapui').eval() end,  -- Evaluate
    },
}
