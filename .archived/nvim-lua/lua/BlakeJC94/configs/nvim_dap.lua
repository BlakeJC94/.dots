local M = {}

M.requires = {
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap-python",
    "jbyuki/one-small-step-for-vimkind",
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

    require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python", { console = 'internalConsole' })
    -- require('dap-python').test_runner = "pytest"

    dap.adapters.python = {
        type = "executable",
        command = vim.g.python3_host_prog,
        args = { "-m", "debugpy.adapter" },
    }

    dap.adapters.nlua = function(callback, config)
        callback({ type = 'server', host = config.host, port = config.port })
    end

    dap.configurations.lua = {
        {
            type = 'nlua',
            request = 'attach',
            name = "Attach to running Neovim instance",
            host = function()
                local value = vim.fn.input('Host [127.0.0.1]: ')
                if value ~= "" then
                    return value
                end
                return '127.0.0.1'
            end,
            port = function()
                local val = tonumber(vim.fn.input('Port: ', "8086"))
                assert(val, "Please provide a port number")
                return val
            end,
        }
    }


    local augroup = vim.api.nvim_create_augroup
    local autocmd = vim.api.nvim_create_autocmd
    autocmd({ "BufEnter" }, {
        group = augroup("dap_ui_opts", { clear = true }),
        pattern = { "DAP*,dap-*" },
        -- pattern = {"dapui_scopes", "dapui_breakpoints", "dapui_stacks", "dapui_watches",
        --     "dap-repl", "dapui_console",
        -- },
        callback = function()
            vim.opt_local.spell = false
            vim.opt_local.colorcolumn = {}
            vim.opt_local.foldlevel = 99
        end,
    })
end

return M
