-- TODO refactor
return function()
    local cmp = require('cmp')
    local lspkind = require('lspkind')
    local autopairs = require('nvim-autopairs')
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')

    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    vim.opt.completeopt = 'menu,menuone,noselect'

    cmp.setup({
        formatting = {format = lspkind.cmp_format({with_text = true, maxwidth = 50})},
        mapping = {
            ['<Up>'] = cmp.mapping( cmp.mapping.select_prev_item(), {'i', 'c'}),
            ['<Down>'] = cmp.mapping( cmp.mapping.select_next_item(), {'i', 'c'}),
            ['<S-Up>'] = cmp.mapping.scroll_docs(-4),
            ['<S-Down>'] = cmp.mapping.scroll_docs(4),
            ['<Left>'] = cmp.mapping( cmp.mapping.close(), {'i', 'c'}),
            ['<Right>'] = cmp.mapping( cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true}), {'i', 'c'}),
            ["<CR>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            }),
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s", "c" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end, { "i", "s", "c" }),
        },
        sources = {
            -- {name = 'copilot'},
            {name = 'nvim_lsp_signature_help'},
            {name = 'nvim_lsp'},
            {name = 'path'},
            {name = 'buffer'},
            {name = 'latex_symbols'},
        },
        experimental = {
            -- native_menu = false,
            ghost_text = true,
        },
    })

    cmp.setup.cmdline(':', {
        sources = {
            { name = 'cmdline' },
        },
    })
    cmp.setup.cmdline('/', {
        sources = {
            { name = 'buffer' },
        },
    })

    -- Set up autopairs
    autopairs.setup({})
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({map_char = {tex = ''}}))
end
