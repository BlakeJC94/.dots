return {
    config = function()
        require('illuminate').configure({
            filetypes_denylist = _G._configs.filetype_exclude,
            filetypes_allowlist = _G._configs.filetype_include,
        })
    end
}
