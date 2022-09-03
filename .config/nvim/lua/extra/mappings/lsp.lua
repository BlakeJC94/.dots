return {
    [''] = {
        -- Navigate diagnostics
        [']e'] = function() vim.diagnostic.goto_next() end,
        ['[e'] = function() vim.diagnostic.goto_prev() end,
        -- LSP bindings
        ['gd'] = function() vim.lsp.buf.definition() end,
        ['gD'] = function() vim.lsp.buf.declaration() end,
        ['gI'] = function() vim.lsp.buf.implementation() end,
        ['gR'] = function() vim.lsp.buf.references() end,
        ['gy'] = function() vim.lsp.buf.type_definition() end,
        ['gw'] = function() vim.lsp.buf.document_symbol() end,
        -- LSP Leader bindings
        ['<Leader>e'] = function() vim.diagnostic.open_float() end,        -- Show line diagnostics
        ['<Leader>E'] = function() vim.diagnostic.setloclist() end,        -- Show buffer diagnostics
        ['<Leader>='] = function() vim.lsp.buf.formatting_seq_sync() end,  -- Format buffer
        ['<Leader>r'] = function() vim.lsp.buf.rename() end,               -- Rename current symbol
        ['<Leader>k'] = function() vim.lsp.buf.signature_help() end,       -- Show signature help
        ['<Leader>a'] = function() vim.lsp.buf.code_action() end,          -- Do code action
    },
    ['n'] = {
        -- Make K use lsp.hover, call twice to jump to hoverdoc
        ['K'] = function() vim.lsp.buf.hover() end,
    },
    ['i'] = {
        -- Make <C-k> use lsp.hover, call twice to jump to hoverdoc
        ['<C-k>'] = function() vim.lsp.buf.hover() end,
    },
}

