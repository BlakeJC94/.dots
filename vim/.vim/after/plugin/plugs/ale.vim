if has_key(get(g:, 'plugs', {}), 'ale') == 0
  finish
endif

let g:ale_linters_explicit = 1
let g:ale_linters = {
      \'python': ['ruff'],
      \}
let g:ale_fixers = {
      \'python': ['ruff_format', 'ruff'],
      \'htmldjango': ['html-beautify'],
      \'html': ['html-beautify'],
      \}
let g:ale_virtualtext_cursor = 'disabled'
let g:ale_use_neovim_diagnostics_api = 0

" let g:ale_python_isort_options = '--sp ~/.isort.cfg'

highlight link ALEErrorSign SpellBad
highlight link ALEWarningSign SpellCap

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
