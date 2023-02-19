local M = {}

function M.config()
    local field_notes_path = vim.fn.expand('~/Workspace/repos/field-notes')
    require("field_notes").setup(
        {
            field_notes_path = field_notes_path,
            notes_dir = 'notes',
            journal_dir = 'journal',
            journal_subdirs = {
                day = 'daily',
                week = 'weekly',
                month = 'monthly',
            },
            journal_maps = {
                left = "<Leader><Left>",
                down = "<Leader><Down>",
                up = "<Leader><Up>",
                right = "<Leader><Right>",
            },
        }
    )
end

return M
