local M = {}

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

return M

