-- set mappings
vim.cmd [[
    nnoremap <leader>a <cmd>lua require("harpoon.mark").add_file()<cr>
    nnoremap <leader>f <cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>
    nnoremap <leader>1 <cmd>lua require("harpoon.ui").nav_file(1)<cr>
    nnoremap <leader>2 <cmd>lua require("harpoon.ui").nav_file(2)<cr>
    nnoremap <leader>3 <cmd>lua require("harpoon.ui").nav_file(3)<cr>
    nnoremap <leader>4 <cmd>lua require("harpoon.ui").nav_file(4)<cr>
    nnoremap <leader>5 <cmd>lua require("harpoon.ui").nav_file(5)<cr>
    nnoremap <leader>6 <cmd>lua require("harpoon.ui").nav_file(6)<cr>
]]
