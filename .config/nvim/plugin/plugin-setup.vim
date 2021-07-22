" This file contains code needed to configure plugin settings


" -- NEOVIM LSP AND LSPINSTALL ------------------------------------------------
if has('nvim')

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
set shortmess+=c  " Hide extra message when using completion

lua << EOF
require'lspinstall'.setup()
local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{on_attach=require'completion'.on_attach}
end
-- Automatically reload after `:LspInstall <server>`
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
EOF

" " Old lsp config
"lua << EOF
"local lsp = require'lspconfig'
"local map = function(type, key, value)
"    vim.fn.nvim_buf_set_keymap(0, type, key, value, {noremap = true, silent=true})
"end
"local custom_attach = function(client)
"    print("Built-in LSP started")
"    require'completion'.on_attach()
"end
"lsp.pyls.setup{on_attach=custom_attach}
"EOF

endif
" -- TELESCOPE ----------------------------------------------------------------
if has('nvim')
    lua require('telescope').setup()
    lua require('telescope').load_extension('fzy_native')
endif
" -- QUICKSCOPE ---------------------------------------------------------------
let g:qs_max_chars=400
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
highlight QuickScopePrimary
    \ guifg='#66b2ff' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary
    \ guifg='#ff66b2' gui=underline ctermfg=81 cterm=underline
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary
              \guifg='#66b2ff' gui=underline ctermfg=81 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary
              \guifg='#ff66b2' gui=underline ctermfg=81 cterm=underline
augroup END

" -- TREESITTER ---------------------------------------------------------------
if has('nvim')

" Consistent syntax highlighting.
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

" Tree-sitter based folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()


" Indentation based on treesitter for the = operator
lua <<EOF
require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  }
}
EOF
endif

" -- VIM-SLIME ----------------------------------------------------------------
if has('nvim')
    let g:slime_target = "neovim"
else
    let g:slime_target = "vimterminal"
endif

let g:slime_python_ipython = 1

" -- GITGUTTER ----------------------------------------------------------------
let g:gitgutter_enabled = 0
let g:gitgutter_map_keys = 0
" Add to status line
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf(' +%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}
