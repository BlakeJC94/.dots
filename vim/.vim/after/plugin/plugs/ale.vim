let g:ale_linters_explicit = 1
let g:ale_linters = {
      \'python': ['ruff'],
      \'sh': ['shellcheck'],
      \'vim': ['vint']
      \}
let g:ale_fixers = {
      \'sh': ['shfmt'],
      \'python': ['ruff_format', 'ruff'],
      \'htmldjango': ['html-beautify'],
      \'html': ['html-beautify'],
      \'css': ['prettier'],
      \}
let g:ale_virtualtext_cursor = 'disabled'
let g:ale_use_neovim_diagnostics_api = 0

" let g:ale_python_isort_options = '--sp ~/.isort.cfg'

highlight link ALEErrorSign SpellBad
highlight link ALEWarningSign SpellCap

nnoremap <Leader>L <cmd>ALEPopulateLocList<cr>
nnoremap <Leader>= <cmd>ALEFix<cr>

nnoremap ]e <cmd>ALENextWrap<cr>
nnoremap [e <cmd>ALEPreviousWrap<cr>
nnoremap ]E <cmd>ALEFirst<cr>
nnoremap [E <cmd>ALELast<cr>

nnoremap <Leader>E <cmd>ALEPopulateLocList<cr>
nnoremap <Leader>= <cmd>ALEFix<cr>

augroup ale_help
  autocmd!
  autocmd FileType ale-preview.message set foldlevel=99
augroup END

" augroup ale_fix_refold
"     autocmd!
"     autocmd User ALEFixPost norm zx
" augroup END
