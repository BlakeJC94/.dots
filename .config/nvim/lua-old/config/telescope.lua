-- set default mappings
vim.cmd [[
    nnoremap <leader>tf <cmd>Telescope find_files<cr>
    nnoremap <leader>tg <cmd>Telescope live_grep<cr>
    nnoremap <leader>tb <cmd>Telescope buffers<cr>
    nnoremap <leader>th <cmd>Telescope help_tags<cr>
]]


-- Make q close telescope window
local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}
