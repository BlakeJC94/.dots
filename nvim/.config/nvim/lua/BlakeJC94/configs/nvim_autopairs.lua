local M = {}
M.requires = { "hrsh7th/nvim-cmp" }
function M.config()
    local cmp = require("cmp")
    local autopairs = require("nvim-autopairs")

    autopairs.setup({})
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local on_confirm_done = cmp_autopairs.on_confirm_done
    cmp.event:on("confirm_done", on_confirm_done({ map_char = { tex = "" } }))
end
return M
