local M = {}

M.functions = require("BlakeJC94.utils.functions")
M.set = require("BlakeJC94.utils.set")

function M.slugify(input_string)
    local output_string = string.lower(input_string)
    output_string = string.gsub(output_string, "[ %[%]()%{%}%\\%/-.,=%'%\":;><]+", "_")
    output_string = string.gsub(output_string, "^[_]+", "")
    output_string = string.gsub(output_string, "[_]+$", "")
    return output_string
end

-- TODO make private
local function goto_config(keys)
    local addons_file = "lua/BlakeJC94/addons.lua"
    local addons_filepath = table.concat({ vim.fs.dirname(vim.fn.expand("$MYVIMRC")), addons_file }, "/")

    local config_dir = "lua/BlakeJC94/configs"
    local config_dirpath = table.concat({ vim.fs.dirname(vim.fn.expand("$MYVIMRC")), config_dir }, "/")

    if vim.fn.expand("%:p") ~= addons_filepath then
        return
    end

    -- print(vim.inspect(keys))

    local line_nr = keys.line1
    local line_content = vim.api.nvim_buf_get_lines(0, line_nr - 1, line_nr, false)[1]
    -- print(vim.inspect(line_content))

    local addr = string.match(line_content, "['\"][^'\"]*/([^'\"]*)['\"]") or ""
    if addr == "" then
        return
    end
    -- print(vim.inspect(addr))

    local config_filename = M.slugify(addr) .. ".lua"
    local config_path = table.concat({ config_dirpath, config_filename }, "/")
    -- print(vim.inspect(config_path))

    vim.cmd.edit(config_path)
end

function M.setup_goto_config()
    vim.api.nvim_create_user_command("GotoConfig", goto_config, { force = true, range = true })
end

function M.add_undo_breakpoints_insert_mode_punctuation()
    local mappings = { ["i"] = {} }
    for _, mark in pairs({ ".", ",", "!", "?", "(", ")", "[", "]", "{", "}", "<", ">", '"', "'" }) do
        mappings["i"][mark] = mark .. "<C-g>u"
    end
    M.set.mappings(mappings)
end

function M.disable_arrow_keys()
    local mappings = { [""] = {} }
    for _, mod in pairs({ "S-", "A-" }) do
        for _, dir in pairs({ "Left", "Down", "Up", "Right" }) do
            mappings[""]["<" .. mod .. dir .. ">"] = ""
        end
    end
    M.set.mappings(mappings)
end

return M
