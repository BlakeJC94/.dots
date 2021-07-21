" =============================================================================
" == BLAKE'S NEOVIM CONFIGURATION =============================================
" =============================================================================
" The following files located in ~/.config/nvim/plugins are also autoloaded:
"   ./plugin/plugin-setup.vim : Additional configuration for plugins
"   ./plugin/init-extra.vim : Options for view, term mode, arrow keys, augroups
echo "Loading ~/.config/nvim/init.vim"
" == BASIC BEHAVIOUR ==========================================================
set clipboard=unnamedplus              " Access system clipboard
set splitbelow splitright              " Split to open buffers below/right
set scrolloff=8 sidescrolloff=8        " Keep lines above/below/beside cursor
set noerrorbells                       " Disable error bells
set nowrap                             " Disable wrapping by default
set incsearch ic smartcase nohlsearch  " HL while typing, smartcase search
set noswapfile nobackup                " Disable swaps and backups
set undodir=~/.vim/undodir undofile    " Better local undofile location
set timeoutlen=500                     " More responsive keystrokes
set ttimeoutlen=10                     " More repsonsive terminal keystrokes
" ---- LAYOUT -----------------------------------------------------------------
set number relativenumber                " Show rel/abs linenumbers
set showmatch                            " Highlight matching brackets
set cursorline                           " Highlight current line
set colorcolumn=80                       " Set vertical margin
set textwidth=79                         " Margin for text input
set foldmethod=indent foldlevel=1        " Fold all except top indent level
set showcmd cmdheight=2                  " Show command in bottom right
set shortmess+=F                         " Hide filename when opening file
set laststatus=2                         " Status line (from Mastering Vim)
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)
set wildignore+=*.pyc                    " Ignore pyc files
set wildignore+=**/.git/*                " Ignore git files
set wildignore+=**/data/*                " Ignore data files
" ---- TABS AND INDENTS -------------------------------------------------------
set smartindent    " Enable better indenting
set tabstop=4      " Show 4 spaces for each tab char
set softtabstop=4  " Indent by 4 spaces on pressing tab
set shiftwidth=4   " Indent by 4 spaces when auto-indenting
set expandtab      " Replace tabs with spaces when indenting with </>
" ---- MAPPINGS ---------------------------------------------------------------
" Prevent x from overriding what's in the clipboard
noremap x "_x
noremap X "_x
" Paste command
inoremap <C-v><C-v> <C-o>"+p
nnoremap <C-v><C-v> "+p
vnoremap <C-v><C-v> "+p
" Center screen when flicking through search matches
nnoremap n nzz
nnoremap N Nzz
" gp: Visually select last pasted block
nnoremap <expr> gp '`[' . getregtype()[0] . '`]'
" Maintain Visual Mode after >/</= actions
vmap < <gv
vmap > >gv
vmap = =gv
" Move visual block up or down
vnoremap J :m '>+1<CR>gv=
vnoremap K :m '<-2<CR>gv=
" Navigate quickfix list
nnoremap <C-h> :copen<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
nnoremap <C-l> :cclose<CR>
" Use <Tab> and <S-Tab> to navigate through autocomplete menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Make wildmenu controls behave intuitively
cnoremap <expr> <Down>  wildmenumode() ? "\<Right>" : "\<Down>"
cnoremap <expr> <Up>    wildmenumode() ? "\<Left>"  : "\<Up>"
cnoremap <expr> <Right> wildmenumode() ? "\<Down>"  : "\<Right>"
cnoremap <expr> <Left>  wildmenumode() ? "\<Up>"    : "\<Left>"
" Use / and <Tab> to cycle through partial matches
cnoremap <expr> <Tab> getcmdtype() == "/" \|\| getcmdtype() == "?" ?
            \ "\<CR>/\<C-r>/" : "\<C-z>"
cnoremap <expr> <S-Tab> getcmdtype() == "/" \|\| getcmdtype() == "?" ?
            \ "\<CR>?\<C-r>/" : "\<S-Tab>"
" ---- LEADER MAPPINGS --------------------------------------------------------
let mapleader = "\<Space>"
" L-q to quit
noremap <Leader>q :q<CR>
" L-a : Select all
noremap <Leader>a ggVG
" L-d : Change directory of vim to current file
noremap <Leader>d :cd %:p:h<CR>:pwd<CR>
" L-c, L-v : New splits
noremap <Leader>c :split<CR>
noremap <Leader>v :vsplit<CR>
" L-; : Switch between last opened files
noremap <Leader>; <C-^>
" L-<CR>, L-<BS>: Resource/edit vimrc
noremap <Leader><CR> :so $MYVIMRC<CR>
noremap <Leader><BS> :sp $MYVIMRC<CR>
" L-e : File explorer
noremap <Leader>e :Ex %:p:h<CR>
" L-h : toggle highlights on search
noremap <Leader>h :set hls!<CR>
"" L-l : Open quickfix list and populate with project-wide TODOs
"noremap <Leader>l :vimgrep /TODO/g **/*.* <CR>:copen<CR>
" L-s, L-w : Open search and replace command (with word under cursor)
nnoremap <Leader>w :%s/<C-r><C-w>//g<Left><Left>
nnoremap <Leader>s :%s//g<Left><Left>
vnoremap <Leader>s :s//g<Left><Left>
" -- PLUGINS ------------------------------------------------------------------
" Automatically install Vim-Plug if not installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent exec join(['!curl -fLo ',
                     \data_dir, '/autoload/plug.vim --create-dirs ',
                     \'https://raw.githubusercontent.com/',
                     \'junegunn/vim-plug/master/plug.vim'], '')
endif
" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif
" Load plugins
let plug_dir = has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged'
call plug#begin(plug_dir)
    if has('nvim')
        Plug 'nvim-lua/popup.nvim'               "   Dep. for telescope
        Plug 'nvim-lua/plenary.nvim'             "   Dep. for telescope
        Plug 'nvim-telescope/telescope.nvim'     " <L>ff = Fuzzy finding
        Plug 'nvim-telescope/telescope-fzy-native.nvim' " Better fuzzy finding
            \{'do': ':!git submodule update --init --recursive'}
        Plug 'neovim/nvim-lspconfig'             "   Native nvim lsp
        Plug 'kabouzeid/nvim-lspinstall'         " :LspInstall <lang>
        Plug 'theprimeagen/vim-be-good'          " :VimBeGood
        Plug 'nvim-lua/completion-nvim'          "   Autocompletion menu
        Plug 'nvim-treesitter/nvim-treesitter',  "   Improved syntax
            \{'do': ':TSUpdate'}
    else
        Plug 'vim-syntastic/syntastic'  "   Check syntax on save
        Plug 'nvie/vim-flake8'          "   Python PEP8 checking
        Plug 'Valloric/YouCompleteMe'   "   Autocompletion engine
    endif
    Plug 'tpope/vim-surround'             " cs]} = Change surrounding syntax
    Plug 'tpope/vim-repeat'               "   Fix . cmd for plugins
    Plug 'gruvbox-community/gruvbox'      "   Colorscheme
    Plug 'unblevable/quick-scope'         "   Highlight f/t targets
    Plug 'jpalardy/vim-slime'             " <C-c><C-c> = Send to terminal
    Plug 'tpope/vim-commentary'           " gc<move> = Add comments
    Plug 'szw/vim-maximizer'              " <F3> = Maximise/restore splits
    "Plug 'tpope/vim-fugitive'             "   Git commands for Vim
    "Plug 'junegunn/gv.vim'                " :GV = Commit Browser
    Plug 'junegunn/vim-easy-align'        " ga<char> = align block
    Plug 'junegunn/limelight.vim'         " <F4> = hyperfocus
    Plug 'sbdchd/neoformat'               " Q = format code
    Plug 'airblade/vim-gitgutter'         " <F6> = Show git markers
call plug#end()
" -- PLUGIN MAPPINGS ----------------------------------------------------------
" Easyalign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" Limelight
nmap <F4> :Limelight!!<CR>
vmap <F4> :Limelight!!<CR>
imap <F4> :Limelight!!<CR>
" Telescope
if has('nvim')
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope treesitter<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
endif
" Neoformat
noremap Q :Neoformat<CR>
" Neoformat
noremap <F6> :GitGutterToggle<CR>
" -----------------------------------------------------------------------------
" " In case things don't work out with new rc, use this to source .vimrc
" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath=&runtimepath
" source ~/.vimrc
