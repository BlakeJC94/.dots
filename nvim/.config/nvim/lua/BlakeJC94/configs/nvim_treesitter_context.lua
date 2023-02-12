local M = {}

function M.config()
    require("treesitter-context").setup(
        {
            enable = true,
            throttle = true,
            max_lines = 0,
            patterns = {
                default = {
                    "class",
                    "function",
                    "method",
                },
            },
        }
    )
end

return M
