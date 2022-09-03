return {
    config = function()
        require('illuminate').configure({
            filetypes_denylist = _G._configs.filetype_exclude,
        })

        vim.cmd("hi def IlluminatedWordText guibg=#282828")
        vim.cmd("hi def IlluminatedWordRead guibg=#282828")
        vim.cmd("hi def IlluminatedWordWrite guibg=#282828")
        -- TODO figure out hls here, also cursorline? might have to replace
        -- https://github.com/yamatsum/nvim-cursorline
        -- https://github.com/yamatsum/nvim-cursorline/blob/804f0023692653b2b2368462d67d2a87056947f9/lua/nvim-cursorline.lua#L90
        -- print("TRACE")
        -- print("TRACE")
        -- print("TRACE")
        -- print("TRACE")
        -- print("TRACE")
        -- vim.cmd([[
        --     augroup illuminate_augroup
        --         autocmd!
        --         autocmd VimEnter * hi link illuminatedWord CursorLine
        --     augroup END
        -- ]])
    end


}
