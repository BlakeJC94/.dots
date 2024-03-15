if has_key(get(g:, 'plugs', {}), 'ale') == 0
  finish
endif

let g:ale_linters_explicit = 1
let g:ale_linters = {
      \'python': ['ruff'],
      \'julia': ['languageserver'],
      \}
let g:ale_fixers = {
      \'python': ['black', 'isort'],
      \}
let g:ale_virtualtext_cursor = 'disabled'
let g:ale_use_neovim_diagnostics_api = 0

highlight link ALEErrorSign SpellBad
highlight link ALEWarningSign SpellCap

nnoremap ]d <cmd>ALENextWrap<cr>
nnoremap [d <cmd>ALEPreviousWrap<cr>
nnoremap ]D <cmd>ALEFirst<cr>
nnoremap [D <cmd>ALELast<cr>

nnoremap <Leader>L <cmd>ALEPopulateLocList<cr>
nnoremap <Leader>= <cmd>ALEFix<cr>

augroup ale_help
  autocmd!
  autocmd FileType ale-preview.message set foldlevel=99
augroup END

augroup ale_fix_refold
    autocmd!
    autocmd User ALEFixPost norm zx
augroup END
