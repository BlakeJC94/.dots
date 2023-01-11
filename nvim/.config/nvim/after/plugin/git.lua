
local function configure_gitsigns()
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
        }
    })
end

function setup_git()
    configure_gitsigns()
end

setup_git()
