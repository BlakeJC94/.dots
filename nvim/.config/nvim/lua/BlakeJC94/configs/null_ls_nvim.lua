local M = {}

local function null_ls_juliaformatter()
    local h = require("null-ls.helpers")
    local methods = require("null-ls.methods")
    return h.make_builtin({
        name = "juliaformatter",
        meta = {
            url = "https://github.com/domluna/JuliaFormatter.jl",
            description = "An opinionated code formatter for Julia. Plot twist - the opinion is your own.",
        },
        method = methods.internal.FORMATTING,
        filetypes = { "julia" },
        generator_opts = {
            command = "julia",
            args = {
                -- "--project=" .. juliaformatter_project,
                "--startup-file=no",
                "--color=no",
                "-e",
                [['using JuliaFormatter; format("$FILENAME")']],
            },
            to_stdin = false,
        },
        factory = h.formatter_factory,
    })
end

function M.config()
    local null_ls = require("null-ls")
    null_ls.setup({
        sources = {
            null_ls.builtins.formatting.black,
            null_ls.builtins.diagnostics.pylint,
            null_ls.builtins.formatting.jq,
            null_ls.builtins.diagnostics.luacheck,
            null_ls.builtins.formatting.stylua,
            -- null_ls_juliaformatter(),
            null_ls.builtins.formatting.rustfmt,
        },
    })
end

return M
