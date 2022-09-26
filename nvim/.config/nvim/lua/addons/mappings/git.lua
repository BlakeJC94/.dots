return {
    [''] = {
        -- Navigate git changes in file
        [']g'] = {map=[[&diff ? ']g' : '<cmd>Gitsigns next_hunk<CR>']], opts={expr=true}},
        ['[g'] = {map=[[&diff ? '[g' : '<cmd>Gitsigns prev_hunk<CR>']], opts={expr=true}},
        -- Leader maps
        ['<Leader>gg'] = ':Git<CR>',
        ['<Leader>gs'] = ':Git status<CR>',
        ['<Leader>gc'] = ':Git commit | startinsert<CR>',
        ['<Leader>gp'] = ':Gitsigns preview_hunk<CR>',
        ['<Leader>gs'] = ':Gitsigns stage_hunk | w<CR>',
        ['<Leader>gu'] = ':Gitsigns undo_stage_hunk | w<CR>',
        ['<Leader>gr'] = ':Gitsigns reset_hunk | w<CR>',
        ['<Leader>gS'] = ':Gitsigns stage_buffer | w<CR>',
        ['<Leader>gU'] = ':Gitsigns reset_buffer_index | w<CR>',
        ['<Leader>gR'] = ':Gitsigns reset_buffer | w<CR>',
        ['<Leader>gd'] = ':Git difftool<CR>',
        ['<Leader>gm'] = ':Git mergetool<CR>',
        ['<Leader>gb'] = function() require("gitsigns").blame_line({full=true}) end,
        ['<Leader>g|'] = ':Gvdiffsplit<CR>',
        ['<Leader>g_'] = ':Gdiffsplit<CR>',
    },
}

