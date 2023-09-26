" Bootstrap plug.vim
let dir = (has('nvim') ? '~/.config/nvim' : '~/.vim')
if empty(glob(dir . '/autoload/plug.vim'))
  " Download plug.vim
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  " Source plug.vim so that the pluig#begin/end calls work below
  source ~/.vim/autoload/plug.vim
  " Call PlugInstall once everything is up
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin(expand(dir . '/plugged'))

"" ACTIONS
" Sane defaults
Plug 'https://github.com/tpope/vim-sensible'
" Readline shortcuts for insert mode
Plug 'https://github.com/tpope/vim-rsi'
" Unix commands
Plug 'https://github.com/tpope/vim-eunuch'
" Better netrw
Plug 'https://github.com/tpope/vim-vinegar'
" Better dot-repeat action
Plug 'https://github.com/tpope/vim-repeat'
" Surrounding char actions (`cs<char><char>`, `ds<char>`, `ys<motion><char>`)
Plug 'https://github.com/tpope/vim-surround'
" Toggle comments (`gc<motion>`)
Plug 'https://github.com/tpope/vim-commentary'
" Extra `[`, `]` mappings
Plug 'https://github.com/tpope/vim-unimpaired'
" Asynchronous `:Make` command
Plug 'https://github.com/tpope/vim-dispatch'
" Auto-detect indent in file
Plug 'https://github.com/tpope/vim-sleuth'
" The Ultimate `:Git` plugin
Plug 'https://github.com/tpope/vim-rhubarb'
Plug 'https://github.com/tpope/vim-fugitive'
" Conflict resolution (`:Conflicted`, `dgu`/`dgl` mappings)
Plug 'https://github.com/christoomey/vim-conflicted'
" Easily align selection (`<ga><obj><char>`)
Plug 'https://github.com/junegunn/vim-easy-align'
" Sub-word text object (`iv`, `av`)
Plug 'https://github.com/kana/vim-textobj-user'
Plug 'https://github.com/Julian/vim-textobj-variable-segment'
" Open files from CLI with `vim <file>:<line:<col>` syuntax
Plug 'https://github.com/bogado/file-line'

"" INTERFACE
" Fzf <3 Vim
Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'https://github.com/junegunn/fzf.vim'
" Personal wiki
Plug 'https://github.com/lervag/wiki.vim'
Plug 'https://github.com/lervag/lists.vim'
" Send lines to tmux
Plug 'https://github.com/jpalardy/vim-slime'
Plug 'https://github.com/klafyvel/vim-slime-cells'
" Show undotree (`:UndotreeToggle`)
Plug 'http://github.com/mbbill/undotree'
" Remember last place when opening file
Plug 'https://github.com/farmergreg/vim-lastplace'
" Gitsigns in signcolumn
Plug 'https://github.com/mhinz/vim-signify'
" Tab completion
Plug 'https://github.com/ervandew/supertab'

"" LANGUAGES
Plug 'https://github.com/dense-analysis/ale'
if has('nvim')
  " Better syntax highlighting for a bunch of langs
  Plug 'https://github.com/nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
endif
Plug 'https://github.com/sheerun/vim-polyglot'
" Pytest compiler option
Plug 'https://github.com/5long/pytest-vim-compiler'

"" COMPLETION
" Autocompletion engine  TODO Configure
Plug 'https://github.com/prabirshrestha/asyncomplete.vim'
Plug 'https://github.com/prabirshrestha/asyncomplete-lsp.vim'
" Autoclose brackets
Plug 'https://github.com/Raimondi/delimitMate'

"" STYLE
" Colorscheme
Plug 'https://github.com/gruvbox-community/gruvbox'
" Highlight word under cursor
Plug 'https://github.com/itchyny/vim-cursorword'
" Indent guides
Plug 'https://github.com/nathanaelkane/vim-indent-guides'
" Highlight yanked txt
Plug 'https://github.com/machakann/vim-highlightedyank'

call plug#end()

" Setings that need to be set before running plugins
let g:ale_completion_enabled = 1
let g:ale_hover_cursor = 0

let g:indent_guides_enable_on_vim_startup = 0

let g:loaded_netrwPlugin = 1
let g:loaded_netrw = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1
let g:loaded_netrw_gitignore = 1

