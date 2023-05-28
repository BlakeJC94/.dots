local M = {}

M.requires = {
    "onsails/lspkind-nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "lukas-reineke/cmp-under-comparator",
    "kdheepak/cmp-latex-symbols",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-cmdline",
}

local function has_words_before()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local function cmp_tab(fallback)
    local cmp = require("cmp")
    if cmp.visible() then
        cmp.select_next_item()
    elseif has_words_before() then
        cmp.complete()
    else
        fallback()
    end
end

local function cmp_s_tab(fallback)
    local cmp = require("cmp")
    if cmp.visible() then
        cmp.select_prev_item()
    else
        fallback()
    end
end

function M.config()
    local cmp = require("cmp")
    local map = cmp.mapping
    local lspkind = require("lspkind")

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
        sources = {
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
            { name = "latex_symbols" },
        },
        sorting = {
            comparators = {
                cmp.config.compare.offset,
                cmp.config.compare.exact,
                cmp.config.compare.score,
                require "cmp-under-comparator".under,
                cmp.config.compare.kind,
                cmp.config.compare.sort_text,
                cmp.config.compare.length,
                cmp.config.compare.order,
            },
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
