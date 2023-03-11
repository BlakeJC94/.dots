local M = {}

M.requires = {
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap-python",
}

M.event = "BufReadPre"

function M.config()
    local dap = require("dap")
    local dapui = require("dapui")

    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "LspDiagnosticsSignError", linehl = "", numhl = "" })
    vim.fn.sign_define(
        "DapBreakpointCondition",
        { text = "ﳁ", texthl = "LspDiagnosticsSignError", linehl = "", numhl = "" }
    )

    vim.fn.sign_define(
        "DapStopped",
        { text = "", texthl = "LspDiagnosticsSignInformation", linehl = "", numhl = "" }
    )

    vim.fn.sign_define("DapLogPoint", { text = "", texthl = "LspDiagnosticsSignHint", linehl = "", numhl = "" })
    vim.fn.sign_define(
        "DapBreakpointRejected",
        { text = "", texthl = "LspDiagnosticsSignHint", linehl = "", numhl = "" }
    )

    require("nvim-dap-virtual-text").setup({ commented = true })

    dapui.setup()
    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
    end

    require("dap-python").setup("python", {})

    local sources = require("BlakeJC94").dap_sources
    for k, v in pairs(sources) do
        dap.adapters[k] = v
    end

    local augroup = vim.api.nvim_create_augroup
    local autocmd = vim.api.nvim_create_autocmd
    autocmd(
        {"BufEnter"},
        {
            group = augroup("dap_ui_opts", {clear = true}),
            pattern = {"DAP*"},
            -- pattern = {"dapui_scopes", "dapui_breakpoints", "dapui_stacks", "dapui_watches",
            --     "dap-repl", "dapui_console",
            -- },
            callback = function()
                vim.opt_local.spell = false
                vim.opt_local.colorcolumn = {}
                vim.opt_local.foldlevel = 99
            end,
        }
    )

end

return M
