local cmp = require 'cmp'
local luasnip = require 'luasnip'
local lspkind = require 'lspkind'

-- declare helper funcs
local check_back_space = function()
    local col = vim.fn.col '.' - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
end

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local tab_complete = function(fallback)
    if require('cmp').visible() then
        vim.cmd [[echo "TRACE" ]]
        cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
    else
        fallback()
    end
end
local s_tab_complete = function(fallback)
    if cmp.visible() then
        cmp.select_prev_item()
    elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
    else
        fallback()
    end
end
-- OLD VERSION
-- local tab_complete = function(fallback)
--     if vim.fn.pumvisible() == 1 then
--         vim.fn.feedkeys(t("<C-n>"), "n")
--     elseif luasnip.expand_or_jumpable() then
--         vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
--     elseif check_back_space() then
--         vim.fn.feedkeys(t("<Tab>"), "n")
--     else
--         fallback()
--     end
-- end
-- local s_tab_complete = function(fallback)
--     if vim.fn.pumvisible() == 1 then
--         vim.fn.feedkeys(t("<C-p>"), "n")
--     elseif luasnip.expand_or_jumpable() then
--         vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
--     elseif check_back_space() then
--         vim.fn.feedkeys(t("<S-Tab>"), "n")
--     else
--         fallback()
--     end
-- end

-- Set up luasnip and friendly snippets
require("luasnip/loaders/from_vscode").lazy_load()

-- Set up cmp
vim.opt.completeopt = 'menuone,noselect,noinsert'
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    formatting = {format = lspkind.cmp_format({with_text = true, maxwidth = 50})},
    mapping = {
        ['<Up>'] = cmp.mapping.select_prev_item(),
        ['<Down>'] = cmp.mapping.select_next_item(),
        ['<S-Up>'] = cmp.mapping.scroll_docs(-4),
        ['<S-Down>'] = cmp.mapping.scroll_docs(4),
        ['<Left>'] = cmp.mapping.close(),
        ['<Right>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },
        ["<CR>"] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        },
        ["<Tab>"] = cmp.mapping(tab_complete, {"i","s"}),
        ["<S-Tab>"] = cmp.mapping(s_tab_complete, {"i","s"}),
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'latex_symbols' },
    },
})

