_G._configs.has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

_G._configs.cmp_tab = function(fallback)
    local cmp = require("cmp")
    if cmp.visible() then
        cmp.select_next_item()
    elseif _G._configs.has_words_before() then
        cmp.complete()
    else
        fallback()
    end
end

_G._configs.cmp_s_tab = function(fallback)
    local cmp = require("cmp")
    if cmp.visible() then
        cmp.select_prev_item()
    else
        fallback()
    end
end

_G._configs.cmp_mappings = function()
    local cmp = require("cmp")
    local map = cmp.mapping
    local confirm_with_insert = map.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
    })
    return {
        ["<Up>"] = map(map.select_prev_item(), { "i", "c" }),
        ["<Down>"] = map(map.select_next_item(), { "i", "c" }),
        ["<S-Up>"] = map.scroll_docs(-4),
        ["<S-Down>"] = map.scroll_docs(4),
        ["<Left>"] = map(map.close(), { "i", "c" }),
        ["<Right>"] = map(confirm_with_insert, { "i", "c" }),
        ["<CR>"] = confirm_with_insert,
        ["<Tab>"] = map(_G._configs.cmp_tab, { "i", "s", "c" }),
        ["<S-Tab>"] = map(_G._configs.cmp_s_tab, { "i", "s", "c" }),
    }
end

return {
    requires = {
        "onsails/lspkind-nvim",
        "windwp/nvim-autopairs",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "kdheepak/cmp-latex-symbols",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-cmdline",
    },
    config = function()
        local cmp = require("cmp")
        local lspkind = require("lspkind")
        local autopairs = require("nvim-autopairs")

        vim.opt.completeopt = "menu,menuone,noselect"

        cmp.setup({
            formatting = { format = lspkind.cmp_format({ with_text = true, maxwidth = 50 }) },
            mapping = _G._configs.cmp_mappings(),
            sources = {
                { name = "nvim_lsp_signature_help" },
                { name = "nvim_lsp" },
                { name = "path" },
                { name = "buffer" },
                { name = "latex_symbols" },
            },
        })

        cmp.setup.cmdline(":", {
            sources = {
                { name = "cmdline" },
            },
        })
        cmp.setup.cmdline("/", {
            sources = {
                { name = "buffer" },
            },
        })

        -- Set up autopairs
        autopairs.setup({})
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local on_confirm_done = cmp_autopairs.on_confirm_done
        cmp.event:on("confirm_done", on_confirm_done({ map_char = { tex = "" } }))
    end,
}
