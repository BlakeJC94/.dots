"" MAIN INPUT/OUTPUT
" Allows vim to use system clipboard "+ for yanks, puts, and deletes
exec 'set clipboard=unnamed' . (system('uname') =~ "Darwin" ? '' : 'plus')
set notimeout              " Allow timing out halfway into a mapping
set ttimeoutlen=10         " Length of time for timing out on keycodes
set virtualedit=block      " Cursor freedom ('all', 'block', 'insert')
set hidden                 " Allow buffers to be hidden without saving
set confirm                " Ask user about unsaved buffers instead of error
set mouse=                 " Set mouse options
set lazyredraw             " Only redraw on changes
set updatetime=100         " Faster update times
set path-=/usr/include

"" TABS AND INDENTS
set smartindent    " Enable better indenting
set tabstop=4      " Number of space chars for each tab char
set softtabstop=4  " Number of space chars to insert on pressing tab
set shiftwidth=4   " Number of space chars used when auto-indenting
set expandtab      " Replace tabs with spaces when indenting with </>

"" SEARCHING
set ignorecase " Ignore cases in search patterns
set smartcase  " Use case-sensitve search when an uppercase letter is used
set hlsearch   " Highlight matches
set incsearch  " Highlight matches while typing

"" BACKUPS AND SPELLING
set spell       " Built-in spell-checker
set noswapfile  " Allow swap files
set nobackup    " Allow creation of backup files
set undofile    " Create global undofile
exec 'set undodir=~/.' . (has('nvim') ? 'n' : '') . 'vim/undodir'

"" WINDOW DISPLAY
set shortmess+=I     " Disable into message
set shortmess-=S     " Show search matches count
set guicursor=       " Cursor
set background=dark  " Tell Vim what the background color should be
set termguicolors    " Use gui colors in the terminal
set errorformat+=%f  " Parse `find`/`fd` results in the quickfix list
set nolist
set ruler

"" LINE DISPLAY
set scrolloff=999           " N lines to keep visible above/below cursor
set sidescrolloff=8         " N columns to keep visible left/right of cursor
set textwidth=80            " Margin for text input
set showmatch               " Highlight matching brackets
set nowrap                  " Soft-wrap long lines and use breakindent opts
set linebreak               " Only split/wrap long lines after words
set breakindent             " Indent soft-wrapped lines
set breakindentopt=list:-1  " Options for breakindent
set showbreak=              " Text to print at breakindent

"" FOLDS
set fillchars=fold:\ ,eob:\ ,vert:┃
set foldmethod=indent  " Auto-create folds by indent levels
set foldlevel=0        " Close all folds when opening file
function! g:MyFoldText()
  let line = getline(v:foldstart)
  let indent_str = repeat(' ', indent(v:foldstart - 1))
  let fold_str = indent_str . line . repeat(' ', &textwidth)
  let fold_size = v:foldend - v:foldstart + 1
  let fold_size_str = ' (' . fold_size . ') '
  return fold_str[0:&textwidth - len(fold_size_str)] . fold_size_str
endfunction
set foldtext=g:MyFoldText()

"" LEFT MARGIN
set number             " Show line numbers
set norelativenumber   " Show rel/abs line numbers
set signcolumn=yes     " Set sign column

"" BOTTOM MARGIN
set completeopt=menu,menuone,noinsert,noselect  " Autocomplete options
set wildmenu
set wildmode=list:longest,full  " Show tab autocomplete options as menu
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set laststatus=2  " Show status line mode
set showcmd       " Show command in bottom right
set cmdheight=1   " Set height of command window
set wildignore+=**/.git/*,**/data/*

"" TOP MARGIN
set showtabline=1  " Display tab line (0, never, 1 auto, 2 always)


" Fix for termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Wezterm undercurl fix
let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"

" Ripgrep <3
if executable('rg')
  set grepprg=rg\ --vimgrep\ --smart-case
  set grepformat=%f:%l:%c:%m
endif

" Git status in statusline
if has_key(get(g:, 'plugs', {}), 'vim-fugitive') == 1
  set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P
endif
