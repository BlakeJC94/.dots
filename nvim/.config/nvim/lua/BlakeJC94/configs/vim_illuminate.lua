local M = {}

function M.config()
    require('illuminate').configure({
        filetypes_denylist = require("BlakeJC94").filetype_exclude,
        filetypes_allowlist = require("BlakeJC94").filetype_include,
    })
end

return M
