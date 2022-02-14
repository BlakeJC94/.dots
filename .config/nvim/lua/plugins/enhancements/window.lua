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

-- Indent guides
M["lukas-reineke/indent-blankline.nvim"] = {
    requires = {"lukas-reineke/virt-column.nvim"},
    config = function()
        require("indent_blankline").setup({
            show_current_context = true,
            show_current_context_start = false,
            filetype_exclude = {
                "help",
                "alpha",
                "lir",
                "packer",
                "man",
            },
            buftype_exclude = {"terminal",},
        })
        vim.cmd("highlight IndentBlanklineContextChar guifg=#a89984 gui=nocombine")
    end
}

-- Better f/t targets
M["unblevable/quick-scope"] = {
    config = function()
        vim.g.qs_max_chars=800
        vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}
        vim.cmd [[
            function! QSColors()
                highlight QuickScopePrimary guifg='#ff007c' gui=bold ctermfg=198 cterm=bold
                highlight QuickScopeSecondary guifg='#00dfff' gui=bold ctermfg=45 cterm=bold
            endfunction
            call QSColors()
            augroup qs_colors
                autocmd!
                autocmd ColorScheme * call QSColors()
            augroup END
        ]]
    end
}

-- Colors Hex codes
M['norcalli/nvim-colorizer.lua'] = {
    config = function() require("colorizer").setup({'*'}, {names=false}) end
}

return M
