local M = {}


function M.config()
    local null_ls = require("null-ls")

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

    local null_ls_sources = require("BlakeJC94").null_ls_sources
    local sources = {}

    for handle, handle_sources in pairs(null_ls_sources) do
        for source, opts in pairs(handle_sources) do
            sources[#sources+1] = null_ls.builtins[handle][source].with(opts)
        end
    end

    null_ls.setup({ sources = sources })
end

return M
