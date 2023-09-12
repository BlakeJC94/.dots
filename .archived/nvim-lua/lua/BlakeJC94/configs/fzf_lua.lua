local M = {}

M.requires = {
    "nvim-tree/nvim-web-devicons",
}


function M.config()
    require'fzf-lua'.setup {
        winopts = {
            border = "none",
        },
        previewers = {
            man = { cmd = "man %s | col -bx" },
        },
        grep = {
            rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 --hidden",
        },
        highlights = {
            actions = {
                ["default"] = function(selected)  -- TODO open PR for this action
                    local bufnr = vim.api.nvim_get_current_buf()
                    if not vim.api.nvim_buf_is_valid(bufnr) or vim.api.nvim_buf_get_option(bufnr, "readonly") then
                        return
                    end
                    local cursor = vim.api.nvim_win_get_cursor(0)
                    local row, col = cursor[1] - 1, cursor[2]
                    local results = {}
                    for i = 1, #selected do
                        results[i] = string.gsub(selected[i], '^@', "")
                    end
                    vim.api.nvim_buf_set_text(bufnr, row, col, row, col, results)
                end
            },
            fzf_opts = {
                ["--no-multi"]  = nil,
            },
        }
    }

end

M.mappings = {
    -- Override spellchecker
    { "n", "z=", [[v:count ? v:count . 'z=' : ':FzfLua spell_suggest<CR>']], { expr = true } },
    -- C-r C-r : See registers with fzf
    { "i", "<C-r><C-r>", "<cmd>FzfLua registers<CR>"},
    -- Fzf mappings
    {"n", '<Leader>ff',":FzfLua resume<CR>"},
    {"n", '<Leader>fF',":FzfLua<CR>"},
    {"n", '<Leader>fb',":FzfLua buffers<CR>"},
    {"n", '<Leader>fr',":FzfLua registers<CR>"},                  -- Switch between buffers
    {"n", '<Leader>fo',":FzfLua oldfiles cwd_only=true<CR>"},     -- Recently changed files
    {"n", '<Leader>fO',":FzfLua oldfiles<CR>"},                   -- Recently changed files
    {"n", '<Leader>f/',":FzfLua lgrep_curbuf<CR>"},
    {"n", '<Leader>fg',":FzfLua live_grep_native<CR>"},                   -- Jumping with livegrep
    {"n", '<Leader>fh',":FzfLua help_tags<CR>"},
    {"n", '<Leader>fH',":FzfLua man_pages<CR>"},
    {"n", '<Leader>fc',":FzfLua highlights<CR>"},
    {"n", '<Leader>fj',":FzfLua jumps<CR>"},
    {"n", '<Leader>fJ',":FzfLua changes<CR>"},
    {"n", '<Leader>fG',":FzfLua git_status<CR>"},
    {"n", '<Leader>fq',":FzfLua quickfix<CR>"},
    {"n", '<Leader>fl',":FzfLua loclist<CR>"},
    {"n", '<Leader>fs',":FzfLua spell_suggest<CR>"},
    {"n", '<Leader>fv',":FzfLua lsp_document_symbols<CR>"},
    {"n", '<Leader>fV',":FzfLua lsp_workspace_symbols<CR>"},
    {"n", '<Leader>fa',":FzfLua args<CR>"},
}

return M

