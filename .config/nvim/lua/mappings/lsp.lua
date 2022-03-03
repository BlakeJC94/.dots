LSP = {
    [''] = {
        -- Navigate diagnostics
        [']e'] = ':lua vim.diagnostic.goto_next()<CR>',
        ['[e'] = ':lua vim.diagnostic.goto_prev()<CR>',
        -- LSP bindings
        ['gd'] = ':LspDefinition<CR>',
        ['gD'] = ':LspDeclaration<CR>',
        ['gI'] = ':lua vim.lsp.buf.implementation()<CR>',
        ['gr'] = ':LspReferences<CR>',
        ['gy'] = ':LspTypeDefinition<CR>',
        -- LSP Leader bindings
        ['<Leader>e'] = ':lua vim.diagnostic.open_float()<CR>',  -- Show line diagnostics
        ['<Leader>E'] = ':lua vim.diagnostic.setloclist()<CR>',  -- Show buffer diagnostics
        ['<Leader>='] = ':lua vim.lsp.buf.formatting()<CR>',     -- Format buffer
        ['<Leader>r'] = ':LspRename<CR>',                        -- Rename current symbol
        ['<Leader>k'] = ':LspSignatureHelp<CR>',                 -- Show signature help
        ['<Leader>a'] = ':LspCodeAction<CR>',                    -- Do code action
    },
    n = {
        -- Make K use lsp.hover, call twice to jump to hoverdoc
        ['K'] = ':lua vim.lsp.buf.hover()<CR>',
    },
    i = {
        -- Make <C-k> use lsp.hover, call twice to jump to hoverdoc
        ['<C-k>'] = '<C-o>:lua vim.lsp.buf.hover()<CR>',
    }
}

return LSP
