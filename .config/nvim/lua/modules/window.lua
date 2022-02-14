M = {}

-- Highlight lines during selection in command mode
M["winston0410/range-highlight.nvim"] = {
    config = function() require('range-highlight').setup({}) end,
    requires = {'winston0410/cmd-parser.nvim'}
}

-- Peek buffer lines during selection in command mode
M['nacro90/numb.nvim'] = {
    config = function() require('numb').setup() end,
}

-- Jump to last place when opening a file
M['ethanholz/nvim-lastplace'] = {
    config = function() require'nvim-lastplace'.setup{} end,
}

-- Stabilise split creation
M["luukvbaal/stabilize.nvim"] = {
    config = function() require("stabilize").setup() end
}

-- Ping cursor location after jump
M['danilamihailov/beacon.nvim'] = {}

return M
