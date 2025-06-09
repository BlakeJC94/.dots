cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev Qall qall

cnoreabbrev <expr> git (getcmdtype() ==# ':' && getcmdline() ==# 'git') ? 'Git' : 'git'

iabbrev <expr> @@d strftime('%Y-%m-%d')
iabbrev <expr> @@t strftime('%Y-%m-%dT%T%z')[:21] . ':00'
inoreabbrev <expr> ,u system('uuidgen')->trim()->tolower()

inoreabbrev rbm # TODO: remove before merging
inoreabbrev cbm # TODO: change before merging
inoreabbrev ubm # TODO: uncomment before merging



function! InsertFrontMatter()
  let l:date = strftime('%Y-%m-%dT%T%z')[:21] . ':00'
  call append(line('.') - 1, [
        \ '+++',
        \ "date = '" . l:date . "'",
        \ 'draft = true',
        \ "title = ''",
        \ '+++',
        \ '',
        \ ''
        \ ])
  normal! 4k$
  startinsert
endfunction

inoremap <silent> @@b <C-o>:call InsertFrontMatter()<CR>
