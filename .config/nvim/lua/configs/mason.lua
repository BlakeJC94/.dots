return {
    requires = {"WhoIsSethDaniel/mason-tool-installer.nvim"},
    config = function()
        require('mason').setup()
        require('mason-tool-installer').setup({
            ensure_installed = {
                'lua-language-server',
                'stylua',
                'shellcheck',
                'jq',
                'black',
                'pylint',
                'luacheck',
            },
        })
    end
}
