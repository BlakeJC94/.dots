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

" F-key maps:
" `<F1>` ==> Toggle relative line numbers
" `<F2>` ==> Toggle line numbers
" `<F3>` ==> Toggle softwrap
noremap <F1> :setl relativenumber!<CR>:setl relativenumber?<CR>
noremap <F2> :setl number!<CR>:setl number?<CR>
noremap <F3> :setl wrap!<CR>:setl wrap?<CR>

" Disable arrow keys (get good at `h`/`j`/`k`/`l`!)
noremap <Left>  <Nop>
noremap <Down>  <Nop>
noremap <Up>    <Nop>
noremap <Right> <Nop>

" Prevent `x`/`s` from overriding clipboard
noremap x "_x
noremap X "_x
noremap s "_s
noremap S "_S

" Open folds when flicking through search matches with `n`/`N`
noremap n nzv
noremap N Nzv

" Make `Y` behave like `D` and `C`
nnoremap Y y$

" Clear search highlights and commands on `<ESC>`
nnoremap <ESC> :noh | redraw | echon ""<CR><ESC>

" `J` doesn't move cursor
nnoremap J mzJ`z

" Make `{` and `}` not change the jumplist
nnoremap { :<C-u>keepjumps norm! {<CR>
nnoremap } :<C-u>keepjumps norm! }<CR>

" Change selected word (forward/backwards), `.` to repeat
nnoremap c* /\\<<C-r>=expand(<cword>)<CR>\\>\\C<CR>``cgn
nnoremap c# ?\\<<C-r>=expand(<cword>)<CR>\\>\\C<CR>``cgN
" Delete selected word (forward/backwards), `.` to repeat
nnoremap d* /\\<<C-r>=expand(<cword>)<CR>\\>\\C<CR>``dgn
nnoremap d# ?\\<<C-r>=expand(<cword>)<CR>\\>\\C<CR>``dgN

" Visually select last pasted regions with `gp`
nnoremap gp `[v`]

" Maintain Visual mode after `>`/`<`/`=`
vmap < <gv
vmap > >gv
vmap = =gv

" `J`/`K` ==> Move visual block up/down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Stop `p`/`P` from overriding unnamed register in visual mode
vnoremap p pgvy
vnoremap P Pgvy

" Make `<C-w>`/`<C-u>` actions insert mode undoable with `u`
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

" Leader mappings
" ---------------

" <Leader> is <Space>
let mapleader = "\<Space>"

" <Leader><Tab> ==> Last file (like alt-tab for vim)
noremap <Leader><Tab> <C-^>

" <Leader>w ==> Save
" <Leader>q ==> Quit
noremap <Leader>w :w<CR>
noremap <Leader>q :q<CR>

" <Leader>n ==> Start new file
" <Leader>N ==> Start new session (close all files)
noremap <Leader>n :enew | echo '[New file]'<CR>
noremap <Leader>N :bufdo bdel | enew | echo '[New session]'<CR>

" <Leader>d ==> Change window directory to current file directory
" <Leader>D ==> Change session directory to current file directory
noremap <Leader>d :lcd %:p:h | echo 'Changed local dir to ' . getcwd()<CR>
noremap <Leader>D :cd %:p:h | echo 'Changed dir to ' . getcwd()<CR>

" Split and window navigation maps
" --------------------------------

" Split controls
" <Leader>_ ==> New horizontal split
" <Leader>| ==> New vertical split
" <C-z>_ ==> New horizontal split terminal
" <C-z>| ==> New vertical split terminal
noremap <Leader>_ :split<CR>
noremap <Leader>| :vsplit<CR>
noremap <C-z>_ :term<CR>
noremap <C-z>| :vert term<CR>

" Window controls maps (<Leader> = <C-z> if in term window)
" <C-Arrow> ==> Move cursor to window
" <S-Arrow> ==> Resize window
" <Leader><Arrow> ==> Move current window
noremap <C-Left>  :wincmd h<CR>
noremap <C-Down>  :wincmd j<CR>
noremap <C-Up>    :wincmd k<CR>
noremap <C-Right> :wincmd l<CR>
tnoremap <C-Left>  <C-w>N:wincmd h<CR>
tnoremap <C-Down>  <C-w>N:wincmd j<CR>
tnoremap <C-Up>    <C-w>N:wincmd k<CR>
tnoremap <C-Right> <C-w>N:wincmd l<CR>
noremap <S-Left>  :vert resize -8<CR>
noremap <S-Down>  :resize -8<CR>
noremap <S-Up>    :resize 8<CR>
noremap <S-Right> :vert resize 8<CR>
tnoremap <S-Left>  <C-w>N:vert resize -8<CR>
tnoremap <S-Down>  <C-w>N:resize -8<CR>
tnoremap <S-Up>    <C-w>N:resize 8<CR>
tnoremap <S-Right> <C-w>N:vert resize 8<CR>
noremap <Leader><Left>  :wincmd H<CR>
noremap <Leader><Down>  :wincmd J<CR>
noremap <Leader><Up>    :wincmd K<CR>
noremap <Leader><Right> :wincmd L<CR>
tnoremap <C-z><Left>  <C-w>N:wincmd H<CR>
tnoremap <C-z><Down>  <C-w>N:wincmd J<CR>
tnoremap <C-z><Up>    <C-w>N:wincmd K<CR>
tnoremap <C-z><Right> <C-w>N:wincmd L<CR>

" Tab controls (<Leader> = <C-z> if in term window)
" <Leader>t ==> open new tab
" <Leader>. ==> go to next tab
" <Leader>, ==> go to previous tab
" <Leader>> ==> move tab right
" <Leader>< ==> move tab left
noremap <Leader>t :tabedit %<CR>
noremap <Leader>. :tabnext<CR>
noremap <Leader>, :tabprev<CR>
noremap <Leader>> :+tabmove<CR>
noremap <Leader>< :-tabmove<CR>
noremap <C-z>t <C-w>N:tabedit %<CR>
noremap <C-z>. <C-w>N:tabnext<CR>
noremap <C-z>, <C-w>N:tabprev<CR>
noremap <C-z>> <C-w>N:+tabmove<CR>
noremap <C-z>< <C-w>N:-tabmove<CR>

" <C-z><C-z> ==> Escape to normal mode in terminal buffer
tnoremap <C-z><Esc> <C-w>N

" <C-z><C-z> ==> Toggle terminal buffer
tnoremap <C-z><C-z> <C-w>N:hide<CR>
noremap <C-z><C-z> :unhide<CR>

" <Leader>c ==> Toggle quickfix menu
" <Leader>l ==> Toggle local quickfix menu
noremap <Leader>c :ToggleQL<CR>
noremap <Leader>l :ToggleLL<CR>

" Navigate quickfix entries
noremap ]c :cnext<CR>
noremap [c :cprev<CR>
noremap ]l :lnext<CR>
noremap [l :lprev<CR>

" Commands
" --------

command! TrimSpaces let g:tmp = winsaveview() | keeppatterns %s/\s\+$//e | call winrestview(g:tmp)
command! ToggleQL exec empty(filter(getwininfo(), 'v:val.quickfix')) ? "copen" : "cclose"
command! ToggleLL exec empty(filter(getwininfo(), 'v:val.loclist')) ? "lopen" : "lclose"

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
