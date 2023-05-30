local M = {}

M.requires = { "nvim-lua/plenary.nvim" }

function M.config()
    require('gitsigns').setup({
        signcolumn = false,
        numhl      = true,
        linehl     = false,
        keymaps    = {}, -- Keymaps set in mappings.lua
        current_line_blame = true,
        preview_config = {
            border = 'none',
            style = 'minimal',
            relative = 'cursor',
        },
    })
end

M.mappings = {
    -- Navigate git changes in file
    { "n", "]c", ":silent Gitsigns next_hunk<CR>"},
    { "n", "[c", ":silent Gitsigns prev_hunk<CR>"},
    {"n", '<Leader>cp',':Gitsigns preview_hunk<CR>'},
    {"n", '<Leader>ch',':Gitsigns toggle_deleted<CR>'},
    {"n", '<Leader>cb', function() require("gitsigns").blame_line({full=true}) end},
    {"n", '<Leader>cf',":diffget //2<CR>"},  -- select left changes
    {"n", '<Leader>cj',":diffget //3<CR>"},  -- select right changes
}

return M
