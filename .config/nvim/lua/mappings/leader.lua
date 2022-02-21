LEADER = {
    [''] = {
        ['<Leader><CR>']  = ":Lir<CR>",                   -- File explorer
        ['<Leader><BS>']  = ":Telescope find_files<CR>",  -- File finder
        ['<Leader><Tab>'] = "<C-^>",                      -- Last file
        ['<Leader><Esc>'] = ":Telescope buffers<CR>",     -- Buffers
        ['<Leader>q'] = ":q<CR>",                      -- Quit
        ['<Leader>Q'] = ":q!<CR>",                     -- Quit without saving
        ['<Leader>d'] = ":lcd %:p:h<CR>:pwd<CR>",      -- Change dir to current
        ['<Leader>D'] = ":cd %:p:h<CR>:pwd<CR>",       -- Change buffer dir to current
        ['<Leader>n'] = ":enew<CR>",                   -- New file
        ['<Leader>N'] = ":bufdo bdel | enew<CR>",      -- New session
        ['<Leader>h'] = ":set hls!<CR>",               -- Toggle highlights
        ['<Leader>c'] = ":ToggleCL<CR>",               -- Toggle qflist
        ['<Leader>l'] = ":ToggleLL<CR>",               -- Toggle loclist
        ['<Leader>s'] = ":setl spell!<CR>",            -- Toggle spelling
        ['<Leader>;'] = ":Settings<CR>",               -- Edit settings
        ['<Leader>:'] = ":luafile $MYVIMRC<CR>",       -- Reload settings
        ['<Leader>z'] = ":Twilight<CR>",               -- Toggle FocusMode
        ['<Leader>Z'] = ":ZenMode<CR>",                -- Toggle ZenMode
        ['<Leader>A'] = ":Neogen<CR>",                 -- Generate docs
    },
}

return LEADER
