" =============================================================================
" == BLAKE'S NEOVIM CONFIGURATION =============================================
" =============================================================================
echo "Loading ~/.config/nvim/init.vim"
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
"     NVIM_LUA
"     TERMINAL
"     ABBREVIATIONS
"     ARROW_KEYS
" ==|BASIC_BEHAVIOUR|==========================================================

" Main input/output
set clipboard=unnamedplus  " Access system clipboard
set virtualedit=all        " Allow cursor to move past last character
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

" Prevent x from overriding what's in the clipboard
noremap x "_x
noremap X "_x

" Center screen and open folds when flicking through search matches
nnoremap n nzzzv
nnoremap N Nzzzv

" Maintain Visual Mode after >/< actions
vmap < <gv
vmap > >gv
vmap = =gv

" Move visual block up or down
vnoremap J :m '>+1<CR>gv
vnoremap K :m '<-2<CR>gv

" Make Y behave like D and C
nnoremap Y y$

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
nnoremap H ^
nnoremap L $

" J doesn't move cursor
nnoremap J mzJ`z

" Make Q be the format command
noremap Q gq

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

" Use <Tab> and <S-Tab> to navigate through autocomplete menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Make vertical wildmenu controls behave intuitively
if match(&wildmode, 'full') > -1
    cnoremap <expr> <Down>  wildmenumode() ? "\<Right>" : "\<Down>"
    cnoremap <expr> <Up>    wildmenumode() ? "\<Left>"  : "\<Up>"
    cnoremap <expr> <Right> wildmenumode() ? "\<Down>"  : "\<Right>"
    cnoremap <expr> <Left>  wildmenumode() ? "\<Up>"    : "\<Left>"
endif

" Use / and <Tab> to cycle through partial matches
cnoremap <expr> <Tab> getcmdtype() == "/" \|\| getcmdtype() == "?" ?
            \ "\<CR>/\<C-r>/" : "\<C-z>"
cnoremap <expr> <S-Tab> getcmdtype() == "/" \|\| getcmdtype() == "?" ?
            \ "\<CR>?\<C-r>/" : "\<S-Tab>"

" ----|LEADER_MAPPINGS|--------------------------------------------------------
let mapleader = "\<Space>"

" L-q to quit
noremap <Leader>q :q<CR>

" L-d : Change directory of vim to current file
noremap <Leader>d :cd %:p:h<CR>:pwd<CR>

" L-c, L-v : New splits
noremap <Leader>c :split<CR>
noremap <Leader>v :vsplit<CR>

" L-<BS> : Switch between last opened files
noremap <Leader><BS> <C-^>

" L-<CR> : Edit vimrc
noremap <Leader><CR> :sp $MYVIMRC<CR>

" L-e : File explorer
noremap <Leader>e :e %:p:h<CR>

" L-<Tab> : toggle highlights on search
noremap <Leader><Tab> :set hls!<CR>

" L-<Esc>: open notes index
nnoremap <silent> <Leader><Esc> :cd ~/Dropbox/Journals<CR>:!./update_index.sh<CR>:w<CR>:e index.md<CR>

" ----|PLUGINS|----------------------------------------------------------------
let plug_dir = has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged'
call plug#begin(plug_dir)

    " Telescope
    Plug 'nvim-lua/popup.nvim'                       "   Dep. for telescope
    Plug 'nvim-lua/plenary.nvim'                     "   Dep. for telescope
    Plug 'nvim-telescope/telescope.nvim'             " <L>tf = Fuzzy finding
    Plug 'nvim-telescope/telescope-fzy-native.nvim', " Better fuzzy finding

    " Nvim LSP
    Plug 'neovim/nvim-lspconfig'             "   Native nvim lsp
    Plug 'kabouzeid/nvim-lspinstall'         " :LspInstall <lang>
    Plug 'hrsh7th/nvim-compe'                "   Autocompletion menu
    Plug 'GoldsteinE/compe-latex-symbols'    "   LaTeX symbol compe

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
    Plug 'SirVer/ultisnips'              "   Snippet engine
    Plug 'honza/vim-snippets'            "   Preconfigured snippets

    " Colors and style
    Plug 'gruvbox-community/gruvbox'  "   Colorscheme
    Plug 'unblevable/quick-scope'     "   Highlight f/t targets
    Plug 'mhinz/vim-startify'         "   Start screen for Vim

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

" L-h/l : Open/close location list with LSP errors
nnoremap <Leader>h :lua vim.lsp.diagnostic.set_loclist({open_loclist = true})<CR>
nnoremap <Leader>l :lclose<CR>
" L-j,k : Navigate errors that automatically show in location list
nnoremap <Leader>j :lua vim.lsp.diagnostic.set_loclist({open_loclist = false})<CR>:lnext<CR>:lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <Leader>k :lua vim.lsp.diagnostic.set_loclist({open_loclist = false})<CR>:lprev<CR>:lua vim.lsp.diagnostic.show_line_diagnostics()<CR>

" Automatically list LSP errors in location list
augroup lsp_errors_llist
    autocmd!
    autocmd! BufWritePre,InsertLeave * :lua vim.lsp.diagnostic.set_loclist({open_loclist = false})
augroup END

" ----|SPELLING|---------------------------------------------------------------
set spell  " Enable spellcheck by default

" C-s : Quickly correct spelling errors (undoable)
inoremap <C-s> <C-g>u<Esc>[S1z=`]a<c-g>u
nnoremap <C-s> m`i<C-g>u<Esc>[S1z=i<C-g>u<Esc>``

" C-q : Add word to spellfile (occupies mark q)
inoremap <C-q> <Esc>[Smqzg`]a
nnoremap <C-q> m`[Smqzg``
" C-z : Undo last add word to spellfile
inoremap <expr> <C-z> (CheckqMark() == 1 ? "\<Esc>`qzw`]:delm q\<CR>a" : "\<C-z>")
nnoremap <expr> <C-z> (CheckqMark() == 1 ? "m``qzw\<C-o>:delm q\<CR>" : "")
" helper function for removing recently added word to spellfile
function! CheckqMark()
    try | marks q | return 1 | catch | return 0 | endtry
endfunction

" L-. Toggle spellcheck
nnoremap <Leader>. :set spell!<CR>
" L-;, L-, : Jump between spelling mistakes
nnoremap <Leader>; ]s
nnoremap <Leader>, [s

" L-S-. : Activate grammar check
nnoremap <Leader>> :GrammarousCheck<CR>
" L-S-;, L-S-, : Navigate grammar errors after activating grammar checker
let g:grammarous#hooks = {}
function! g:grammarous#hooks.on_check(errs) abort
    nmap <buffer> <Leader>: <Plug>(grammarous-move-to-next-error)
    nmap <buffer> <Leader>< <Plug>(grammarous-move-to-previous-error)
    nnoremap <Leader>> <Plug>(grammarous-fixit)
endfunction
function! g:grammarous#hooks.on_reset(errs) abort
    nunmap <buffer> <Leader>:
    nunmap <buffer> <Leader><
    nnoremap <Leader>> :GrammarousCheck<CR>
endfunction
" disable some rules
let g:grammarous#disabled_rules = {
    \ '*' : ['DASH_RULE', 'WHITESPACE_RULE', 'EN_QUOTES'],
    \ }

" ==|ADVANCED_BEHAVIOUR|=======================================================

" Set default autocmds here
augroup default_cmds
    autocmd!
    " equally resize windows when terminal is resized
    autocmd VimResized * wincmd =
    " replace tabs with spaces
    autocmd BufWritePre * retab
    " autoremove whitespace
    autocmd BufWritePre * %s/\s\+$//e
    " help/cmd win/qf list: Press q to close and disable spellcheck
    autocmd Filetype qf,help nnoremap <buffer> q :q<CR>
    autocmd Filetype qf,help setl nospell
    autocmd CmdwinEnter * nnoremap <buffer> q :q<CR>
    " Autocomplete braces in C files
    " autocmd FileType c inoremap {<CR> {<CR><CR>}<C-o>k<Tab>
    " Autoindent python structures
    autocmd FileType python setl
        \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" Set filetype-based formatprg and makeprgs here
augroup set_prgs
    autocmd!
    autocmd FileType c set formatprg=clang-format
    autocmd FileType Markdown set makeprg=pandoc\ %:p\ -o\ %:p:h/out.pdf
augroup END

let g:markdown_fenced_langages = ['python']

" Set options for editing text here
function TextEditOpts()
    setlocal wrap
    setlocal linebreak
    " setlocal breakindent
    setlocal showbreak=>\ >\  breakindent
    setlocal breakindentopt=sbr
    setlocal colorcolumn=0
    setlocal list
    nnoremap <expr> k (v:count > 5 ? "m`" . v:count : "") . 'gk'
    nnoremap <expr> j (v:count > 5 ? "m`" . v:count : "") . 'gj'
endfunction
augroup text_edit
    autocmd!
    autocmd FileType markdown,text,tex call TextEditOpts()
    autocmd FileType tex inoremap <buffer> ` `'<C-o>h
augroup END

" Autocomplete menu options
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
set shortmess+=c  " Hide extra message when using completion

" Auto-update sessions from startify
let g:startify_session_persistence = 1

" Allow LaTeX symbol completion in Markdown and Julia
autocmd! FileType markdown,julia let b:compe_latex_insert_code = v:true

" Firenvim options
if exists('g:started_by_firenvim')
    set wrap linebreak colorcolumn=0 breakindent
endif

" Ultisnips
let g:UltiSnipsExpandTrigger="<c-tab>"  " select from compe w/ <CR>
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" vim-markdown options
let g:vim_markdown_folding_disabled = 1
" disable header folding
let g:vim_markdown_folding_disabled = 1
" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0
" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1
" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc conceallevel=0
augroup END

" " vim wiki options
" let g:vimwiki_list = [{'path': '~/Dropbox/Journals/',
"                       \'syntax': 'markdown', 'ext': '.md'}]
" let g:vimwiki_hl_headers = 0
" " let g:vimwiki_key_mappings =
" "     \ {
" "     \   'all_maps': 1,
" "     \   'global': 1,
" "     \   'headers': 0,
" "     \   'text_objs': 1,
" "     \   'table_format': 0,
" "     \   'table_mappings': 1,
" "     \   'lists': 0,
" "     \   'links': 1,
" "     \   'html': 1,
" "     \   'mouse': 0,
" "     \ }


" Insert undo breakpoints when typing punctuation
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap ( (<C-g>u
inoremap ) )<C-g>u
inoremap [ [<C-g>u
inoremap ] ]<C-g>u
inoremap { {<C-g>u
inoremap } }<C-g>u
inoremap < <<C-g>u
inoremap > ><C-g>u
inoremap ' '<C-g>u
inoremap " "<C-g>u
inoremap ` `<C-g>u

" Set formatting options
function SetFormatOpts()
    setl fo-=t  " Auto-hardwrap text at textwidth
    setl fo+=c  " Auto-hardwrap comments at textwidth
    setl fo+=r  " Insert comment leaders on `CR` during insert mode
    setl fo-=o  " Insert comment leaders on `o` during normal mode
    setl fo+=q  " Allow comments formatting with gq (Q)
    setl fo-=w  " Lines that end without whitespace ends paragraph obj
    setl fo-=a  " Automatic formatting of paragraphs (only comments if fo+=c)
    setl fo-=n  " Recognise numbered lists (compat issue w fo+=2)
    setl fo+=2  " Use second line for par auto-indent
    setl fo-=v  " Vi-style wrap (auto-hardwrap at soft wrap level, buggy)
    setl fo-=b  " Vi-style wrap without breaking words
    setl fo-=l  " Don't break long lines during insert mode
    setl fo-=m  " Break at multibyte chars as well
    setl fo-=M  " Don't insert space before or after mutibyte char when joining
    setl fo-=B  " Don't insert space between mutibyte char when joining
    setl fo-=1  " Break lines before 1 letter words if possible
    setl fo-=]  " Rigorously enforce textwidth
    setl fo+=j  " Remove comment leaders when joining lines
    setl fo+=p  " Don't break lines at space after .
endfunction
autocmd! FileType * call SetFormatOpts()

" ----|ADVANCED_LAYOUT|--------------------------------------------------------

" Colorscheme
set termguicolors
set background=dark
let g:invert_selection='0'
let g:gruvbox_contrast_dark='hard'
augroup fix_syntax_backgrounds
    autocmd!
    autocmd Colorscheme * hi Normal guibg='#1d2021' ctermbg=NONE
    autocmd Colorscheme * hi Normal guibg='#1d2021' ctermbg=NONE
    autocmd Colorscheme * hi GrammarousError gui=undercurl guisp='#98971a'
    autocmd Colorscheme * hi markdownItalic gui=italic
    autocmd Colorscheme * hi markdownBoldItalic gui=bold,italic
augroup END
colorscheme gruvbox

" Quickscope options
let g:qs_max_chars=800
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

" Netrw options
let g:netrw_banner=0        " disable annoying banner
let g:netrw_liststyle=0     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide= '.*\.swp$,.DS_Store,*.so,*.zip,*.git,^\.\=/\=$'

" Startify options
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

" Only show cursorline on active buffer
augroup cursorline_on_active_buffer
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter,Focusgained * setlocal cursorline
    autocmd WinLeave,FocusLost * setlocal nocursorline
    autocmd VimEnter,WinEnter,BufWinEnter,Focusgained term://* setl nocursorline
augroup END

" Hightlight yanks
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent!
        \ lua require'vim.highlight'.on_yank({timeout = 700})
augroup END

" ----|NVIM_LUA|---------------------------------------------------------------
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
        ultisnips = true;
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
-- Snippet engine integration
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
        }
    }
local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  -- require'lspconfig'[server].setup{on_attach=require'completion'.on_attach}
  require'lspconfig'[server].setup{capabilities = capabilities}
end
---- TELESCOPE --------
require('telescope').setup()
require('telescope').load_extension('fzy_native')
-- ---- TREESITTER --------
-- require'nvim-treesitter.configs'.setup {
--     highlight = {
--         enable = true,
--         -- custom_captures = {
--         --   -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
--         --   ["foo.bar"] = "Identifier",
--         -- },
--         -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
--         -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
--         -- Using this option may slow down your editor, and you may see some duplicate highlights.
--         -- Instead of true it can also be a list of languages
--         -- additional_vim_regex_highlighting = true,
--     },
--     incremental_selection = { enable = true, },
--     textobjects = { enable = true, },
-- }
-- ---- SPELLSITTER --------
-- require('spellsitter').setup {
--   hl = 'SpellBad',
--   captures = {'comment'},  -- set to {} to spellcheck everything
-- }
EOF

" ----|TERMINAL|---------------------------------------------------------------

" Alt + ;/: = go to normal/command mode
tnoremap <A-;> <C-\><C-n>
tnoremap <A-:> <C-\><C-n>:

" terminal command shortcuts
cabbrev term <C-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'split term://bash' : 'term')<CR>
cabbrev vterm <C-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'vsplit term://bash' : 'vterm')<CR>

" terminal autocmds
augroup term_cmds
    autocmd!
    " Bypass normal mode when changing focus to terminal buffer
    autocmd BufWinEnter,WinEnter term://* startinsert
    " Disable numbers and spelling in terminals
    autocmd TermOpen term://* setlocal nonu nornu nospell
    " Immediately close terminal window when process finishes
    autocmd TermClose term://* quit
augroup END

" Vim-slime options
let g:slime_target = has('nvim') ? "neovim" : "vimterminal"
let g:slime_target = has('nvim') ? "neovim" : "vimterminal"
let g:slime_python_ipython = 1

" Switch off limelight when entering terminal
augroup limelight_term
    autocmd!
    autocmd TermEnter * Limelight!
augroup END

" ----|ABBREVIATIONS|----------------------------------------------------------

" File directory
cnoreabbrev fd %:p:h

" Force sudo save
cnoreabbrev w!! <C-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'w sudo tee > /dev/null %<CR>' : 'w!!')

" Typos
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

" ----|ARROW_KEYS|-------------------------------------------------------------

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

" [Ctrl + Arrow] to navigate windows (drop <C-\><C-n> if using vim)
tnoremap <C-Left>  <C-\><C-n><C-w>h
tnoremap <C-Down>  <C-\><C-n><C-w>j
tnoremap <C-Up>    <C-\><C-n><C-w>k
tnoremap <C-Right> <C-\><C-n><C-w>l
inoremap <C-Left>  <C-w>h
inoremap <C-Down>  <C-w>j
inoremap <C-Up>    <C-w>k
inoremap <C-Right> <C-w>l
nnoremap <C-Left>  <C-w>h
nnoremap <C-Down>  <C-w>j
nnoremap <C-Up>    <C-w>k
nnoremap <C-Right> <C-w>l
vnoremap <C-Left>  <C-w>h
vnoremap <C-Down>  <C-w>j
vnoremap <C-Up>    <C-w>k
vnoremap <C-Right> <C-w>l

" [Alt + Arrow] Move splits (drop <C-\><C-n> if using vim)
tnoremap <A-Left>  <C-\><C-N><C-w>H
tnoremap <A-Down>  <C-\><C-N><C-w>J
tnoremap <A-Up>    <C-\><C-N><C-w>K
tnoremap <A-Right> <C-\><C-N><C-w>L
inoremap <A-Left>  <C-w>H
inoremap <A-Down>  <C-w>J
inoremap <A-Up>    <C-w>K
inoremap <A-Right> <C-w>L
nnoremap <A-Left>  <C-w>H
nnoremap <A-Down>  <C-w>J
nnoremap <A-Up>    <C-w>K
nnoremap <A-Right> <C-w>L
vnoremap <A-Left>  <C-w>H
vnoremap <A-Down>  <C-w>J
vnoremap <A-Up>    <C-w>K
vnoremap <A-Right> <C-w>L

" [Ctrl + Alt + Arrow] : resize splits (drop <C-\><C-n> if using vim)
tnoremap <C-A-Left>  <C-\><C-N><C-w>8<
tnoremap <C-A-Down>  <C-\><C-N><C-w>8-
tnoremap <C-A-Up>    <C-\><C-N><C-w>8+
tnoremap <C-A-Right> <C-\><C-N><C-w>8>
inoremap <C-A-Left>  <C-w>8<
inoremap <C-A-Down>  <C-w>8-
inoremap <C-A-Up>    <C-w>8+
inoremap <C-A-Right> <C-w>8>
nnoremap <C-A-Left>  <C-w>8<
nnoremap <C-A-Down>  <C-w>8-
nnoremap <C-A-Up>    <C-w>8+
nnoremap <C-A-Right> <C-w>8>
vnoremap <C-A-Left>  <C-w>8<
vnoremap <C-A-Down>  <C-w>8-
vnoremap <C-A-Up>    <C-w>8+
vnoremap <C-A-Right> <C-w>8>

function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
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
