if has_key(get(g:, 'plugs', {}), 'ale') == 0
  finish
endif


let g:ale_linters_explicit = 1
let g:ale_linters = {
      \'python': ['ruff'],
      \'julia': ['languageserver'],
      \}
let g:ale_fixers = {
      \'python': ['black'],
      \}
let g:ale_virtualtext_cursor = 'disabled'
let g:ale_use_neovim_diagnostics_api = 0

let g:ale_python_pyright_config = {
      \'pyright': {
        \'disableOrganizeImports': v:true,
        \},
      \'python': {
        \'autoSearchPaths': v:false,
        \'useLibraryCodeForTypes': v:false,
        \'diagnosticMode': 'openFilesOnly',
        \'typeCheckingMode': 'basic',
        \'diagnosticSeverityOverrides': {
          \'reportGeneralTypeIssues': 'warning',
          \'reportOptionalMemberAccess': 'warning',
          \'reportOptionalSubscript': 'warning',
          \'reportPrivateImportUsage': 'warning',
          \},
        \},
      \}


highlight link ALEErrorSign SpellBad
highlight link ALEWarningSign SpellCap

nnoremap ]D <cmd>ALENextWrap<cr>
nnoremap [D <cmd>ALEPreviousWrap<cr>
" nnoremap ]D <cmd>ALEFirst<cr>
" nnoremap [D <cmd>ALELast<cr>

nnoremap <Leader>D <cmd>ALEPopulateLocList<cr>
nnoremap <Leader>= <cmd>ALEFix<cr>

augroup ale_help
  autocmd!
  autocmd FileType ale-preview.message set foldlevel=99
augroup END
