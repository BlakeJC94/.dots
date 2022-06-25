" Sane-er defaults for Vim
" ========================
" This has been written to not include any plugins at all. But if I had to chose a couple of
" 'essential' ones, this would be my shortlist:
"   * 'tpope/vim-commentary'
"   * 'tpope/vim-surround'
"   * 'tpope/vim-fugitive'
"   * 'tpope/vim-repeat'
"   * 'wellle/targets.vim'
" Other really nice minimal plugins:
"   * 'junegunn/fzf', { 'do': { -> fzf#install() } }
"   * 'junegunn/fzf.vim'
"   * 'tpope/vim-rsi'
"   * 'tommcdo/vim-lion'
"   * 'kana/vim-textobj-user'
"   * 'Julian/vim-textobj-variable-segment'

" Main input/output
" -----------------

set encoding=utf-8  " Default file encoding
set nocompatible    " Ignore Vi compatibility
syntax on           " Syntax highlighting

set noerrorbells  " Silence error sounds
set shortmess-=I  " Disable landing page message

set nrformats-=octal  " Prevent <C-a>/<C-x> from interpreting numbers as octals

" Tabs and indents
" ----------------

set autoindent   " Autoindent according to previous line
set smartindent  " Extended auto-indent behaviours

set tabstop=4      " Number of space chars for each tab char
set softtabstop=4  " Number of space chars to insert on pressing tab
set shiftwidth=4   " Number of space chars used when auto-indenting

set expandtab   " Replace tabs with spaces when using >/< operations
set shiftround  " Round to `shiftwidth` when indenting
retab           " Replace all tabs with spaces when opening document

" Searching
" ---------

set incsearch  " Jump to matches while typing
set hlsearch   " Highlight matches

set ignorecase smartcase  " Case-sensitive only with upper-case chars

" Clear highlights with <Esc><Esc>
" nnoremap <Esc><Esc> :noh<CR>
" TODO move to mappings

" Backups
" -------

set noswapfile nobackup  " Stop polluting directories with `.swp` files

set undofile  " Set persistent undo
set undodir=~/.vim/undodir

" Window display
" --------------

set splitbelow splitright  " split/vsplit opens buffers below/right

set scrolloff=8      " N lines to keep visible above/below cursor
set sidescrolloff=8  " N columns to keep visible left/right cursor

set textwidth=99   " Margin for text input
set linebreak      " Only split long lines after words
set nowrap         " Don't soft-wrap long lines

set breakindent     " Indent soft-wrapped lines
set showbreak=›››\  " Character to show on breakindent

set showmatch  " Highlight matching brackets

" Margin display
" --------------

set number relativenumber  " Show rel/abs linenumbers

set laststatus=2  " Always show status line
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)

set showcmd       " Show commands in bottom right
set cmdheight=2   " Height for Vim command mode

set wildmenu wildmode=list:longest,full         " Show tab autocomplete options as menu
set wildignore=*.pyc,**/.git/*                  " Set ignores for autocomplete
set completeopt=menu,menuone,noinsert,noselect  " Autocomplete options
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Folding
" -------

set foldenable         " Enable automatic fold creation
set foldmethod=indent  " Fold based on indent level
set foldlevel=1        " Level of folds to auto-open

" Mappings
" --------

" Toggle relative line numbers
noremap <F1> :setl relativenumber!<CR>:setl relativenumber?<CR>
" Toggle line numbers
noremap <F2> :setl number!<CR>:setl number?<CR>
" Toggle softwrap
noremap <F3> :setl wrap!<CR>:setl wrap?<CR>

" Prevent `x`/`s` from overriding clipboard
noremap x "_x
noremap X "_x
noremap s "_s
noremap S "_S

-- Open folds when flicking through search matches
['n'] = 'nzv',
['N'] = 'Nzv',

-- Make Y behave like D and C
nnoremap ['Y']  = 'y$',
-- Clear last search hl with <ESC> before <ESC> action
nnoremap ['<ESC>'] = ':noh | redraw | echon ""<CR><ESC>',

-- J doesn't move cursor
['J'] = 'mzJ`z',

-- Make {/} don't change the the jumplist
['{'] = ':<C-u>keepjumps norm! {<CR>',
['}'] = ':<C-u>keepjumps norm! }<CR>',


-- Change selected word (forward/backwards), . to repeat
['c*'] = "/\\<<C-r>=expand('<cword>')<CR>\\>\\C<CR>``cgn",
['c#'] = "?\\<<C-r>=expand('<cword>')<CR>\\>\\C<CR>``cgN",
-- Delete selected word (forward/backwards), . to repeat
['d*'] = "/\\<<C-r>=expand('<cword>')<CR>\\>\\C<CR>``dgn",
['d#'] = "?\\<<C-r>=expand('<cword>')<CR>\\>\\C<CR>``dgN",

" Visually select last pasted regions with `gp`
nnoremap gp `[v`]

" Maintain Visual mode after `>`/`<`/`=`
vmap < <gv
vmap > >gv
vmap = =gv

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

-- Stop p from overriding unnamed register in visual mode
['p'] = "pgvy",
['P'] = "Pgvy",

" Make `<C-w>`/`<C-u>` actions insert mode undoable with `u`
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

" Leader mappings
" ---------------

let mapleader = "\<Space>"

['<Leader><Tab>'] = "<C-^>",                                   -- Last file
['<Leader>q'] = ":q<CR>",                            -- Quit
['<Leader>w'] = ":w<CR>",                            -- Save
['<Leader>n'] = ":enew | echo '[New file]'<CR>",
['<Leader>N'] = ":bufdo bdel | enew | echo '[New session]'<CR>",
['<Leader>d'] = ":lcd %:p:h | echo 'Changed local dir to ' . getcwd()<CR>",
['<Leader>D'] = ":cd %:p:h | echo 'Changed dir to ' . getcwd()<CR>",

        [']c'] = ':cnext<CR>',
        ['[c'] = ':cprev<CR>',
        [']l'] = ':lnext<CR>',
        ['[l'] = ':lprev<CR>',
        ['<Leader>c'] = ":ToggleQL<CR>",               -- Toggle qflist
        ['<Leader>l'] = ":ToggleLL<CR>",               -- Toggle loclist
command! ToggleQL exec empty(filter(getwininfo(), 'v:val.quickfix')) ? "copen" : "cclose"
command! ToggleLL exec empty(filter(getwininfo(), 'v:val.loclist')) ? "lopen" : "lclose"

        ['<C-z>_'] = ":lua require('FTerm').toggle(); vim.cmd('wincmd J')<CR>",
        ['<C-z>|'] = ":lua require('FTerm').toggle(); vim.cmd('wincmd L')<CR>",

" Split and window navigation maps
" --------------------------------

-- Pane controls
['<Leader>_'] = ':split<CR>',
['<Leader>|'] = ':vsplit<CR>',
-- Window controls maps
['<C-Left>']  = ':lua require("tmux").move_left()<CR>',
['<C-Down>']  = ':lua require("tmux").move_bottom()<CR>',
['<C-Up>']    = ':lua require("tmux").move_top()<CR>',
['<C-Right>'] = ':lua require("tmux").move_right()<CR>',
['<S-Left>']  = ':lua require("tmux").resize_left(8)<CR>',
['<S-Down>']  = ':lua require("tmux").resize_bottom(8)<CR>',
['<S-Up>']    = ':lua require("tmux").resize_top(8)<CR>',
['<S-Right>'] = ':lua require("tmux").resize_right(8)<CR>',
['<Leader><Left>']  = ':wincmd H<CR>',
['<Leader><Down>']  = ':wincmd J<CR>',
['<Leader><Up>']    = ':wincmd K<CR>',
['<Leader><Right>'] = ':wincmd L<CR>',
-- Tab controls
['<Leader>.'] = ":tabnext<CR>",
['<Leader>,'] = ":tabprev<CR>",
['<Leader>>'] = ":+tabmove<CR>",
['<Leader><'] = ":-tabmove<CR>",
['<Leader>t'] = ':tabedit %<CR>',
-- Leader maps


" -----

command! TrimSpaces let g:tmp = winsaveview() | keeppatterns %s/\s\+$//e | call winrestview(g:tmp)


augroup base
    autocmd!
    " equally resize windows when terminal is resized
    autocmd VimResized * wincmd =
    " replace tabs with spaces
    autocmd BufWritePre * retab
    " autoremove whitespace
    autocmd BufWritePre * TrimSpaces
    " create nested directories if needed when creating files
    autocmd BufWritePre,FileWritePre * silent! call mkdir(expand('<afile>:p:h'), 'p')
augroup END

augroup style
    autocmd!
    " toggle cursorline and colorcolumn when entering/exiting insert mode
    autocmd InsertEnter * setl cursorline nornu cc=100,101
    autocmd InsertLeave * setl nocursorline rnu cc=
augroup END

augroup ft_extra
    autocmd!
    " Make cmdwindows close with q
    autocmd CmdwinEnter * nnoremap <buffer> q :q<CR>
    autocmd CmdwinEnter * luaeval("require('cmp').setup.buffer({enabled = false})")
    " help/cmd win/qf list: Press q to close and disable spellcheck
    autocmd FileType qf,help,fugitive nnoremap <buffer> q :q<CR>
    autocmd FileType qf,help,fugitive setlocal nospell
    autocmd FileType qf,help,fugitive setlocal colorcolumn=
    " Always open help in vertical split
    autocmd FileType help wincmd L | vert resize 90
    autocmd FileType help setl fo-=t
augroup END

cnoreabbrev vterm vert term
cnoreabbrev qqq qa!
