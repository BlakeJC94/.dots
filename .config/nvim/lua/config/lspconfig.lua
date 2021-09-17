local saga = require('lspsaga')
saga.init_lsp_saga({
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
})


local M = {}
function M.show_line_diagnostics()
    local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    }
    vim.lsp.diagnostic.show_line_diagnostics(opts)
end



-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client)
    local function buf_map(...) vim.api.nvim_buf_set_keymap(0, ...) end
    local function buf_opt(...) vim.api.nvim_buf_set_option(0, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_opt('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { noremap=true, silent=true }  -- TODO refactor

    buf_map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_map('n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_map('n', 'gs', '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>', opts)
    buf_map('n', 'gh', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', opts)
    buf_map('n', '<Up>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>', opts)
    buf_map('n', '<Down>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>', opts)

    buf_map('n', '\\wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_map('n', '\\wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_map('n', '\\wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

    buf_map('n', '\\d', '<cmd>lua require("lspsaga.provider").preview_definition()<CR>', opts)
    buf_map('n', '\\r', '<cmd>lua require("lspsaga.rename").rename()<CR>', opts)
    buf_map('n', '\\f', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>', opts)
    buf_map('v', '\\f', '<cmd>lua require("lspsaga.codeaction").range_code_action()<CR>', opts)

    buf_map('n', '<Leader>h', '<cmd>lua require("lspsaga.diagnostic").show_line_diagnostics()<CR>', opts)
    buf_map('n', '[d', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<CR>', opts)
    buf_map('n', ']d', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<CR>', opts)

    buf_map('n', '\\l', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_map('n', '\\f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

    -- show line diagnostics under cursor after `updatetime`
    -- vim.cmd([[
    --     autocmd CursorHold <buffer> lua require('lspsaga.hover').render_hover_doc()
    -- ]])
    -- vim.cmd([[
    --     autocmd CursorHold <buffer> lua require('config.lspconfig').show_line_diagnostics()
    -- ]])

    -- send errors to location list automatically
    vim.cmd([[
        autocmd BufWritePre,InsertLeave <buffer> lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
    ]])

    -- Print message if loaded successfully
    local msg = string.format("Language server %s started!", client.name)
    vim.api.nvim_echo({ { msg, "MoreMsg" } }, false, {})
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
    },
}


local lsp = require('lspconfig')
-- Python : `npm install pyright`
lsp.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150,
    }
})
-- Julia: `julia --project=~/.julia/environments/nvim-lspconfig -e 'using Pkg; Pkg.add("LanguageServer")'`
lsp.julials.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})


-- NOTE: the lua lsp completion only shows "Workspace loading:" and there are
-- no window diagnostics.. no amount of googling has shown me why, disabled for
-- now
-- Lua : Install LSP to path from source
-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
-- local sumneko_root_path = "/opt/lua-language-server"
-- local sumneko_binary = sumneko_root_path.."/bin/Linux/lua-language-server"
-- lsp.sumneko_lua.setup {
--     cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
--     capabilities = capabilities,
--     settings = {
--         Lua = {
--             runtime = {
--                 version = 'LuaJIT',
--                 path = vim.split(package.path, ';'),
--             },
--             completion = {
--                 enable = true,
--                 callSnippet = "Both",
--             },
--             diagnostics = {
--                 enable = true,
--                 globals = {'vim', 'decribe'},
--                 disable = {"lowercase-global"},
--             },
--             hint = {
--                 enable = true,
--             },
--             workspace = {
--                 library = {
--                     [vim.fn.expand('$VIMRUNTIME/lua')] = true,
--                     [vim.fn.expand('$VIMRUNTIME/lua/cim/lsp')] = true,
--                 }
--             },
--         },
--     },
--     on_attach = on_attach,
-- }

return M