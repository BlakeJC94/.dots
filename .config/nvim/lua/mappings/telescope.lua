TELESCOPE = {
    [''] = {
        ['<Leader>tt'] = ":Telescope<CR>",                            -- Find Telescopes
        ['<Leader>tb'] = ":Telescope buffers<CR>",                    -- Switch between buffers
        ['<Leader>tr'] = ":Telescope registers<CR>",                  -- Switch between buffers
        ['<Leader>to'] = ":Telescope oldfiles<CR>",                   -- Recently changed files
        ['<Leader>tf'] = ":Telescope current_buffer_fuzzy_find<CR>",  -- Jumping with fuzzyfind
        ['<Leader>tF'] = ":Telescope live_grep<CR>",                  -- Jumping with livegrep
        ['<Leader>th'] = ":Telescope help_tags<CR>",
        ['<Leader>tg'] = ":Telescope git_status<CR>",
        ['<Leader>tc'] = ":Telescope quickfix<CR>",
        ['<Leader>tl'] = ":Telescope loclist<CR>",
        ['<Leader>ts'] = ":Telescope spell_suggest<CR>",
        ['<Leader>ta'] = ":Telescope lsp_code_actions<CR>",
    }
}

return TELESCOPE
