local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- MAPPINGS
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gl', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<Leader>j', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<Leader>k', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    -- buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    -- buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    --
    require'completion'.on_attach(client, bufnr)
end


-- Install Python language server
nvim_lsp.pyright.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

-- Install C lsp
nvim_lsp.clangd.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

-- Install Haskell language sever
nvim_lsp.hls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}
-- R language server
-- Requires `> install.packages("languageserver")` in R
nvim_lsp.r_language_server.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "R", "--slave", "-e", "languageserver::run()" },
    filetypes = { "r", "rmd" },
    log_level = 2,
}


-- LSPSAGA
local saga = require 'lspsaga'
saga.init_lsp_saga()
