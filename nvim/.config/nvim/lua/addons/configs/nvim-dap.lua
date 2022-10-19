return {
    requires = {"mfussenegger/nvim-dap-python"},
    config = function()
        local dap = require("dap")
        dap.configurations.python = {
            {
                type = "python",
                request = "launch",
                name = "Launch file",
                program = "${file}",
                pythonPath = function()
                    return "/home/blake/.pyenv/shims/python"
                end,
            },
        }

        require('dap-python').test_runner = 'pytest'
        require('dap-python').setup('~/.pyenv/shims/python')
    end,
}
