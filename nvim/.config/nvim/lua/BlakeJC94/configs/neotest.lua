local M = {}

M.requires = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-plenary",
    "rouge8/neotest-rust",
}

-- TODO add some commands
-- TODO add nvim-dap
function M.config()
    require("neotest").setup({
        adapters = {
            require("neotest-python"),
            require("neotest-plenary"),
            require("neotest-rust"),
        },
    })
end

return M
