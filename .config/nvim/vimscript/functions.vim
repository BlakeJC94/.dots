

" Set options for editing text here
function TextEditOpts()
    setlocal wrap
    setlocal linebreak
    " setlocal breakindent
    setlocal showbreak=\ \ \|\  breakindent
    setlocal breakindentopt=sbr
    setlocal colorcolumn=0
    setlocal list
    setlocal virtualedit=all
    nnoremap <expr> k (v:count > 5 ? "m`" . v:count : "") . 'gk'
    nnoremap <expr> j (v:count > 5 ? "m`" . v:count : "") . 'gj'
endfunction

" Custom fold text
function! MyFoldText()
    let line = getline(v:foldstart)
    let foldedlinecount = v:foldend - v:foldstart + 1
    return ' >  '. foldedlinecount . '  ' . line
endfunction

" Use this function to diagnose bad syntax
function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

" Use this to debug long outputs (e.g. :call Exec('scriptnames'))
function! Exec(cmd)
    redir @a
        exec printf('silent %s',a:cmd)
    redir END
    " tabnew
    norm "ap
endfunction

" Toggle quickfix list
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction

" Toggle location list
function! ToggleLocation()
    if empty(filter(getwininfo(), 'v:val.loclist'))
        lopen
    else
        lclose
    endif
endfunction

" Trim trailing spaces without upsetting changelist
function! TrimTrailingSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction

function! ShowDocumentation()
    if (index(['vim','help'], &filetype) >=0)
        execute 'h '.expand('<cword>')
    else
        lua vim.lsp.buf.hover()
    endif
endfunction

" ---
" hi EvenLbg guibg='#660066'
" sign define EvenL linehl=EvenLbg
" func! ColorAltLines()
"     if exists('b:ALTLINES_disable') || exists('g:ALTLINES_disable')
"         echo "IGNORED"
"         return
"     elseif &buftype=="" && (!exists('b:ALTLINES_changedtick') || b:ALTLINES_changedtick != b:changedtick) && line('$') > 1
"         let l:range = (exists('b:ALTLINES_quick') ? max([line('.')-100+line('.')%2, 2]).','.min([line('.')+100,line('$')]) : '2,'.line('$'))
"         let l:starttime = localtime()
"         if exists('b:ALTLINES_changedtick') " don't unplace signs if they've never been placed
"             for id in eval('range('.l:range.',2)')
"                 exec 'sign unplace '.id.' buffer='.bufnr('%')
"                 if localtime()-l:starttime >= 10
"                     " force quick update next time and quit, it's taking way to long
"                     let b:ALTLINES_quick = 1
"                     return
"                 endif
"             endfor
"         endif
"         let l:pos_sav = getpos('.')
"         keepjumps exec l:range.'g#^#if line(".")%2==0 && localtime() - l:starttime < 16 | exec "sign place ".line(".")." line=".line(".")." name=EvenL buffer=".bufnr("%") | endif'
"         call setpos('.',l:pos_sav)
"         nohls
"         if localtime() - l:starttime > 4
"             let b:ALTLINES_quick = 1
"         endif
"         let b:ALTLINES_changedtick = b:changedtick
"     endif
"     echo "PASS"
" endfun
" augroup ALT_LINES
"     au!
"     autocmd BufWinEnter,InsertLeave,CursorHold,CursorHoldI * call ColorAltLines()
" augroup END
" ---
"

" hi odd guibg='#660066'
" hi even guibg='#330033'
" syn match odd "^.*$" contains=ALL nextgroup=even skipnl
" syn match even "^.*$" contains=ALL nextgroup=odd skipnl
" ---
" hi Alternate guibg='#660066' guifg=NONE
" execute 'match Alternate /\%(' . join(map(range(1,100), '"\\%" . v:val * 2 . "l"'), '\|') . '\)/'

" ---
function! ColorAltLines()
    hi Alternate guibg='#660066' guifg=NONE
    for line in range(1, line('$'), 2)
lua << EOF
vim.api.nvim_buf_add_highlight(0, -1, 'Alternate', line, 0, -1)
EOF
    endfor
    echo "PASS"
endfunction
