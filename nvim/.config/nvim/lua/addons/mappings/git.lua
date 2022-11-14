return {
    [''] = {
        -- Navigate git changes in file
        [']g'] = ':silent Gitsigns next_hunk<CR>',
        ['[g'] = ':silent Gitsigns prev_hunk<CR>',
        -- Leader maps
        ['<Leader>gg'] = ':w | Git<CR>',
        ['<Leader>gG'] = ':Git status<CR>',
        ['<Leader>gc'] = ':Git commit | startinsert<CR>',
        ['<Leader>gC'] = ':Git commit --amend<CR>',
        ['<Leader>gp'] = ':Gitsigns preview_hunk<CR>',
        ['<Leader>gs'] = ':w | Gitsigns stage_hunk<CR>',
        ['<Leader>gu'] = ':w | Gitsigns undo_stage_hunk<CR>',
        ['<Leader>gr'] = ':Gitsigns reset_hunk | w<CR>',
        ['<Leader>gS'] = ':w | Gitsigns stage_buffer<CR>',
        ['<Leader>gU'] = ':w | Gitsigns reset_buffer_index<CR>',
        ['<Leader>gR'] = ':Gitsigns reset_buffer | w<CR>',
        ['<Leader>gd'] = ':Git difftool<CR>',
        ['<Leader>gm'] = ':Git mergetool<CR>',
        ['<Leader>gb'] = function() require("gitsigns").blame_line({full=true}) end,
        ['<Leader>g|'] = ':Gvdiffsplit<CR>',
        ['<Leader>g_'] = ':Gdiffsplit<CR>',
    },
}
