local M = {}

M.requires = {
    "onsails/lspkind-nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "kdheepak/cmp-latex-symbols",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
}

function M.config()
    local cmp = require("cmp")
    local map = cmp.mapping
    local lspkind = require("lspkind")

    local function has_words_before()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local function cmp_tab(fallback)
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        if cmp.visible() then
            cmp.select_next_item()
        elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
        elseif has_words_before() then
            cmp.complete()
        else
            fallback()
        end
    end

    local function cmp_s_tab(fallback)
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        if cmp.visible() then
            cmp.select_prev_item()
        elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
        else
            fallback()
        end
    end

    vim.opt.completeopt = "menu,menuone,preview,noselect,noinsert"
    cmp.setup({
        formatting = { format = lspkind.cmp_format({ with_text = true, maxwidth = 50 }) },
        mapping = {
            ["<Up>"] = map(map.select_prev_item(), { "i", "c" }),
            ["<Down>"] = map(map.select_next_item(), { "i", "c" }),
            ["<S-Up>"] = map.scroll_docs(-4),
            ["<S-Down>"] = map.scroll_docs(4),
            ["<Tab>"] = map(cmp_tab, { "i", "s", "c" }),
            ["<S-Tab>"] = map(cmp_s_tab, { "i", "s", "c" }),
            ["<C-c>"] = map(map.abort(), {"i", "c"}),
            ["<CR>"] = map.confirm({
                behavior = cmp.ConfirmBehavior.Select,
                select = true,
            }),
        },
        preselect = cmp.PreselectMode.None,
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end,
        },
        sources = {
            { name = "nvim_lsp_signature_help" },
            { name = "nvim_lsp" },
            { name = "path" },
            {
                name = "buffer",
                option = {
                    get_bufnrs = function()
                        local bufs = {}
                        for _, win in ipairs(vim.api.nvim_list_wins()) do
                            local buf = vim.api.nvim_win_get_buf(win)
                            local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
                            if byte_size < 1024 * 1024 then
                                bufs[vim.api.nvim_win_get_buf(win)] = true
                            end
                        end
                        return vim.tbl_keys(bufs)
                    end,
                },
            },
            { name = "luasnip" },
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
end

return M
