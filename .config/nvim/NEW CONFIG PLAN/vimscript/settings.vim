" " ==|BASIC_BEHAVIOUR|==========================================================

" " Main input/output
" set clipboard=unnamedplus  " Access system clipboard
" set ttimeoutlen=10         " More responsive terminal keystrokes

" " Tabs and indents
" set smartindent    " Enable better indenting
set tabstop=4      " Show 4 spaces for each tab char
set softtabstop=4  " Indent by 4 spaces on pressing tab
set shiftwidth=4   " Indent by 4 spaces when auto-indenting
set expandtab      " Replace tabs with spaces when indenting with </>

" Searching
set incsearch ic smartcase nohlsearch  " HL while typing, smartcase search

" Backups and undos
set noswapfile nobackup                " Disable swaps and backups
set undodir=~/.vim/undodir undofile    " Better local undofile location

" ----|BASIC_LAYOUT|-----------------------------------------------------------

" Window display
set splitbelow splitright          " Split to open buffers below/right
set colorcolumn=80                 " Set vertical margin
set scrolloff=8   sidescrolloff=8  " Keep lines above/below/beside cursor

" Line display
set textwidth=79                   " Margin for text input
set nowrap nolinebreak             " Disable wrapping by default
set showmatch                            " Highlight matching brackets
set cursorline                           " Highlight current line

" Folds
set foldmethod=indent foldlevel=2  " Fold all except top indent level
set foldtext=MyFoldText()
set fillchars=fold: 

" Left Margin
set number relativenumber                " Show rel/abs line numbers
set signcolumn=number                    " Sign col veils override numbers

" Bottom margin
set showcmd cmdheight=2                  " Show command in bottom right
set shortmess+=F                         " Hide filename when opening file
set laststatus=2                         " Status line (from Mastering Vim)
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)
set wildignore+=*.pyc                    " Ignore pic files
set wildignore+=**/.git/*                " Ignore git files
set wildignore+=**/data/*                " Ignore data files

" Colorscheme
set termguicolors
set background=dark
let g:gruvbox_italic=1
let g:gruvbox_italicize_strings= 1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_guisp_fallback='bg'
colorscheme gruvbox

" Netrw
let g:netrw_banner=0
let g:netrw_liststyle=0
let g:netrw_list_hide=".*\.swp$,.DS_Store,*.so,*.zip,*.git,^\.\=/\=$"


