
" terminal command shortcuts
cabbrev term <C-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'ToggleTerm direction=horizontal' : 'term')<CR>
cabbrev vterm <C-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'ToggleTerm direction=vertical' : 'vterm')<CR>

" File directory
cnoreabbrev fd %:p:h

" Force sudo save
cnoreabbrev w!! <C-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'w sudo tee > /dev/null %<CR>' : 'w!!')

