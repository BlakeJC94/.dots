local actions = require'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require'lir.clipboard.actions'

require'lir'.setup {
  show_hidden_files = false,
  devicons_enable = true,
  mappings = {
    ['l']     = actions.edit,
    ['<CR>']  = actions.edit,
    ['_']     = actions.split,
    ['|']     = actions.vsplit,
    ['T']     = actions.tabedit,

    ['h']     = actions.up,
    ['<BS>']  = actions.up,
    ['q']     = actions.quit,
    ['<ESC>'] = actions.quit,

    ['F']     = actions.mkdir,
    ['f']     = actions.newfile,
    ['R']     = actions.rename,
    ['@']     = actions.cd,
    ['P']     = actions.yank_path,
    ['.']     = actions.toggle_show_hidden,
    ['D']     = actions.delete,

    ['M'] = function()
      mark_actions.toggle_mark()
      vim.cmd('normal! j')
    end,
    ['Y'] = clipboard_actions.copy,
    ['C'] = clipboard_actions.cut,
    ['P'] = clipboard_actions.paste,
  },
  float = {
    winblend = 0,

    -- -- You can define a function that returns a table to be passed as the third
    -- -- argument of nvim_open_win().
    -- win_opts = function()
    --   local width = math.floor(vim.o.columns * 0.8)
    --   local height = math.floor(vim.o.lines * 0.8)
    --   return {
    --     border = require("lir.float.helper").make_border_opts({
    --       "+", "─", "+", "│", "+", "─", "+", "│",
    --     }, "Normal"),
    --     width = width,
    --     height = height,
    --     row = 1,
    --     col = math.floor((vim.o.columns - width) / 2),
    --   }
    -- end,
  },
  hide_cursor = true,
}

-- custom folder icon
require'nvim-web-devicons'.set_icon({
    lir_folder_icon={
        icon="",
        name="LirFolderNode",
        color="#7ebae4",
    }
})
-- require'nvim-web-devicons'.setup({
--   -- override = {
--   --   lir_folder_icon = {
--   --     icon = "",
--   --     color = "#7ebae4",
--   --     name = "LirFolderNode"
--   --   },
--   -- },
--   -- default = true,
-- })

-- use visual mode
function _G.LirSettings()
  vim.api.nvim_buf_set_keymap(0, 'x', 'J', ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>', {noremap = true, silent = true})

  -- echo cwd
  vim.api.nvim_echo({{vim.fn.expand('%:p'), 'Normal'}}, false, {})
end

vim.cmd [[augroup lir-settings]]
vim.cmd [[  autocmd!]]
vim.cmd [[  autocmd Filetype lir :lua LirSettings()]]
vim.cmd [[  autocmd Filetype lir set nospell]]
vim.cmd [[augroup END]]

-- disable netrw
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1


-- old snippet: Netrw options
-- g.loaded_netrw       = 1
-- g.loaded_netrwPlugin = 1
-- g.netrw_banner       = 0
-- g.netrw_liststyle    = 0
-- g.netrw_list_hide    = ".*\\.swp$,.DS_Store,*.so,*.zip,*.git,^\\.\\=/\\=$"


