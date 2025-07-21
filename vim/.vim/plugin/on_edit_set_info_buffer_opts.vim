function! s:SetInfoBufferOpts()
  setl colorcolumn=
  setl nospell
  setl foldlevel=99
  setl fo-=t
  nnoremap <buffer> K :h <C-r>=expand('<cword>')<CR><CR>
endfunction

augroup base
  autocmd!
  autocmd FileType help,man,git,ale-info,fugitive,netrw call s:SetInfoBufferOpts()
augroup END
