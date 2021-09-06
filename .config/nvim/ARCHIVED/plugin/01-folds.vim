
" Custom fold text
function! MyFoldText()
    let line = getline(v:foldstart)
    let foldedlinecount = v:foldend - v:foldstart + 1
    return ' >  '. foldedlinecount . '  ' . line
endfunction
set foldtext=MyFoldText()
" note: had to use a special unicode space here! (e28083)
set fillchars=fold: 
