" =============================================================================
" == BLAKE'S VIM CONFIGURATION =================================================
" =============================================================================
" -- LOAD PLUGINS ----------------------------------------------------------{{{
" Install vim-plug if not found "{{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif
"}}}
" Load plugins {{{
call plug#begin(expand('~/.vim/plugged'))
    Plug 'jpalardy/vim-slime'  " Send text to terminal windows with C-c C-c
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'  " Fuzzy finder
    Plug 'tpope/vim-surround'  " Change brackets/quotes with cs])
    Plug 'tpope/vim-commentary'  " Add comments with gc<motion>
    Plug 'tmhedberg/SimpylFold'  " Improved indent folding
    Plug 'vim-scripts/indentpython.vim'  " Improved auto indenting
    Plug 'sheerun/vim-polyglot'  " Improved syntax highlighting
    Plug 'gruvbox-community/gruvbox'  " Colorscheme for Vim
    Plug 'Raimondi/delimitMate'  " Autocomplete brackets
    Plug 'andymass/vim-matlab'  " Correct syntax for m files
    Plug 'JuliaEditorSupport/julia-vim'  " Julia support
    Plug 'triglav/vim-visual-increment'  " Scripts for incrementing cols
    if has('nvim')
        Plug 'neovim/nvim-lspconfig'
        Plug 'nvim-lua/completion-nvim'
    else
        Plug 'vim-syntastic/syntastic'  " Check syntax on save
        Plug 'nvie/vim-flake8'  " Python PEP8 checking
        Plug 'Valloric/YouCompleteMe'  " Autocompletion engine
    endif
call plug#end() "}}}
" }}}
" == BASIC BEHAVIOUR ======================================================={{{
set encoding=utf-8
set nocompatible
syntax on
set clipboard=unnamedplus  " Use system clipboard (apt install vim-gtk3)
set splitbelow splitright  " Change split/vsplit to open windows below/right
set scrolloff=8            " Keep 4 lines above and below cursor
set noerrorbells           " Silence error sounds
set nowrap
set formatoptions="crql2p"  " Format options
"   c: Autowrap comments with textwidth
"   r: Insert comment leaders on <CR>
"   o: Insert comment leaders when pressing o
"   q: Allow formatting of comments with gq (Q)
"   l: Don't break long lines during insert mode
"   2: Use second line of paragraph for indent
"   p: Don't break lines at space after .
set completeopt=menu,menuone,noinsert,noselect  "Autocomplete options
"   menuone: Show autocomplete menu if there's only one option
"   preview: Show extra info about autocomplete options
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
" }}}
" ---- LAYOUT --------------------------------------------------------------{{{
set number relativenumber  " Show rel/abs linenumbers
set laststatus=2  " Always show status line
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)
set wildmenu wildmode=list:longest,full  " Show tab autocomplete options as menu
set showcmd                              " Show commands in bottom right
" set noshowmode                           " Hide mode status in command
set cmdheight=2                          " More room for commands
set cursorline      " Set cursorline
set colorcolumn=80  " Rule vertical margin
set fillchars+=vert:┃  " Improved vertsplit characters
set showmatch  " Highlight matching brackets
set shortmess+=F  " Hide filename from command line when opening a file
let g:netrw_bufsettings = 'number relativenumber'  " numbers in netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 0
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 25
" }}}
" ---- TABS AND INDENTS ----------------------------------------------------{{{
set autoindent smartindent
set softtabstop=4  " Indent by 4 spaces on pressing tab
set shiftwidth=4   " Indent by 4 spaces when auto-indenting
set tabstop=4      " Show 4 spaces for each tab character
set expandtab      " Replace tabs with spaces
set shiftround     " Round to shiftwidth when indenting
retab              " Replace all tabs with spaces
" }}}
" ---- SEARCHING -----------------------------------------------------------{{{
set incsearch
set ignorecase smartcase
" Clear highlights with <Esc><Esc>
nnoremap <Esc><Esc> :noh<CR>
" }}}
" ---- FOLDING -------------------------------------------------------------{{{
set foldenable
set foldmethod=indent       " Fold based on indent level
set foldlevel=1
" syn sync fromstart  " Highlight syntax from start (remove if slow)
" }}}
" ---- COLORS --------------------------------------------------------------{{{
set termguicolors
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
let g:invert_selection='0'
set background=dark
hi clear SpellBad
hi SpellBad cterm=bold,italic ctermfg=red
" }}}
" ---- BACKUPS -------------------------------------------------------------{{{
set noswapfile nobackup
set undodir=~/.vim-tmp/undodir undofile  " Set persistent undo
" }}}
" == PLUGIN OPTIONS ========================================================{{{
"}}}
" ---- VIM-SLIME -----------------------------------------------------------{{{
let g:slime_target = "vimterminal"
let g:slime_python_ipython = 1
" }}}
" ---- SIMPYLFOLD ----------------------------------------------------------{{{
let g:SimpylFold_docstring_preview=1
" }}}
" ---- YOUCOMPLETEME -------------------------------------------------------{{{
if !has('nvim')
    " auto close window
    let g:ycm_autoclose_preview_window_after_completion=1
    let g:ycm_autoclose_preview_window_after_insertion=1
    let g:ycm_key_list_select_completion=['<TAB>', '<Down>', '<Enter>']
    " go to definition shortcut <Leader>g
    map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
endif
"}}}
" ---- NVIM LSPCONFIG ------------------------------------------------------{{{
if has('nvim')
    set completeopt=menuone,noinsert,noselect
    let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

lua << EOF
local lsp = require'lspconfig'
local map = function(type, key, value)
    vim.fn.nvim_buf_set_keymap(0, type, key, value, {noremap = true, silent=true})
end
local custom_attach = function(client)
    print("Built-in LSP started")
    require'completion'.on_attach()
end
lsp.pyls.setup{on_attach=custom_attach}
EOF
endif
"}}}
" == MACROS ================================================================{{{
"}}}
" ---- COMMAND MAPPINGS ----------------------------------------------------{{{
" Common typos  "{{{
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
"}}}
" Shortcuts {{{
cnoreabbrev vterm vert term
cnoreabbrev qqq qa!
"}}}
"}}}
" ---- VIM MAPPINGS --------------------------------------------------------{{{
" Arrow : navigate window in normal/visual, disable in insert  {{{
noremap <Left> <Nop>
noremap <Down> <Nop>
noremap <Up> <Nop>
noremap <Right> <Nop>
nnoremap <Left> 4zh
nnoremap <Down> 4<C-e>
nnoremap <Up> 4<C-y>
nnoremap <Right> 4zl
vnoremap <Left> 4zh
vnoremap <Down> 4<C-e>
vnoremap <Up> 4<C-y>
vnoremap <Right> 4zl
"}}}
" Ctrl Arrow : navigate splits  {{{
noremap <C-Down> <C-w>j
noremap <C-Left> <C-w>h
noremap <C-Up> <C-w>k
noremap <C-Right> <C-w>l
tnoremap <C-Down> <C-w>j
tnoremap <C-Left> <C-w>h
tnoremap <C-Up> <C-w>k
tnoremap <C-Right> <C-w>l
"}}}
" Ctrl + Shift Arrow : move splits  {{{
noremap <C-S-Left> <C-w>H
noremap <C-S-Down> <C-w>J
noremap <C-S-Up> <C-w>K
noremap <C-S-Right> <C-w>L
tnoremap <C-S-Left> <C-w>H
tnoremap <C-S-Down> <C-w>J
tnoremap <C-S-Up> <C-w>K
tnoremap <C-S-Right> <C-w>L
"}}}
" Ctrl + Alt Arrow : resize splits  {{{
noremap <C-A-Left> <C-w>8<
noremap <C-A-Down> <C-w>8-
noremap <C-A-Up> <C-w>8+
noremap <C-A-Right> <C-w>8>
tnoremap <C-A-Left> <C-w>8<
tnoremap <C-A-Down> <C-w>8-
tnoremap <C-A-Up> <C-w>8+
tnoremap <C-A-Right> <C-w>8>
"}}}
" }}}
" ------ TERMINAL MAPPINGS -------------------------------------------------{{{
" S-Esc : Go to normal mode in terminal {{{
if has('nvim')
    tnoremap <C-Space> <C-\><C-n>
else
    tnoremap <S-Esc> <C-w><S-n>
endif
"}}}
"}}}
" ------ NORMAL MODE MAPPINGS ----------------------------------------------{{{
" Prevent x from overriding what's in the clipboard  "{{{
noremap x "_x
noremap X "_x
"}}}
" gp: Visually select last pasted block {{{
nnoremap <expr> gp '`[' . getregtype()[0] . '`]'
" }}}
" Format command Q instead of gq {{{
noremap Q gq
" }}}
"}}}
" ------ VISUAL MODE MAPPINGS ----------------------------------------------{{{
" Vmap for maintain Visual Mode after shifting > and <  {{{
vmap < <gv
vmap > >gv
"}}}
" Move visual block  "{{{
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
"}}}
"}}}
" ------ INSERT MODE MAPPINGS ----------------------------------------------{{{
" On-the-fly spellcheck corrections using Ctrl-l during insert  {{{
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
"}}}
"}}}
" ---- LEADER MAPPINGS -----------------------------------------------------{{{
let mapleader = "\<Space>"
" L-q : Quit {{{
noremap <Leader>q :q<CR>
" }}}
" L-a : Select all {{{
noremap <Leader>a ggVG
" }}}
" L-c, L-v : New splits  {{{
noremap <Leader>c :split<CR>
noremap <Leader>v :vsplit<CR>
" }}}
" L-; : Switch between last opened files {{{
noremap <Leader>; <C-^>
" }}}
" L-<CR>, L-<BS>: Resource/edit vimrc {{{
noremap <Leader><CR> :so $MYVIMRC<CR>
noremap <Leader><BS> :sp $MYVIMRC<CR>
" }}}
" L-e: Fzf files {{{
noremap <Leader>e :Files<CR>
"}}}
" L-h : toggle highlights on search {{{
noremap <Leader>h :set hls!<CR>
"}}}
"" L-l : Open quickfix list and populate with project-wide TODOs {{{
"noremap <Leader>l :vimgrep /TODO/g **/*.* <CR>:copen<CR>
""}}}
" }}}
" ------ NORMAL MODE LEADER MAPPINGS ---------------------------------------{{{
" L-s, L-w : Open search and replace command (with word under cursor) {{{
nnoremap <Leader>w :%s/<C-r><C-w>//g<Left><Left>
nnoremap <Leader>s :%s//g<Left><Left>
" }}}
"}}}
" ------ VISUAL MODE LEADER MAPPINGS ---------------------------------------{{{
" L-s : Open search and replace command {{{
vnoremap <Leader>s :s//g<Left><Left>
"}}}
"}}}
" ---- AUTOGROUPS ----------------------------------------------------------{{{
" Local options for specific filetypes {{{
augroup configgroup
    autocmd!
    autocmd BufEnter .vimrc setlocal foldmethod=marker
    autocmd BufReadPre .vimrc setlocal foldlevel=0
    autocmd BufEnter *.py setlocal foldmethod=indent
    autocmd BufEnter *.jl set formatoptions="crql2p" foldmethod=indent
    autocmd BufEnter *.txt,*.md,*.tex setlocal
        \ spell spelllang=en_au linebreak wrap
    autocmd BufEnter *.tex inoremap ` `'<Left>
augroup END
" }}}
" Only show the cursor line in the active buffer  {{{
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END
" }}}
" Auto-resize splits when Vim gets resized {{{
autocmd VimResized * wincmd =
" }}}
" Remove trailing whitespaces automatically {{{
autocmd BufWritePre * :%s/\s\+$//e
" }}}
" Speed up syntax highlighting {{{
augroup vimrc
    autocmd!
    autocmd BufWinEnter,Syntax * syn sync minlines=500 maxlines=500
augroup END
" }}}
" Ignore open terminal when quitting vim {{{
autocmd VimLeavePre * call <sid>TermForceCloseAll()
" }}}
" }}}
" ---- CUSTOM FUNCTIONS ----------------------------------------------------{{{
" Execute current script in kernel with <F5> {{{
augroup replcmdgroup
    autocmd!
    autocmd VimEnter *.jl nnoremap <F5> :call REPLcmd("julia")<CR>
    autocmd VimEnter *.sh nnoremap <F5> :call REPLcmd("bash")<CR>
    autocmd VimEnter *.py nnoremap <F5> :call REPLcmd("ipython3")<CR>
    autocmd VimEnter *.m nnoremap <F5> :call REPLcmd("matlab -nodisplay")<CR>
augroup END
function! REPLcmd(kernel)
    " Function for executing current file in a vim terminal in REPL
    "
    " If no terminal is open in Vim, command will instead open a terminal
    " buffer with the specified `kernel` command. Run command again to
    " execute current file
    " (NOTE: Untested with more than one terminal buffer)
    "
    " Use `:echo` when testing/implementing new kernels
    "
    " Conditonal to select exec command (add more commands here)
    "     a:kernel = string for command to initiate new kernel from shell
    "     b:repl_exec = string for command to execute current file in kernel
    "         See https://vim.fandom.com/wiki/Get_the_name_of_the_current_file
    "         % --> relative_dir/filename.extesion
    "         %:r --> relative_dir/filename
    let b:exec = 1
    if a:kernel == "julia"
        let b:repl_exec = join(["include(\"", @%, "\")"], "")
    elseif a:kernel == "bash"
        let b:repl_exec = join(["bash \"", @%, "\""], "")
    elseif a:kernel == "ipython3"
        let b:repl_exec = join(["exec(open(\"", @%, "\").read())"], "")
    elseif a:kernel == "matlab -nodisplay"
        let b:repl_exec = expand('%:r')
    else
        " Disable execution if input is not recognised
        let b:exec = 0
    endif
    if b:exec == 1
        try
            " Get ID of buffer
            let b:buf_id = uniq(map(filter(getwininfo(),
                \                          'v:val.terminal'),
                \               'v:val.bufnr'))[0]
            " Append <CR> and send command to term
            call term_sendkeys(b:buf_id, join([b:repl_exec, "\<CR>"]))
        catch /list index/
            exec join(["terminal", a:kernel])
            exec "sleep 200 m \| wincmd p"
            echo "REPLcmd: Kernel opened"
        catch /.*/
            echo "REPLcmd: Error in opening terminal or sending keys"
        endtry
    else
        echo join(["REPLcmd: Invalid kernel : ", a:kernel])
    endif
endfunction
" }}}
" Force close terminal buffers {{{
function! s:TermForceCloseAll() abort
    let term_bufs = filter(range(1, bufnr('$')), 'getbufvar(v:val, "&buftype") == "terminal"')
    for t in term_bufs
            execute "bd! " t
    endfor
endfunction
" }}}
" }}}
" == OLD SNIPPETS =========================================================={{{
" " -- FASTFOLD --------------------------------------------------------------{{{
" let g:fastfold_savehook = 1
" let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
" let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
" " }}}
" " -- VIMTEX ----------------------------------------------------------------{{{
" let g:tex_flavor='latex'
" let g:vimtex_view_method='zathura'
" let g:vimtex_quickfix_mode=0
" let g:vimtex_indent_enabled = 0
" set conceallevel=1
" let g:tex_conceal='abdmg'
" " }}}
"" -- VIM-LSC ---------------------------------------------------------------{{{
"let g:lsc_server_commands = {'python': 'pyls'}
"let g:lsc_auto_map = {
" \  'GoToDefinition': 'gd',
" \  'FindReferences': 'gr',
" \  'Rename': 'gR',
" \  'ShowHover': 'K',
" \  'FindCodeActions': 'ga',
" \  'Completion': 'omnifunc',
" \}
"let g:lsc_enable_autocomplete  = v:true
"let g:lsc_enable_diagnostics   = v:true
"let g:lsc_reference_highlights = v:true
"let g:lsc_trace_level          = 'off'
""}}}
"" Complete menu mappings  {{{
"" Navigate the complete menu items with <Up>/<Down>
"inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
"inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"
"" Insert selected complete menu item with <Right> or <Enter>
"inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"
"inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"
"" Cancel the complete menu item with <Left>
"inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>"
""}}}
"}}}
