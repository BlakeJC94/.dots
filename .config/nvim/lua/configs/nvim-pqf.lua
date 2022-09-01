return {
    config = function()
        require('pqf').setup({
            signs = {
                error = " ",
                warning = " ",
                info = " " ,
                hint = " ",
            }
        })
    end
}

