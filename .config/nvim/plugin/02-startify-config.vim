
" Auto-update sessions from startify
let g:startify_session_persistence = 1

" Customise look
let g:startify_custom_header = [
    \ '      _    __                             ',
    \ '     | |  / /_                            ',
    \ '     | | / /(_)__ _                       ',
    \ '     | |/ // //  ` \                      ',
    \ '     |___//_//_/_/_/                      ',
    \ '                                          ',
    \ ' ---------------------------------------- ',
    \ ]
let g:startify_lists = [
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    \ { 'type': 'files',     'header': ['   Recently edited files']},
    \ { 'type': 'commands',  'header': ['   Commands']       },
    \ ]
let g:startify_custom_footer = 'startify#pad(startify#fortune#cowsay())'
hi StartifyHeader guifg='#fabd2f'
hi StartifySection guifg='#b8bb26'
