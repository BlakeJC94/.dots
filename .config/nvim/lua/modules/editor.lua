M = {}

-- Better .-repeat actions
M['tpope/vim-repeat'] = {}

-- cs]} : Change surrounding brackets
M['tpope/vim-surround'] = {}

-- gc<motion> => toggle comments
M['tpope/vim-commentary'] = {}

-- crs => coerce cursor word to snake_case
M['tpope/vim-abolish'] = {}

-- iv/av => Text objects for substrings in snake/camel/kebab case
M['Julian/vim-textobj-variable-segment'] = {
    requires = {'kana/vim-textobj-user'}
}

-- Inverse <S-j> operation
-- TODO revisit mapping for this
M['AckslD/nvim-revJ.lua'] = {
    requires = {'wellle/targets.vim'},
    config = function()
        require("revj").setup{
            brackets = {first = '([{<', last = ')]}>'}, -- brackets to consider surrounding arguments
            new_line_before_last_bracket = true, -- add new line between last argument and last bracket (only if no last seperator)
            add_seperator_for_last_parameter = true, -- if a seperator should be added if not present after last parameter
            enable_default_keymaps = false, -- enables default keymaps without having to set them below
            keymaps = {
                operator = 'gJ', -- for operator (+motion)
                line = 'gj', -- for formatting current line
                visual = 'gj', -- for formatting visual selection
            },
            parameter_mapping = ',', -- specifies what text object selects an arguments (ie a, and i, by default)
            -- if you're using `vim-textobj-parameter` you can also set this to `vim.g.vim_textobj_parameter_mapping`
        }
    end
}

-- :... => Activate box/line drawing mode
-- TODO update docs
M["jbyuki/venn.nvim"] = {
    config = function()
        _G.Toggle_venn = function()
            local venn_enabled = vim.inspect(vim.b.venn_enabled)
            if venn_enabled == "nil" then
                vim.b.venn_enabled = true
                vim.cmd[[setlocal ve=all]]
                -- draw a line on HJKL keystokes
                vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", {noremap = true})
                vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", {noremap = true})
                vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", {noremap = true})
                vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", {noremap = true})
                -- draw a box by pressing "f" with visual selection
                vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", {noremap = true})
            else
                vim.cmd[[setlocal ve=block]]
                vim.cmd[[mapclear <buffer>]]
                vim.b.venn_enabled = nil
            end
        end
    end
}

-- align selection with gl<obj><char>
M['tommcdo/vim-lion'] = {}

-- More text objects
M['wellle/targets.vim'] = {}

-- :PasteImg => Link to imafe in clipboard
M['ekickx/clipboard-image.nvim'] = {}

-- -- Helper functions for scientific notes
-- M['jbyuki/nabla.nvim'] = {}

return M
