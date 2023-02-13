local M = {}

M.functions = require("BlakeJC94.utils.functions")
M.set = require("BlakeJC94.utils.set")
M.pack = require("BlakeJC94.utils.pack")

function M.add_undo_breakpoints_insert_mode_punctuation()
    local mappings = {["i"] = {}}
    for _, mark in pairs({ ".", ",", "!", "?", "(", ")", "[", "]", "{", "}", "<", ">", '"', "'"  }) do
        mappings["i"][mark] = mark .. "<C-g>u"
    end
    M.set.mappings(mappings)
end

function M.disable_arrow_keys()
    local mappings = {[""] = {}}
    for _, mod in pairs({ "S-", "A-" }) do
        for _, dir in pairs({ "Left", "Down", "Up", "Right" }) do
            mappings[""]["<" .. mod .. dir .. ">"] = ""
        end
    end
    M.set.mappings(mappings)
end

return M
