" =============================================================================
" == BLAKE'S NEOVIM CONFIGURATION =============================================
" =============================================================================
echo "Loading ~/.config/nvim/init.vim"
" Additional files in [plugin dir](~/.config/nvim/plugin) loaded:
" - Install scripts
"     - 00-nvim-plugin-install.lua
" - Advanced extensions
"     - 01-colors.vim
"     - 01-commands.vim
"     - 01-folds.vim
"     - 01-formatting.vim
"     - 01-punctuation-breakpoints.vim
"     - 01-spellcheck.vim
"     - 01-terminal.vim
" - Plugin configurations
"     - 02-arrow-keys.vim
"     - 02-autocomplete.vim
"     - 02-lsp.vim
"     - 02-markdown.vim
"     - 02-netrw.vim
"     - 02-startify-config.vim
" ==|CONTENTS|=================================================================
"   BASIC_BEHAVIOUR
"     BASIC_LAYOUT
"     MAPPINGS
"     LEADER_MAPPINGS
"     PLUGINS
"     LINTING
"     SPELLING
"   ADVANCED_BEHAVIOUR
"     ADVANCED_LAYOUT
"     TERMINAL
"     ABBREVIATIONS
"     ARROW_KEYS
" ==|BASIC_BEHAVIOUR|==========================================================

" Main input/output
" set clipboard=unnamedplus  " Access system clipboard
set noerrorbells           " Disable error bells
set timeoutlen=800         " More responsive keystrokes
set ttimeoutlen=10         " More responsive terminal keystrokes

" Tabs and indents
set smartindent    " Enable better indenting
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

" Text display
set splitbelow splitright          " Split to open buffers below/right
set colorcolumn=80                 " Set vertical margin
set scrolloff=8   sidescrolloff=8  " Keep lines above/below/beside cursor
set textwidth=79                   " Margin for text input
set nowrap nolinebreak             " Disable wrapping by default
set foldmethod=indent foldlevel=2  " Fold all except top indent level

" Left Margin
set number relativenumber                " Show rel/abs line numbers
set signcolumn=number                    " Sign col veils override numbers
set showmatch                            " Highlight matching brackets
set cursorline                           " Highlight current line

" Bottom margin
set showcmd cmdheight=2                  " Show command in bottom right
set shortmess+=F                         " Hide filename when opening file
set laststatus=2                         " Status line (from Mastering Vim)
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)
set wildignore+=*.pyc                    " Ignore pic files
set wildignore+=**/.git/*                " Ignore git files
set wildignore+=**/data/*                " Ignore data files

" ----|MAPPINGS|---------------------------------------------------------------

" L-c, L-v : New splits
nnoremap _ :split<CR>
nnoremap \| :vsplit<CR>

" Prevent x from overriding what's in the clipboard
noremap x "_x
noremap X "_X

" Center screen and open folds when flicking through search matches
nnoremap n nzzzv
nnoremap N Nzzzv

" Maintain Visual Mode after >/< actions
vmap < <gv
vmap > >gv
vmap ^ =gv

" Move visual block up or down
vnoremap J :m '>+1<CR>gv
vnoremap K :m '<-2<CR>gv

" Make Y behave like D and C
nmap Y y$

" Open/close quickfix list with <C-h/l>
nnoremap <C-h> :copen<CR>
nnoremap <C-l> :cclose<CR>
" Navigate quickfix list with <C-j/k>
nnoremap <C-j> :cnext<CR>zzzv
nnoremap <C-k> :cprev<CR>zzzv

" gp: Visually select last pasted block (like gv)
nnoremap <expr> gp '`[' . getregtype()[0] . '`]'

" gF: create new file at filename over cursor
nnoremap gF :e <c-r><c-f><CR>

" Navigate to front/back of line from home row
" (unique to my kb layout, $ is on K and = is on J w/ placement guide)
nnoremap = ^
nnoremap ^ =

" J doesn't move cursor
nnoremap J mzJ`z

" C-z from insert mode does undo
inoremap <C-z> <C-o>u
inoremap <A-z> <C-o><C-r>

" " Make Q be the format command
" noremap Q gq

" Backspace/Enter in normal mode for jumplist
nnoremap <Backspace> <C-o>
nnoremap <CR> <C-i>

" Better jumplist for large line steps
nnoremap <expr> k (v:count > 5 ? "m`" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m`" . v:count : "") . 'j'

" Change selected word (forward/backwards), . to repeat
nnoremap c* /\<<C-r>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap c# ?\<<C-r>=expand('<cword>')<CR>\>\C<CR>``cgN

" Delete selected word (forward/backwards), . to repeat
nnoremap d* /\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dgn
nnoremap d# ?\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dgN




" ----|LEADER_MAPPINGS|--------------------------------------------------------
let mapleader = "\<Space>"

" L-q to quit
noremap <Leader>q :q<CR>

" L-d : Change directory of vim to current file
noremap <Leader>d :cd %:p:h<CR>:pwd<CR>

" L-h,l : open/close loclist
nnoremap <Leader>h :lopen<CR>
nnoremap <Leader>l :lclose<CR>
" L-j,k : Navigate loclist
nnoremap <Leader>j :lnext<CR>
nnoremap <Leader>k :lprev<CR>

" L-y, L-p : System clipboard
nnoremap <Leader>y "+y
nnoremap <Leader>Y "+Y
vnoremap <Leader>y "+y
vnoremap <Leader>Y "+Y
nnoremap <Leader>p "+p
vnoremap <Leader>p "+p

" L-<BS> : Switch between last opened files
noremap <Leader><BS> <C-^>

" L-<CR> : Edit vimrc
noremap <Leader><CR> :sp $MYVIMRC<CR>

" L-e : File explorer
noremap <Leader>e :e %:p:h<CR>

" L-<Tab> : toggle highlights on search
noremap <Leader><Tab> :set hls!<CR>

" ----|PLUGINS|----------------------------------------------------------------
let plug_dir = has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged'
call plug#begin(plug_dir)

    " Telescope
    Plug 'nvim-lua/popup.nvim'                       "   Dep. for telescope
    Plug 'nvim-lua/plenary.nvim'                     "   Dep. for telescope
    Plug 'nvim-telescope/telescope.nvim'             " <L>tf = Fuzzy finding
    Plug 'nvim-telescope/telescope-fzy-native.nvim', "   Better fuzzy finding

    " Nvim LSP
    Plug 'neovim/nvim-lspconfig'             "   Native nvim lsp
    Plug 'kabouzeid/nvim-lspinstall'         " :LspInstall <lang>
    Plug 'hrsh7th/nvim-cmp'                  "   Autocompletion menu
    Plug 'onsails/lspkind-nvim'              "   Icons for cmp
    Plug 'hrsh7th/cmp-buffer'                "   Buffer cmp
    Plug 'hrsh7th/cmp-nvim-lsp'              "   LSP cmp
    Plug 'hrsh7th/cmp-path'                  "   Path cmp
    Plug 'hrsh7th/cmp-calc'                  "   Calc cmp
    Plug 'kdheepak/cmp-latex-symbols'        "   LaTeX Symbol cmp

    " Snippets
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
    Plug 'rafamadriz/friendly-snippets'
    " Plug 'GoldsteinE/compe-latex-symbols'    "   LaTeX symbol compe
    " Plug 'quangnguyen30192/cmp-nvim-ultisnips'  " Ultisnips

    " Writing tweaks
    Plug 'rhysd/vim-grammarous'       " :GrammarousCheck = grammar
    " Plug 'vimwiki/vimwiki'            " <L>w = Wiki mappings
    Plug 'plasticboy/vim-markdown'    "   Better markdown support
    Plug 'vim-pandoc/vim-pandoc-syntax'
    Plug 'glacambre/firenvim',        "   Nvim in browser
        \ {'do': {_ -> firenvim#install(0)}}

    " Vim functions
    Plug 'jpalardy/vim-slime'      " <C-c><C-c> = Send to terminal
    Plug 'tpope/vim-fugitive'      "   Git commands
    " Plug 'airblade/vim-gitgutter'  "   Git sign column
    Plug 'szw/vim-maximizer'       " <L-m> = Maximise/restore splits
    Plug 'junegunn/goyo.vim'       " <F7> = more hyperfocus
    Plug 'junegunn/limelight.vim'  " <F4> = hyperfocus

    " Text functions
    Plug 'tpope/vim-surround'            " cs]} = Change surrounding syntax
    Plug 'tpope/vim-repeat'              "   Fix . cmd for some plugins
    Plug 'tpope/vim-commentary'          " gc<move> = Add comments
    Plug 'junegunn/vim-easy-align'       " <V>ga*<char> = align block to char
    Plug 'triglav/vim-visual-increment'  " [<C-v>]<C-a/x> = Increment column

    " Snippets
    " Plug 'SirVer/ultisnips'              "   Snippet engine
    " Plug 'honza/vim-snippets'            "   Preconfigured snippets

    " Colors and style
    Plug 'gruvbox-community/gruvbox'  "   Colorscheme
    Plug 'unblevable/quick-scope'     "   Highlight f/t targets
    Plug 'mhinz/vim-startify'         "   Start screen for Vim

    " My plugins (dev)
    Plug '~/Workspace/local/projects/vim-simple-journal'

call plug#end()
" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | PlugUpdate! telescope-fzy-native.nvim
    \| source $MYVIMRC
    \| endif

" L-m : Toggle maximize current buffer
nnoremap <silent><Leader>m :MaximizerToggle<CR>
vnoremap <silent><Leader>m :MaximizerToggle<CR>gv

" ga : Easyalign visual selection (e.g. vipga*| to align around all | chars)
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" <F4> : Limelight
nmap <F4> :Limelight!!<CR>
vmap <F4> :Limelight!!<CR>
imap <F4> <C-o>:Limelight!!<CR>
tmap <F4> <C-\><C-n>:Limelight!!<CR>i

" L-f : Goyo
nmap <Leader>f :Goyo<CR>
vmap <Leader>f :Goyo<CR>

" L-t : Telescope
nnoremap <leader>tf <cmd>Telescope find_files<cr>
" nnoremap <leader>tg <cmd>Telescope treesitter<cr>
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <leader>th <cmd>Telescope help_tags<cr>

" let g:python3_host_prog = '/usr/bin/python3'
" augroup quickfix
"     autocmd!
"     autocmd FileType qf setlocal wrap
" augroup END

" firer vim settings
let g:firenvim_config = {
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'content': 'text',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'never',
        \ },
    \ }
    \ }
let fc = g:firenvim_config['localSettings']
let fc['https://mail.google.com'] = { 'takeover': 'always' }
augroup firenvim
    autocmd!
    autocmd BufEnter *ipynb_er-DIV*.txt set filetype=python
    autocmd BufEnter *ipynb_ontainer-DIV*.txt set filetype=markdown
augroup END
" -----------------------------------------------------------------------------
" " In case things don't work out with new rc, use this to source .vimrc
" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath=&runtimepath
" source ~/.vimrc
" -----------------------------------------------------------------------------
" " AUTOMATIC VIM-PLUG INSTALLER
" " Automatically install Vim-Plug if not installed
" let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
" if empty(glob(data_dir . '/autoload/plug.vim'))
"     silent exec join(['!curl -fLo ',
"                      \data_dir, '/autoload/plug.vim --create-dirs ',
"                      \'https://raw.githubusercontent.com/',
"                      \'junegunn/vim-plug/master/plug.vim'], '')
" endif
" -----------------------------------------------------------------------------
" " NON-NEO PLUGINS
" Plug 'vim-syntastic/syntastic'  "   Check syntax on save
" Plug 'nvie/vim-flake8'          "   Python PEP8 checking
" Plug 'Valloric/YouCompleteMe'   "   Autocompletion engine
" Plug 'dbeniamine/cheat.sh-vim'  " <L>x = cht.sh line query
" -----------------------------------------------------------------------------
" " VIM TERMINAL MAPPINGS
" " Use Alt + ; to go to normal mode
" tnoremap <A-:> <C-w><S-n>
" " Use Alt + Shift + ; to go to command mode
" tnoremap <A-:> <C-w><S-n>:
" cnoreabbrev vterm vert term
" -----------------------------------------------------------------------------
" " OLD MAPPINGS
" " Parity with prev/next cmd in bash
" cmap <C-p> <Up>
" cmap <C-n> <Down>
" " L-s, L-w : Open search and replace command (with word under cursor)
" nnoremap <Leader>w :%s/<C-r><C-w>//g<Left><Left>
" nnoremap <Leader>s :%s//g<Left><Left>
" vnoremap <Leader>s :s//g<Left><Left>
