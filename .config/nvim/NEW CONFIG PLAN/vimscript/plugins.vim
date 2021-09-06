" ----|INSTALL_PLUG|-------------------------------------------------------------------------
" Automatically install Vim-Plug if not installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent exec join(['!curl -fLo ',
                     \data_dir, '/autoload/plug.vim --create-dirs ',
                     \'https://raw.githubusercontent.com/',
                     \'junegunn/vim-plug/master/plug.vim'], '')
endif

" ----|LOAD_PLUGINS|-------------------------------------------------------------------------
let plug_dir = has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged'
call plug#begin(plug_dir)

    Plug 'gruvbox-community/gruvbox'  "   Colorscheme

    " Nvim LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'glepnir/lspsaga.nvim'

    " Completions
    Plug 'nvim-lua/completion-nvim'

    " Telescope
    Plug 'nvim-lua/popup.nvim'                       "   Dep. for telescope
    Plug 'nvim-lua/plenary.nvim'                     "   Dep. for telescope
    Plug 'nvim-telescope/telescope.nvim'             " <L>tf = Fuzzy finding
    Plug 'nvim-telescope/telescope-fzy-native.nvim', "   Better fuzzy finding






"
"    " Nvim LSP
"    Plug 'neovim/nvim-lspconfig'             "   Native nvim lsp
"    Plug 'kabouzeid/nvim-lspinstall'         " :LspInstall <lang>
"    Plug 'hrsh7th/nvim-cmp'                  "   Autocompletion menu
"    Plug 'onsails/lspkind-nvim'              "   Icons for cmp
"    Plug 'hrsh7th/cmp-buffer'                "   Buffer cmp
"    Plug 'hrsh7th/cmp-nvim-lsp'              "   LSP cmp
"    Plug 'hrsh7th/cmp-path'                  "   Path cmp
"    Plug 'hrsh7th/cmp-calc'                  "   Calc cmp
"    Plug 'kdheepak/cmp-latex-symbols'        "   LaTeX Symbol cmp
"
"    " Snippets
"    Plug 'hrsh7th/vim-vsnip'
"    Plug 'hrsh7th/vim-vsnip-integ'
"    Plug 'rafamadriz/friendly-snippets'
"    " Plug 'GoldsteinE/compe-latex-symbols'    "   LaTeX symbol compe
"    " Plug 'quangnguyen30192/cmp-nvim-ultisnips'  " Ultisnips
"
"    " Writing tweaks
"    Plug 'rhysd/vim-grammarous'       " :GrammarousCheck = grammar
"    " Plug 'vimwiki/vimwiki'            " <L>w = Wiki mappings
"    Plug 'plasticboy/vim-markdown'    "   Better markdown support
"    Plug 'vim-pandoc/vim-pandoc-syntax'
"    Plug 'glacambre/firenvim',        "   Nvim in browser
"        \ {'do': {_ -> firenvim#install(0)}}
"
"    " Vim functions
"    Plug 'jpalardy/vim-slime'      " <C-c><C-c> = Send to terminal
"    Plug 'tpope/vim-fugitive'      "   Git commands
"    " Plug 'airblade/vim-gitgutter'  "   Git sign column
"    Plug 'szw/vim-maximizer'       " <L-m> = Maximise/restore splits
"    Plug 'junegunn/goyo.vim'       " <F7> = more hyperfocus
"    Plug 'junegunn/limelight.vim'  " <F4> = hyperfocus
"
"    " Text functions
"    Plug 'tpope/vim-surround'            " cs]} = Change surrounding syntax
"    Plug 'tpope/vim-repeat'              "   Fix . cmd for some plugins
"    Plug 'tpope/vim-commentary'          " gc<move> = Add comments
"    Plug 'junegunn/vim-easy-align'       " <V>ga*<char> = align block to char
"    Plug 'triglav/vim-visual-increment'  " [<C-v>]<C-a/x> = Increment column
"
"    " Snippets
"    " Plug 'SirVer/ultisnips'              "   Snippet engine
"    " Plug 'honza/vim-snippets'            "   Preconfigured snippets
"
"    " Colors and style
"    Plug 'gruvbox-community/gruvbox'  "   Colorscheme
"    Plug 'unblevable/quick-scope'     "   Highlight f/t targets
"    Plug 'mhinz/vim-startify'         "   Start screen for Vim
"
"    " My plugins (dev)
"    Plug '~/Workspace/local/projects/vim-simple-journal'

call plug#end()

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | PlugUpdate! telescope-fzy-native.nvim
    \| source $MYVIMRC
    \| endif

" load lua files
luafile ~/.config/nvim/lua/lsp.lua

" ----|STARTIFY|-------------------------------------------------------------------------
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

" ----|VIM-SLIME|-------------------------------------------------------------------------
" Vim-slime options
let g:slime_target = has('nvim') ? "neovim" : "vimterminal"
let g:slime_target = has('nvim') ? "neovim" : "vimterminal"
let g:slime_python_ipython = 1

" ----|LIMELIGHT|-------------------------------------------------------------------------
" Switch off limelight when entering terminal
augroup limelight_term
    autocmd!
    autocmd TermEnter * Limelight!
augroup END

" ----|QUICKSCOPE|-------------------------------------------------------------------------
let g:qs_max_chars=800
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
function! SetQSColors()
    hi QuickScopePrimary guifg='#66b2ff' gui=underline
    hi QuickScopeSecondary guifg='#ff66b2' gui=underline
endfunction
call SetQSColors()

" ----|QUICKSCOPE|-------------------------------------------------------------------------
autocmd! User GoyoLeave nested call SetQSColors()


" -----------------------------------------------------------------------------
" " NON-NEO PLUGINS
" Plug 'vim-syntastic/syntastic'  "   Check syntax on save
" Plug 'nvie/vim-flake8'          "   Python PEP8 checking
" Plug 'Valloric/YouCompleteMe'   "   Autocompletion engine
" Plug 'dbeniamine/cheat.sh-vim'  " <L>x = cht.sh line query
