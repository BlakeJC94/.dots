M = {}

-- Autocompletion menu during insert mode
M["hrsh7th/nvim-cmp"] = {
    requires = {
        "onsails/lspkind-nvim",
        "windwp/nvim-autopairs",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "kdheepak/cmp-latex-symbols",
        "hrsh7th/cmp-copilot",
        "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = function()
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
                ['<Up>'] = cmp.mapping.select_prev_item(),
                ['<Down>'] = cmp.mapping.select_next_item(),
                ['<S-Up>'] = cmp.mapping.scroll_docs(-4),
                ['<S-Down>'] = cmp.mapping.scroll_docs(4),
                ['<Left>'] = cmp.mapping.close(),
                ['<Right>'] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                }),
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    -- elseif snippy.can_expand_or_advance() then
                    --     snippy.expand_or_advance()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        local copilot_keys = vim.fn["copilot#Accept"]()
                        if copilot_keys ~= "" then
                            vim.api.nvim_feedkeys(copilot_keys, "i", true)
                        else
                            fallback()
                        end
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    -- elseif snippy.can_jump(-1) then
                    --     snippy.previous()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            },
            sources = cmp.config.sources({
                {name = 'copilot'},
                {name = 'nvim_lsp_signature_help'},
                {name = 'nvim_lsp'},
                {name = 'path'},
                {name = 'latex_symbols'},
            },{
                {name = 'path'},
                {name = 'buffer'},
            }),
            experimental = {
                ghost_text = false,
            }
        })

        -- Set up autopairs
        autopairs.setup({})
        cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
    end
}

-- Github copilot
M['github/copilot.vim'] = {
    config = function()
        vim.g.copilot_no_tab_map = true
        vim.g.copilot_assume_mapped = true
        vim.g.copilot_tab_fallback = ""
    end,
}

return M
