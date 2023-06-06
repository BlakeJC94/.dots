local M = {}

M.mappings = {
    { "n", "<Leader>ww", "<plug>(wiki-index)" },
    { "n", "<Leader>wn", "<plug>(wiki-open)" },
    { "n", "<Leader>wj", "<plug>(wiki-journal)" },
    { "n", "<Leader>wx", "<plug>(wiki-reload)" },
}

function M.config()
    vim.g.wiki_root = '~/Workspace/repos/field-notes'
    vim.g.wiki_index_name = '_index_'
    vim.g.wiki_mappings_use_defaults = 'local'
    vim.g.wiki_link_creation = {
        md={
            link_type='wiki',
            url_extension="",
            url_transform=require("BlakeJC94.functions").slugify,
        }
    }
end

return M

