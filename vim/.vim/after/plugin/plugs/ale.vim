if has_key(get(g:, 'plugs', {}), 'ale') == 0
  finish
endif


let g:ale_linters_explicit = 1
let g:ale_linters = {
      \'python': ['pyright', 'ruff'],
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

nnoremap ]d <cmd>ALENextWrap<cr>
nnoremap [d <cmd>ALEPreviousWrap<cr>
nnoremap ]D <cmd>ALEFirst<cr>
nnoremap [D <cmd>ALELast<cr>

nnoremap gd <cmd>ALEGoToDefinition<cr>
nnoremap gy <cmd>ALEGoToTypeDefinition<cr>
nnoremap gR <cmd>ALEFindReferences<cr>

nnoremap <Leader>d <cmd>ALEDetail<cr>
nnoremap <Leader>D <cmd>ALEPopulateLocList<cr>
nnoremap <Leader>= <cmd>ALEFix<cr>
nnoremap <Leader>r <cmd>ALERename<cr>
nnoremap <Leader>R <cmd>ALEFileRename<cr>

nnoremap K <cmd>ALEHover<cr>
inoremap <C-k> <cmd>ALEHover<cr>

augroup ale_help
  autocmd!
  autocmd FileType ale-preview.message set foldlevel=99
augroup END
