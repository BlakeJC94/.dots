return {
    [''] = {
        -- Vim split controls
        ['<Leader>_'] = ':split<CR>',
        ['<Leader>|'] = ':vsplit<CR>',
        -- Vim Tab controls
        ['<Leader>t'] = ':tabedit %<CR>',
        ['<Leader>.'] = ":tabnext<CR>",
        ['<Leader>,'] = ":tabprev<CR>",
        ['<Leader>>'] = ":+tabmove<CR>",
        ['<Leader><'] = ":-tabmove<CR>",
        -- <Leader><S-Arrow> => Move split to direction
        -- ['<Leader>H'] = '<C-w>H',
        -- ['<Leader>J'] = '<C-w>J',
        -- ['<Leader>K'] = '<C-w>K',
        -- ['<Leader>L'] = '<C-w>L',
        -- ['<Leader><S-Left>'] =  '<C-w>H',
        -- ['<Leader><S-Down>'] =  '<C-w>J',
        -- ['<Leader><S-Up>'] =    '<C-w>K',
        -- ['<Leader><S-Right>'] = '<C-w>L',
        -- <A-Arrow> => Resize split
        -- ['<A-h>'] = function() require("tmux").resize_left(8)   end,
        -- ['<A-j>'] = function() require("tmux").resize_bottom(4) end,
        -- ['<A-k>'] = function() require("tmux").resize_top(4)    end,
        -- ['<A-l>'] = function() require("tmux").resize_right(8)  end,
        -- ['<A-Left>']  = function() require("tmux").resize_left(8)   end,
        -- ['<A-Down>']  = function() require("tmux").resize_bottom(4) end,
        -- ['<A-Up>']    = function() require("tmux").resize_top(4)    end,
        -- ['<A-Right>'] = function() require("tmux").resize_right(8)  end,
        -- <C-z> => map to <C-w> wincmds (useful when not using tmux)
        -- ['<C-z>'] = {map='<C-w>', opts={noremap=false}},
        -- <C-w><Arrow> => Mave to tmux/vim splits
        -- ['<C-z>h'] =       {map=function() require("tmux").move_left()   end, opts={noremap=false}},
        -- ['<C-z>j'] =       {map=function() require("tmux").move_bottom() end, opts={noremap=false}},
        -- ['<C-z>k'] =       {map=function() require("tmux").move_top()    end, opts={noremap=false}},
        -- ['<C-z>l'] =       {map=function() require("tmux").move_right()  end, opts={noremap=false}},
        -- ['<C-z><Left>']  = {map=function() require("tmux").move_left()   end, opts={noremap=false}},
        -- ['<C-z><Down>']  = {map=function() require("tmux").move_bottom() end, opts={noremap=false}},
        -- ['<C-z><Up>']    = {map=function() require("tmux").move_top()    end, opts={noremap=false}},
        -- ['<C-z><Right>'] = {map=function() require("tmux").move_right()  end, opts={noremap=false}},
    },
    n = {
        -- <C-Space> => Terminal "leader"
        --   <C-Space><C-Space> => Toggle floating terminal
        --   <C-Space>_ => Toggle split terminal
        --   <C-Space>| => Toggle vertical split terminal
        -- ['<C-Space>'] = "",
        -- ['<C-Space><C-Space>'] = function() require('FTerm').toggle() end,
        -- ['<C-Space>_'] = function() require('FTerm').toggle(); vim.cmd('wincmd J') end,
        -- ['<C-Space>|'] = function() require('FTerm').toggle(); vim.cmd('wincmd L') end,
    },
    i = {
        -- ['<C-Space>'] = "",
        -- ['<C-Space><C-Space>'] = "<Esc>:lua require('FTerm').toggle()<CR>",
        -- ['<C-Space>_'] = "<Esc>:lua require('FTerm').toggle(); vim.cmd('wincmd J')<CR>",
        -- ['<C-Space>|'] = "<Esc>:lua require('FTerm').toggle(); vim.cmd('wincmd L')<CR>",
        -- ['<C-z>'] = {map='<C-w>', opts={noremap=false}},
        -- ['<C-z>h'] =       {map=function() require("tmux").move_left()   end, opts={noremap=false}},
        -- ['<C-z>j'] =       {map=function() require("tmux").move_bottom() end, opts={noremap=false}},
        -- ['<C-z>k'] =       {map=function() require("tmux").move_top()    end, opts={noremap=false}},
        -- ['<C-z>l'] =       {map=function() require("tmux").move_right()  end, opts={noremap=false}},
        -- ['<C-z><Left>']  = {map=function() require("tmux").move_left()   end, opts={noremap=false}},
        -- ['<C-z><Down>']  = {map=function() require("tmux").move_bottom() end, opts={noremap=false}},
        -- ['<C-z><Up>']    = {map=function() require("tmux").move_top()    end, opts={noremap=false}},
        -- ['<C-z><Right>'] = {map=function() require("tmux").move_right()  end, opts={noremap=false}},
    },
    v = {
        -- ['<C-Space>'] = "",
        -- ['<C-Space><C-Space>'] = "<Esc>:lua require('FTerm').toggle()<CR>",
        -- ['<C-Space>_'] = "<Esc>:lua require('FTerm').toggle(); vim.cmd('wincmd J')<CR>",
        -- ['<C-Space>|'] = "<Esc>:lua require('FTerm').toggle(); vim.cmd('wincmd L')<CR>",
    },
    t = {
        -- <C-Space> => ToggleTerm Hide
        -- ['<C-Space><C-Space>'] = function() require('FTerm').toggle() end,
        -- Tab navigation
        -- ['<C-Space>.'] = function() vim.cmd('tabnext') end,
        -- ['<C-Space>,'] = function() vim.cmd('tabprev') end,
        -- ['<C-Space><S-.>'] = function() vim.cmd('+tabmove') end,
        -- ['<C-Space><S-,>'] = function() vim.cmd('-tabmove') end,
        -- <Esc><Esc> => (terminal) go to normal mode
        -- ['<C-Space><Esc>'] = '<C-\\><C-n>',
        -- <Esc>: => (terminal) go to command mode
        -- ['<C-Space>:'] = '<C-\\><C-n>:',
        -- <C-z> => Tmux bindkey passthrough
        -- ['<C-z>'] = {map="<C-\\><C-n><C-w>", opts={noremap=false}},
    },
}

