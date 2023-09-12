" Bootstrap plug.vim
if empty(glob('~/.vim/autoload/plug.vim'))
  " Download plug.vim
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  " Source plug.vim so that the pluig#begin/end calls work below
  source ~/.vim/autoload/plug.vim
  " Call PlugInstall once everything is up
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin(expand('~/.vim/plugged'))

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
" The Ultimate `:Git` plugin
Plug 'https://github.com/tpope/vim-rhubarb'
Plug 'https://github.com/tpope/vim-fugitive'
" Auto-detect indent
Plug 'https://github.com/tpope/vim-sleuth'
" Easily align selection (`<ga><obj><char>`)
Plug 'https://github.com/junegunn/vim-easy-align'
" Sub-word text object (`iv`, `av`)
Plug 'https://github.com/kana/vim-textobj-user'
Plug 'https://github.com/Julian/vim-textobj-variable-segment'

"" INTERFACE
" Fzf <3 Vim TODO CwdHistory implementation
Plug 'https://github.com/junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'https://github.com/junegunn/fzf.vim'
" Personal wiki  TODO Add function to add git pages
Plug 'https://github.com/lervag/wiki.vim'
" Send lines to tmux
Plug 'https://github.com/jpalardy/vim-slime'
Plug 'https://github.com/klafyvel/vim-slime-cells'
" Show undotree (`:UndotreeToggle`)
Plug 'http://github.com/mbbill/undotree'
" Remember last place when opening file
Plug 'https://github.com/farmergreg/vim-lastplace'

"" LANGUAGES
if has('nvim')
  " Lsp configuration
  Plug 'https://github.com/neovim/nvim-lspconfig'
  " Better syntax highlighting for a bunch of langs
  Plug 'https://github.com/nvim-treesitter/nvim-treesitter'
else
  Plug 'https://github.com/dense-analysis/ale'
endif
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
Plug 'https://github.com/morhetz/gruvbox'
" Highlight word under cursor
Plug 'https://github.com/itchyny/vim-cursorword'
" Indent guides
Plug 'https://github.com/nathanaelkane/vim-indent-guides'
" Highlight yanked txt
Plug 'https://github.com/machakann/vim-highlightedyank'

call plug#end()

" TODO dispatch pytest compiler
