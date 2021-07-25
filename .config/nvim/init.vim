" =============================================================================
" == BLAKE'S NEOVIM CONFIGURATION =============================================
" =============================================================================
" Contents:
" BASIC_BEHAVIOUR
" BASIC_LAYOUT
" TABS_AND_INDENTS
" MAPPINGS
" LEADER_MAPPINGS
" PLUGINS
" PLUGIN_MAPPINGS
" TERMINAL
" ADVANCED_BEHAVIOUR
" ADVANCED_LAYOUT
" AUTOCOMMANDS
" ABBREVIATIONS
" ARROW_KEYS
" =============================================================================
echo "Loading ~/.config/nvim/init.vim"
" ==|BASIC_BEHAVIOUR|==========================================================
set clipboard=unnamedplus              " Access system clipboard
set splitbelow splitright              " Split to open buffers below/right
set scrolloff=999 sidescrolloff=8      " Keep lines above/below/beside cursor
set noerrorbells                       " Disable error bells
set nowrap                             " Disable wrapping by default
set incsearch ic smartcase nohlsearch  " HL while typing, smartcase search
set noswapfile nobackup                " Disable swaps and backups
set undodir=~/.vim/undodir undofile    " Better local undofile location
set timeoutlen=500                     " More responsive keystrokes
set ttimeoutlen=10                     " More repsonsive terminal keystrokes
" ----|LAYOUT|-----------------------------------------------------------------
set number relativenumber                " Show rel/abs linenumbers
set signcolumn=number                    " Signcol vals override numbers
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
" ----|TABS_AND_INDENTS|-------------------------------------------------------
set smartindent    " Enable better indenting
set tabstop=4      " Show 4 spaces for each tab char
set softtabstop=4  " Indent by 4 spaces on pressing tab
set shiftwidth=4   " Indent by 4 spaces when auto-indenting
set expandtab      " Replace tabs with spaces when indenting with </>
" ----|MAPPINGS|---------------------------------------------------------------
" Move on visual lines
nnoremap j gj
nnoremap k gk
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
" Make Q be the format command
noremap Q gq
" Navigate quickfix list
nnoremap <C-h> :copen<CR>
nnoremap <C-j> :cnext<CR>zz
nnoremap <C-k> :cprev<CR>zz
nnoremap <C-l> :cclose<CR>
" Activate spellcheck with <F2>
nnoremap <F2> <Cmd>set spell!<CR>
inoremap <F2> <Cmd>set spell!<CR>
vnoremap <F2> <Cmd>set spell!<CR>
" gp: Visually select last pasted block
nnoremap <expr> gp '`[' . getregtype()[0] . '`]'
" Maintain Visual Mode after >/< actions
vmap < <gv
vmap > >gv
vmap = =gv
" Move visual block up or down
vnoremap J :m '>+1<CR>gv
vnoremap K :m '<-2<CR>gv
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
" Parity with prev/next cmd in bash
cmap <C-p> <Up>
cmap <C-n> <Down>
" ----|LEADER_MAPPINGS|--------------------------------------------------------
let mapleader = "\<Space>"
" L-q to quit
noremap <Leader>q :q<CR>
" L-a : Select all
noremap <Leader>a ggVG
" L-d : Change directory of vim to current file
noremap <Leader>d :cd %:p:h<CR>:pwd<CR>
" Navigate location list
nnoremap <Leader>h :lopen<CR>
nnoremap <Leader>j :lnext<CR>zz
nnoremap <Leader>k :lprev<CR>zz
nnoremap <Leader>l :lclose<CR>
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
" L-<Esc> : toggle highlights on search
noremap <Leader><Esc> :set hls!<CR>
" L-s, L-w : Open search and replace command (with word under cursor)
nnoremap <Leader>w :%s/<C-r><C-w>//g<Left><Left>
nnoremap <Leader>s :%s//g<Left><Left>
vnoremap <Leader>s :s//g<Left><Left>
" ==|PLUGINS|==================================================================
let plug_dir = has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged'
call plug#begin(plug_dir)
    if has('nvim')
        " Telescope
        Plug 'nvim-lua/popup.nvim'               "   Dep. for telescope
        Plug 'nvim-lua/plenary.nvim'             "   Dep. for telescope
        Plug 'nvim-telescope/telescope.nvim'     " <L>ff = Fuzzy finding
        Plug 'nvim-telescope/telescope-fzy-native.nvim', " Better fuzzy finding
            \ {'do': ':!git submodule update --init --recursive'}
        " Nvim LSP and TreeSitter
        Plug 'neovim/nvim-lspconfig'             "   Native nvim lsp
        Plug 'kabouzeid/nvim-lspinstall'         " :LspInstall <lang>
        Plug 'hrsh7th/nvim-compe'                "   Autocompletion menu
        Plug 'GoldsteinE/compe-latex-symbols'    "   LaTeX symbol compe
        Plug 'nvim-treesitter/nvim-treesitter',  "   Treesitter
            \ {'do': ':TSUpdate'}
        Plug 'lewis6991/spellsitter.nvim'        "   Spellcheck only comments
        " Other Nvim tweaks
        Plug 'theprimeagen/vim-be-good'          " :VimBeGood
        Plug 'RishabhRD/popfix'                  "   Dep. for nvim-cheat
        Plug 'RishabhRD/nvim-cheat.sh'           " <L>x = get cht.sh
        Plug 'glacambre/firenvim',               " Nvim in browser
            \ {'do': {_ -> firenvim#install(0)}}
    else
        " Non-neo plugins
        Plug 'vim-syntastic/syntastic'  "   Check syntax on save
        Plug 'nvie/vim-flake8'          "   Python PEP8 checking
        Plug 'Valloric/YouCompleteMe'   "   Autocompletion engine
        Plug 'dbeniamine/cheat.sh-vim'  " <L>x = cht.sh line query
    endif
    " Vim functions
    Plug 'tpope/vim-rsi'                  "  Readline/bash keybinds for i-mode
    Plug 'jpalardy/vim-slime'             " <C-c><C-c> = Send to terminal
    Plug 'tpope/vim-fugitive'             "   Git commands
    Plug 'szw/vim-maximizer'              " <L-m> = Maximise/restore splits
    Plug 'junegunn/goyo.vim'              " <F7> = more hyperfocus
    Plug 'junegunn/limelight.vim'         " <F4> = hyperfocus
    " Text functions
    Plug 'tpope/vim-surround'             " cs]} = Change surrounding syntax
    Plug 'tpope/vim-repeat'               "   Fix . cmd for plugins
    Plug 'tpope/vim-commentary'           " gc<move> = Add comments
    Plug 'junegunn/vim-easy-align'        " ga<char> = align block
    " Colors and style
    Plug 'gruvbox-community/gruvbox'      "   Colorscheme
    Plug 'unblevable/quick-scope'         "   Highlight f/t targets
call plug#end()
" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | source $MYVIMRC
    \| endif
" ----|PLUGIN_MAPPINGS|--------------------------------------------------------
" Maximizer
nnoremap <silent><Leader>m :MaximizerToggle<CR>
vnoremap <silent><Leader>m :MaximizerToggle<CR>gv
" Easyalign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
" Limelight
nmap <F4> :Limelight!!<CR>
vmap <F4> :Limelight!!<CR>
imap <F4> <C-o>:Limelight!!<CR>
if has('nvim')
    tmap <F4> <C-\><C-n>:Limelight!!<CR>i
else
    tmap <F4> <C-w><S-n>:Limelight!!<CR>i
endif
" Goyo
nmap <Leader>M :Goyo<CR>
vmap <Leader>M :Goyo<CR>
" Telescope and LSP
if has('nvim')
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope treesitter<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
    " nnoremap <leader>l <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>
endif
" Cht.sh
if has('nvim')
    nmap <Leader>x :Cheat<CR>
else
    nmap <Leader>x <Leader>KB
endif
" ==|ADVANCED_BEHAVIOUR|=======================================================

" Basic autocommands
augroup default_cmds
    autocmd!
    " equally resize windows when terminal is resized
    autocmd VimResized * wincmd =
    " replace tabs with spaces
    autocmd BufWritePre * retab
    " autoremove whitespace
    autocmd BufWritePre * :%s/\s\+$//e
    " Press q to close help/qf list and disable spellcheck
    autocmd Filetype qf,help nnoremap <buffer> q :q<CR>
    autocmd Filetype qf,help setl nospell
    " Autocomplete backticks in TeX files
    autocmd FileType tex inoremap <buffer> ` `'<C-o>h
    " Autocomplete braces in C files
    " autocmd FileType c inoremap {<CR> {<CR><CR>}<C-o>k<Tab>
    " Autoindent python structures
    autocmd FileType python setl
        \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" Set filetype-based formatprg and makrprgs here
augroup set_prgs
    autocmd!
    autocmd FileType c set formatprg=clang-format
augroup END

" Autocomplete menu options
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
set shortmess+=c  " Hide extra message when using completion

" Cht.sh options
let g:cheat_default_window_layout = 'split'

" >>>> NVIM_LUA >>>>>>>>
if has('nvim')
lua << EOF
---- LSP --------
require'lspinstall'.setup()
local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  -- require'lspconfig'[server].setup{on_attach=require'completion'.on_attach}
  require'lspconfig'[server].setup{}
end
-- Automatically reload after `:LspInstall <server>`
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

---- COMPE --------
require'compe'.setup {
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    max_abbr_width = 100;
    max_kind_width = 100;
    max_menu_width = 100;
    documentation = true;
    source = {
        path = true;
        buffer = true;
        nvim_lsp = true;
        -- spell = true;
        latex_symbols = true;
        calc = true;
    };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- This line is important for auto-import
vim.api.nvim_set_keymap('i', '<cr>', 'compe#confirm("<cr>")', { expr = true })
vim.api.nvim_set_keymap('i', '<c-space>', 'compe#complete()', { expr = true })

---- TELESCOPE --------
require('telescope').setup()
require('telescope').load_extension('fzy_native')

---- TREESITTER --------
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        -- custom_captures = {
        --   -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
        --   ["foo.bar"] = "Identifier",
        -- },
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        -- additional_vim_regex_highlighting = true,
    },
    incremental_selection = { enable = true, },
    textobjects = { enable = true, },
}

---- SPELLSITTER --------
require('spellsitter').setup {
  hl = 'SpellBad',
  captures = {'comment'},  -- set to {} to spellcheck everything
}

EOF
endif
" <<<< NVIM_LUA <<<<<<<<

" Allow LaTeX symbol completion in Markdown and Julia
autocmd FileType markdown,julia let b:compe_latex_insert_code = v:true

" Automatically list LSP errors in location list
if has('nvim')
    fun! LspLocationList()
        lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
    endfun
    augroup lsp_errors_llist
        autocmd!
        autocmd! BufWritePre,InsertLeave * :call LspLocationList()
    augroup END
endif

" ----|ADVANCED_LAYOUT|--------------------------------------------------------
" Colorscheme
set termguicolors
colorscheme gruvbox
let g:invert_selection='0'
let g:gruvbox_contrast_dark='hard'
set background=dark
" Set red bold itallics for spelling mistakes
hi clear SpellBad
hi SpellBad guifg='#cc241d' gui=bold,italic

" Quickscope options
let g:qs_max_chars=400
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
function! SetQSColors()
    hi QuickScopePrimary guifg='#66b2ff' gui=underline
    hi QuickScopeSecondary guifg='#ff66b2' gui=underline
endfunction
call SetQSColors()
" Attempt to preserve color changes on goyo
autocmd! User GoyoLeave nested call SetQSColors()

" Custom fold text
function! MyFoldText()
    let line = getline(v:foldstart)
    let foldedlinecount = v:foldend - v:foldstart + 1
    return ' >  '. foldedlinecount . '  ' . line
endfunction
set foldtext=MyFoldText()
" note: had to use a special unicode space here! (e28083)
set fillchars=fold: 
" Treesitter folding
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" Netrw options
let g:netrw_banner=0        " disable annoying banner
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" Only show sursorline on active buffer
augroup cursorline_on_active_buffer
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

" Hightlight yanks
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent!
        \ lua require'vim.highlight'.on_yank({timeout = 700})
augroup END

" ----|TERMINAL|---------------------------------------------------------------

if has('nvim')
    " Use Alt + ; to go to normal mode
    tnoremap <A-;> <C-\><C-n>
    " Use Alt + Shift + ; to go to command mode
    tnoremap <A-:> <C-\><C-n>:
    cabbrev term <C-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'split term://bash' : 'term')<CR>
    cabbrev vterm <C-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vsplit term://bash' : 'vterm')<CR>
    augroup term_cmds
        autocmd!
        " Bypass normal mode when changing focus to terminal buffer
        autocmd BufWinEnter,WinEnter term://* startinsert
        " Toggle numbers off when in terminal mode, on when in normal mode
        autocmd TermEnter term://* setlocal nonu nornu
        autocmd TermLeave term://* setlocal nu rnu
        " Immediately close terminal window when process finishes
        autocmd TermClose term://* quit
    augroup END
else
    " Use Alt + ; to go to normal mode
    tnoremap <A-:> <C-w><S-n>
    " Use Alt + Shift + ; to go to command mode
    tnoremap <A-:> <C-w><S-n>:
    cnoreabbrev vterm vert term
endif

" Vim-slime options
let g:slime_target = has('nvim') ? "neovim" : "vimterminal"
let g:slime_python_ipython = 1

" Switch off limelight when entering terminal
augroup limelight_term
    autocmd!
    autocmd TermEnter * Limelight!
augroup END

" ----|ABBREVIATIONS|----------------------------------------------------------
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
cnoreabbrev vterm vert term
cnoreabbrev fd %:p:h
" ----|ARROW_KEYS|----------------------------------------------------------
" [Arrow] : navigate window in normal/visual, disable in insert
inoremap <expr>  <Left>  pumvisible() ? "\<C-e>" : ""
inoremap <expr>  <Down>  pumvisible() ? "\<C-n>" : ""
inoremap <expr>  <Up>    pumvisible() ? "\<C-p>" : ""
inoremap <expr>  <Right> pumvisible() ? "\<C-y>" : ""
nnoremap <Left>  4zh
nnoremap <Down>  4<C-e>
nnoremap <Up>    4<C-y>
nnoremap <Right> 4zl
vnoremap <Left>  4zh
vnoremap <Down>  4<C-e>
vnoremap <Up>    4<C-y>
vnoremap <Right> 4zl
" [Ctrl + Arrow] to navigate windows
if has('nvim')
    tnoremap <C-Left>  <C-\><C-N><C-w>h
    tnoremap <C-Down>  <C-\><C-N><C-w>j
    tnoremap <C-Up>    <C-\><C-N><C-w>k
    tnoremap <C-Right> <C-\><C-N><C-w>l
    inoremap <C-Left>  <C-\><C-N><C-w>h
    inoremap <C-Down>  <C-\><C-N><C-w>j
    inoremap <C-Up>    <C-\><C-N><C-w>k
    inoremap <C-Right> <C-\><C-N><C-w>l
else
    tnoremap <C-Left>  <C-w>h
    tnoremap <C-Down>  <C-w>j
    tnoremap <C-Up>    <C-w>k
    tnoremap <C-Right> <C-w>l
    inoremap <C-Left>  <C-w>h
    inoremap <C-Down>  <C-w>j
    inoremap <C-Up>    <C-w>k
    inoremap <C-Right> <C-w>l
endif
nnoremap <C-Left>  <C-w>h
nnoremap <C-Down>  <C-w>j
nnoremap <C-Up>    <C-w>k
nnoremap <C-Right> <C-w>l
vnoremap <C-Left>  <C-w>h
vnoremap <C-Down>  <C-w>j
vnoremap <C-Up>    <C-w>k
vnoremap <C-Right> <C-w>l
" [Ctrl + Shift + Arrow] Move splits
if has('nvim')
    tnoremap <C-S-Left>  <C-\><C-N><C-w>H
    tnoremap <C-S-Down>  <C-\><C-N><C-w>J
    tnoremap <C-S-Up>    <C-\><C-N><C-w>K
    tnoremap <C-S-Right> <C-\><C-N><C-w>L
    inoremap <C-S-Left>  <C-\><C-N><C-w>H
    inoremap <C-S-Down>  <C-\><C-N><C-w>J
    inoremap <C-S-Up>    <C-\><C-N><C-w>K
    inoremap <C-S-Right> <C-\><C-N><C-w>L
else
    tnoremap <C-S-Left>  <C-w>H
    tnoremap <C-S-Down>  <C-w>J
    tnoremap <C-S-Up>    <C-w>K
    tnoremap <C-S-Right> <C-w>L
    inoremap <C-S-Left>  <C-w>H
    inoremap <C-S-Down>  <C-w>J
    inoremap <C-S-Up>    <C-w>K
    inoremap <C-S-Right> <C-w>L
endif
nnoremap <C-S-Left>  <C-w>H
nnoremap <C-S-Down>  <C-w>J
nnoremap <C-S-Up>    <C-w>K
nnoremap <C-S-Right> <C-w>L
vnoremap <C-S-Left>  <C-w>H
vnoremap <C-S-Down>  <C-w>J
vnoremap <C-S-Up>    <C-w>K
vnoremap <C-S-Right> <C-w>L
" [Ctrl + Alt + Arrow] : resize splits
if has('nvim')
    tnoremap <C-A-Left>  <C-\><C-N><C-w>8<
    tnoremap <C-A-Down>  <C-\><C-N><C-w>8-
    tnoremap <C-A-Up>    <C-\><C-N><C-w>8+
    tnoremap <C-A-Right> <C-\><C-N><C-w>8>
    inoremap <C-A-Left>  <C-\><C-N><C-w>8<
    inoremap <C-A-Down>  <C-\><C-N><C-w>8-
    inoremap <C-A-Up>    <C-\><C-N><C-w>8+
    inoremap <C-A-Right> <C-\><C-N><C-w>8>
else
    tnoremap <C-A-Left>  <C-w>8<
    tnoremap <C-A-Down>  <C-w>8-
    tnoremap <C-A-Up>    <C-w>8+
    tnoremap <C-A-Right> <C-w>8>
    inoremap <C-A-Left>  <C-w>8<
    inoremap <C-A-Down>  <C-w>8-
    inoremap <C-A-Up>    <C-w>8+
    inoremap <C-A-Right> <C-w>8>
endif
nnoremap <C-A-Left>  <C-w>8<
nnoremap <C-A-Down>  <C-w>8-
nnoremap <C-A-Up>    <C-w>8+
nnoremap <C-A-Right> <C-w>8>
vnoremap <C-A-Left>  <C-w>8<
vnoremap <C-A-Down>  <C-w>8-
vnoremap <C-A-Up>    <C-w>8+
vnoremap <C-A-Right> <C-w>8>
" -----------------------------------------------------------------------------
" " In case things don't work out with new rc, use this to source .vimrc
" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath=&runtimepath
" source ~/.vimrc
" -----------------------------------------------------------------------------
" Removed automatic Vim-Plug installer
" " Automatically install Vim-Plug if not installed
" let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
" if empty(glob(data_dir . '/autoload/plug.vim'))
"     silent exec join(['!curl -fLo ',
"                      \data_dir, '/autoload/plug.vim --create-dirs ',
"                      \'https://raw.githubusercontent.com/',
"                      \'junegunn/vim-plug/master/plug.vim'], '')
" endif
