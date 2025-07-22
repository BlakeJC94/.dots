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

" Settings that need to be set before running plugins
let g:ale_disable_lsp = 1
let g:ale_completion_enabled = 1
let g:ale_hover_cursor = 0
let g:polyglot_disabled = ['markdown']

" Load plugins
call plug#begin(expand(dir . '/plugged'))

" TODO learn more about vim-dispatch
"" ENHANCEMENTS
Plug 'https://github.com/tpope/vim-sensible'    " Sane defaults
Plug 'https://github.com/tpope/vim-rsi'         " Readline shortcuts for insert mode
Plug 'https://github.com/tpope/vim-eunuch'      " Unix commands
Plug 'https://github.com/tpope/vim-repeat'      " Better dot-repeat action
Plug 'https://github.com/tpope/vim-surround'    " Surrounds (`cs<ch><ch>`, `ys<motion><char>`) <>
Plug 'https://github.com/tpope/vim-commentary'  " Toggle comments (`gc<motion>`) <>
Plug 'https://github.com/tpope/vim-unimpaired'  " Extra `[`, `]` mappings
Plug 'https://github.com/tpope/vim-dispatch'    " Asynchronous `:Make` command
Plug 'https://github.com/tpope/vim-sleuth'      " Auto-detect indent in file
Plug 'https://github.com/tpope/vim-fugitive'    " Fugitive: The Ultimate `:Git` plugin (`<leader>c`) <>
Plug 'https://github.com/tpope/vim-rhubarb'     " GitHub integration for `:GBrowse` (`<leader>b`)

"" ACTIONS
" Highlight and resolve git conflicts (`co`/`ct`) <>
Plug 'https://github.com/rhysd/conflict-marker.vim'
" Sub-word text object (`iv`, `av`)
Plug 'https://github.com/kana/vim-textobj-user'
Plug 'https://github.com/Julian/vim-textobj-variable-segment'
" Easily align selection with `tabular` (`:Tabularize /<char>`) <>
Plug 'https://github.com/godlygeek/tabular'

"" INTERFACE
" Fzf <3 Vim
Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'https://github.com/junegunn/fzf.vim'
" Better filesystem navigation
Plug 'https://github.com/justinmk/vim-dirvish'
Plug 'https://github.com/bounceme/remote-viewer'
" Popup hunk diffs with `<Leader>C` <>
Plug 'https://github.com/mhinz/vim-signify'
" Use <CR> in the commit window for conventional commits <>
Plug 'https://github.com/BlakeJC94/vim-convict'
" Show commit hist with `:GV`, show current file history with `:GV!` <>
Plug 'https://github.com/junegunn/gv.vim'
" Remember vim config with reminders
Plug 'https://github.com/BlakeJC94/vim-sage'
" Show undotree (`:UndotreeToggle` or `<Leader>u`) <>
Plug 'https://github.com/mbbill/undotree'
" Disable highlighting after search automatically
Plug 'https://github.com/romainl/vim-cool'

"" COMPLETION
" Autocomplete
Plug 'https://github.com/prabirshrestha/asyncomplete.vim'
Plug 'https://github.com/prabirshrestha/asyncomplete-lsp.vim'
Plug 'https://github.com/prabirshrestha/asyncomplete-buffer.vim', {'commit': 'b8f00ea'}
Plug 'https://github.com/prabirshrestha/asyncomplete-file.vim'
Plug 'https://github.com/prabirshrestha/asyncomplete-emoji.vim'
Plug 'https://github.com/machakann/asyncomplete-unicodesymbol.vim'
" Tab completion
Plug 'https://github.com/ervandew/supertab'
" Auto-close brackets
Plug 'https://github.com/Raimondi/delimitMate'

"" LANGUAGES
" Lsp servers
Plug 'https://github.com/prabirshrestha/vim-lsp'
Plug 'https://github.com/machakann/vim-lsp-julia'
" Fixers and linters
Plug 'https://github.com/dense-analysis/ale'
" Syntax files
Plug 'https://github.com/sheerun/vim-polyglot'

"" STYLE
" Colorscheme
Plug 'https://github.com/gruvbox-community/gruvbox'
" Highlight yanked txt
Plug 'https://github.com/machakann/vim-highlightedyank'

call plug#end()
