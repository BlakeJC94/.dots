return {
    config = function()
        require('illuminate').configure({
            filetypes_denylist = _G._configs.filetype_exclude,
        })

        vim.cmd("hi def IlluminatedWordText guibg=#282828")
        vim.cmd("hi def IlluminatedWordRead guibg=#282828")
        vim.cmd("hi def IlluminatedWordWrite guibg=#282828")
    end


}
