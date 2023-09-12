local M = {}

M.mappings = {
    { "n", "[a", ':try | exec "norm \\<Plug>(unimpaired-previous)" | endtry | args<CR>', { remap = true } },
    { "n", "]a", ':try | exec "norm \\<Plug>(unimpaired-next)"     | endtry | args<CR>', { remap = true } },
    { "n", "[A", ':try | exec "norm \\<Plug>(unimpaired-first)"    | endtry | args<CR>', { remap = true } },
    { "n", "]A", ':try | exec "norm \\<Plug>(unimpaired-last)"     | endtry | args<CR>', { remap = true } },
    { "v", "J", "<Plug>(unimpaired-move-selection-down)gv", {remap=true} },
    { "v", "K", "<Plug>(unimpaired-move-selection-up)gv", {remap=true} },
}

return M
