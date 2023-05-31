local M = {}

M.mappings = {
    { "n", "[a", ':try | exec "norm \\<Plug>(unimpaired-previous)" | endtry | args<CR>', { remap = true } },
    { "n", "]a", ':try | exec "norm \\<Plug>(unimpaired-next)"     | endtry | args<CR>', { remap = true } },
    { "n", "[A", ':try | exec "norm \\<Plug>(unimpaired-first)"    | endtry | args<CR>', { remap = true } },
    { "n", "]A", ':try | exec "norm \\<Plug>(unimpaired-last)"     | endtry | args<CR>', { remap = true } },
}

return M
