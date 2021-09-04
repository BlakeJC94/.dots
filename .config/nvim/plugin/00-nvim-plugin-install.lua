---- CMP --------

-- set mappings
local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end
cmp_mapping = {
    ['<C-Space>'] = require'cmp'.mapping.complete(),
    ['<Tab>'] = function(fallback)
        if vim.fn.pumvisible() == 1 then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
        elseif check_back_space() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, true, true), 'n')
        elseif vim.fn['vsnip#available']() == 1 then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>(vsnip-expand-or-jump)', true, true, true), '')
        else
            fallback()
        end
    end,
    ['<S-Tab>'] = function(fallback)
        if vim.fn.pumvisible() == 1 then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
        elseif check_back_space() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<S-Tab>', true, true, true), 'n')
        elseif vim.fn['vsnip#available']() == 1 then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>(vsnip-expand-or-jump)', true, true, true), '')
        else
            fallback()
        end
    end,
    ['<CR>'] = require'cmp'.mapping.confirm({
        behavior = require'cmp'.ConfirmBehavior.Replace,
        select = true,
    })
}

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- pass capabilities to each lsp setup func
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
        }
    }

-- setup hooks
require'cmp'.setup{
    completion = {
        autocomplete = false,
        completeopt = 'menu,menuone,noinsert',
    },
    snippet = {
        expand = function(args)
             vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = cmp_mapping,
    sources = {
        {name = 'nvim_lsp'},
        {name = 'buffer'},
        {name = 'path'},
        {name = 'calc'},
        {name = 'latex_symbols'},

    },
    formatting = {
        format = function(entry, vim_item)
            -- fancy icons and a name of kind
            vim_item.kind = require'lspkind'.presets.default[vim_item.kind]
            -- set a name for each source
            vim_item.menu = ({
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                luasnip = "[LuaSnip]",
                nvim_lua = "[Lua]",
                latex_symbols = "[Latex]",
            })[entry.source.name]
            return vim_item
        end
    }
}


-- require'compe'.setup {
--     enabled = true;
--     autocomplete = true;
--     debug = false;
--     min_length = 1;
--     preselect = 'enable';
--     throttle_time = 80;
--     source_timeout = 200;
--     incomplete_delay = 400;
--     max_abbr_width = 100;
--     max_kind_width = 100;
--     max_menu_width = 100;
--     documentation = true;
--     source = {
--         path = true;
--         buffer = true;
--         nvim_lsp = true;
--         ultisnips = true;
--         -- spell = true;
--         latex_symbols = true;
--         calc = true;
--     };
-- }
-- local t = function(str)
--   return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end
-- local check_back_space = function()
--     local col = vim.fn.col('.') - 1
--     if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
--         return true
--     else
--         return false
--     end
-- end
-- -- Use (s-)tab to:
-- --- move to prev/next item in completion menuone
-- --- jump to prev/next snippet's placeholder
-- _G.tab_complete = function()
--   if vim.fn.pumvisible() == 1 then
--     return t "<C-n>"
--   elseif check_back_space() then
--     return t "<Tab>"
--   else
--     return vim.fn['compe#complete']()
--   end
-- end
-- _G.s_tab_complete = function()
--   if vim.fn.pumvisible() == 1 then
--     return t "<C-p>"
--   else
--     return t "<S-Tab>"
--   end
-- end
-- vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- -- This line is important for auto-import
-- vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
-- vim.api.nvim_set_keymap('i', '<c-space>', 'compe#complete()', { expr = true })
-- -- Snippet engine integration
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.completion.completionItem.resolveSupport = {
--     properties = {
--         'documentation',
--         'detail',
--         'additionalTextEdits',
--         }
--     }


---- LSP --------
-- Source: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
-- Install Python language server
require'lspconfig'.pyright.setup{capabilities = capabilities}
-- Install C lsp
require'lspconfig'.clangd.setup{capabilities = capabilities}
-- Install Haskell language sever
require'lspconfig'.hls.setup{}
-- R language server
-- Requires `> install.packages("languageserver")` in R
require'lspconfig'.r_language_server.setup{
    capabilities = capabilities,
    cmd = { "R", "--slave", "-e", "languageserver::run()" },
    filetypes = { "r", "rmd" },
    log_level = 2
}

---- TELESCOPE --------
require('telescope').setup()
require('telescope').load_extension('fzy_native')


-- ---- TREESITTER --------
-- require'nvim-treesitter.configs'.setup {
--     highlight = {
--         enable = true,
--         -- custom_captures = {
--         --   -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
--         --   ["foo.bar"] = "Identifier",
--         -- },
--         -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
--         -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
--         -- Using this option may slow down your editor, and you may see some duplicate highlights.
--         -- Instead of true it can also be a list of languages
--         -- additional_vim_regex_highlighting = true,
--     },
--     incremental_selection = { enable = true, },
--     textobjects = { enable = true, },
-- }


-- ---- SPELLSITTER --------
-- require('spellsitter').setup {
--   hl = 'SpellBad',
--   captures = {'comment'},  -- set to {} to spellcheck everything
-- }


---- LSPINSTALL --------
-- require'lspinstall'.setup()
-- local servers = require'lspinstall'.installed_servers()
-- for _, server in pairs(servers) do
--   -- require'lspconfig'[server].setup{on_attach=require'completion'.on_attach}
--   require'lspconfig'[server].setup{}
-- end
-- -- Automatically reload after `:LspInstall <server>`
-- require'lspinstall'.post_install_hook = function ()
--   setup_servers() -- reload installed servers
--   vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
-- end
-- IMPLEMENT INTO COMPE
-- local servers = require'lspinstall'.installed_servers()
-- for _, server in pairs(servers) do
--   -- require'lspconfig'[server].setup{on_attach=require'completion'.on_attach}
--   require'lspconfig'[server].setup{capabilities = capabilities}
-- end
