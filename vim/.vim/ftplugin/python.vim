setl fo+=r
compiler pytest

let g:python3_host_prog = expand('~/.asdf/shims/python')


" Requires pytest-compiler and vim-dispatch
if has_key(get(g:, 'plugs', {}), 'vim-dispatch') == 0 && has_key(get(g:, 'plugs', {}), 'pytest-vim-compiler') == 0
  command! Pytest :Make -k %:p:t:r<CR>
  cnoreabbrev <expr> pytest (getcmdtype() ==# ':' && getcmdline() ==# 'pytest') ? 'Pytest' : 'pytest'
endif
