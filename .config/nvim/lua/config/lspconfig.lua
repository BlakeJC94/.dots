local M = {}

function M.show_line_diagnostics()
    local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
    }
    vim.lsp.diagnostic.show_line_diagnostics(opts)
end
--
--
--
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
    buf_map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- buf_map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_map('n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    --buf_map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_map('n', '<C-;>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_map('n', '\\wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_map('n', '\\wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_map('n', '\\wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_map('n', '\\D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_map('n', '\\rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_map('n', '\\ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_map('n', '\\e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_map('n', '\\q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_map('n', '\\f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

    -- show line diagnostics under cursor after `updatetime`
    vim.cmd([[
        autocmd CursorHold <buffer> lua require('config.lspconfig').show_line_diagnostics()
    ]])
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


-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local lsp = require('lspconfig')
-- Python : `npm install pyright`
lsp.pyright.setup({
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    }
})

return M
