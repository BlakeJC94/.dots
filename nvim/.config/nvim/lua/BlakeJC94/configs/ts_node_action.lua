local M = {}

M.requires = {
    "nvim-treesitter/nvim-treesitter",
    "jose-elias-alvarez/null-ls.nvim",
}

function M.config()
    require("ts-node-action").setup({})
    require("null-ls").register({
        name = "more_actions",
        method = { require("null-ls").methods.CODE_ACTION },
        filetypes = { "_all" },
        generator = {
            fn = require("ts-node-action").available_actions,
        },
    })
end

return M
