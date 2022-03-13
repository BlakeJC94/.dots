-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/blake/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/blake/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/blake/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/blake/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/blake/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["FTerm.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\nFTerm\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/FTerm.nvim",
    url = "https://github.com/numToStr/FTerm.nvim"
  },
  ["beacon.nvim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/beacon.nvim",
    url = "https://github.com/danilamihailov/beacon.nvim"
  },
  ["clipboard-image.nvim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/clipboard-image.nvim",
    url = "https://github.com/ekickx/clipboard-image.nvim"
  },
  ["cmd-parser.nvim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/cmd-parser.nvim",
    url = "https://github.com/winston0410/cmd-parser.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-latex-symbols"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/cmp-latex-symbols",
    url = "https://github.com/kdheepak/cmp-latex-symbols"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  firenvim = {
    config = { "\27LJ\2\n�\5\0\0\4\0\r\0\0196\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0005\1\6\0005\2\5\0=\2\a\0015\2\t\0005\3\b\0=\3\n\2=\2\v\1=\1\4\0006\0\0\0009\0\1\0'\2\f\0B\0\2\1K\0\1\0�\2            if exists('g:started_by_firenvim')\n                set wrap linebreak colorcolumn=0 breakindent\n                \"autocmd! TextChanged * ++nested write\n                \"autocmd! TextChangedI * ++nested write\n                autocmd! InsertLeave,TextChanged * write\n                echo 'TRACE'\n                \"hi Normal guibg='#1d2021'\n            endif\n        \18localSettings\a.*\1\0\0\1\0\5\rpriority\3\0\rtakeover\nnever\rselector\rtextarea\fcontent\ttext\fcmdline\vneovim\19globalSettings\1\0\0\1\0\1\balt\ball\20firenvim_config\6g9 au BufEnter github.com_*.txt set filetype=markdown \bcmd\bvim\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/firenvim",
    url = "https://github.com/glacambre/firenvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0025\3\5\0=\3\6\2B\0\2\1K\0\1\0\19preview_config\1\0\3\nstyle\fminimal\rrelative\vcursor\vborder\tnone\fkeymaps\1\0\4\vlinehl\1\23current_line_blame\2\15signcolumn\1\nnumhl\2\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gruvbox.nvim"] = {
    config = { "\27LJ\2\n�\4\0\0\3\0\t\0\0216\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0)\1\1\0=\1\4\0006\0\0\0009\0\3\0'\1\6\0=\1\5\0006\0\0\0009\0\3\0)\1\1\0=\1\a\0006\0\0\0009\0\1\0'\2\b\0B\0\2\1K\0\1\0\24colorscheme gruvbox\30gruvbox_italicize_strings\thard\26gruvbox_contrast_dark\19gruvbox_italic\6g�\2            augroup colorscheme_overrides\n                autocmd!\n                autocmd ColorScheme * hi Folded guibg='#282828'\n                autocmd ColorScheme * hi ColorColumn guibg='#282828'\n                autocmd ColorScheme * hi CursorLine guibg='#282828'\n                autocmd ColorScheme * hi CursorLineNr guibg='#282828'\n            augroup END\n        \bcmd\bvim\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/gv.vim",
    url = "https://github.com/junegunn/gv.vim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\4\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\0016\0\b\0009\0\t\0'\2\n\0B\0\2\1K\0\1\0Ehighlight IndentBlanklineContextChar guifg=#a89984 gui=nocombine\bcmd\bvim\20buftype_exclude\1\2\0\0\rterminal\21filetype_exclude\1\6\0\0\thelp\nalpha\blir\vpacker\bman\1\0\2\31show_current_context_start\1\25show_current_context\2\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lir.nvim"] = {
    config = { "\27LJ\2\n�\a\0\0\b\0006\0D6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0029\3\5\0035\5\6\0005\6\b\0009\a\a\0=\a\t\0069\a\n\0=\a\v\0069\a\f\0=\a\r\0069\a\14\0=\a\15\0069\a\16\0=\a\17\0069\a\18\0=\a\19\0069\a\18\0=\a\20\0069\a\21\0=\a\22\0069\a\23\0=\a\24\0069\a\25\0=\a\26\0069\a\27\0=\a\28\0069\a\29\0=\a\30\0069\a\31\0=\a \0069\a!\0=\a\"\0069\a#\1=\a$\0069\a%\2=\a&\0069\a'\2=\a(\0069\a)\2=\a*\6=\6+\0055\6,\0=\6-\5B\3\2\0016\3\0\0'\5.\0B\3\2\0029\3/\0035\0051\0005\0060\0=\0062\5B\3\2\0016\0033\0009\0034\3'\0055\0B\3\2\1K\0\1\0�\2            command! Lir edit %:p:h\n            augroup lir-settings\n                autocmd!\n                autocmd Filetype lir set nospell\n                autocmd Filetype lir nnoremap <buffer> <silent> <Leader><CR> <C-^>\n            augroup END\n        \bcmd\bvim\20lir_folder_icon\1\0\0\1\0\3\ncolor\f#7ebae4\ticon\b\tname\18LirFolderNode\rset_icon\22nvim-web-devicons\nfloat\1\0\1\rwinblend\3\0\rmappings\6P\npaste\6C\bcut\6Y\tcopy\6M\16toggle_mark\add\vdelete\6.\23toggle_show_hidden\ayy\14yank_path\6@\acd\6R\vrename\6f\fnewfile\6F\nmkdir\n<ESC>\6q\tquit\t<BS>\aup\6T\ftabedit\6|\vvsplit\6_\nsplit\t<CR>\1\0\0\tedit\1\0\3\22show_hidden_files\1\16hide_cursor\2\20devicons_enable\2\nsetup\blir\26lir.clipboard.actions\21lir.mark.actions\16lir.actions\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/lir.nvim",
    url = "https://github.com/tamago324/lir.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lualine-lsp-progress"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/lualine-lsp-progress",
    url = "https://github.com/arkav/lualine-lsp-progress"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n�\4\0\0\5\0\31\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0034\4\0\0=\4\b\3=\3\n\0025\3\f\0005\4\v\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\3=\3\24\0025\3\25\0004\4\0\0=\4\r\0034\4\0\0=\4\15\0035\4\26\0=\4\17\0035\4\27\0=\4\19\0034\4\0\0=\4\21\0034\4\0\0=\4\23\3=\3\28\0024\3\0\0=\3\29\0024\3\0\0=\3\30\2B\0\2\1K\0\1\0\15extensions\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\ttabs\14lualine_y\1\3\0\0\rlocation\rprogress\14lualine_x\1\2\0\0\rfiletype\14lualine_c\1\3\0\0\rfilename\17lsp_progress\14lualine_b\1\3\0\0\vbranch\tdiff\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\23section_separators\1\0\2\nright\b\tleft\b\25component_separators\1\0\2\nright\b\tleft\b\1\0\3\25always_divide_middle\2\ntheme\fgruvbox\18icons_enabled\2\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  neogen = {
    config = { "\27LJ\2\nD\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fenabled\2\nsetup\vneogen\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/neogen",
    url = "https://github.com/danymat/neogen"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\nu\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0004\4\3\0009\5\3\0009\5\4\0059\5\5\5>\5\1\4=\4\a\3B\1\2\1K\0\1\0\fsources\1\0\0\tyapf\15formatting\rbuiltins\nsetup\fnull-ls\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["numb.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tnumb\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/numb.nvim",
    url = "https://github.com/nacro90/numb.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cheat.sh"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-cheat.sh",
    url = "https://github.com/RishabhRD/nvim-cheat.sh"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n�\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20�6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2�+\2\1\0X\3\1�+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2}\0\1\3\2\3\0\20-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\n�-\1\1\0B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\2\1B\1\1\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\4�\rcomplete\21select_next_item\fvisibleR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\21select_prev_item\fvisible�\b\1\0\r\0;\0o6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0023\4\5\0006\5\6\0009\5\a\5'\6\t\0=\6\b\0059\5\n\0005\a\15\0005\b\r\0009\t\v\0015\v\f\0B\t\2\2=\t\14\b=\b\16\a5\b\19\0009\t\17\0009\t\18\tB\t\1\2=\t\20\b9\t\17\0009\t\21\tB\t\1\2=\t\22\b9\t\17\0009\t\23\t)\v��B\t\2\2=\t\24\b9\t\17\0009\t\23\t)\v\4\0B\t\2\2=\t\25\b9\t\17\0009\t\26\tB\t\1\2=\t\27\b9\t\17\0009\t\28\t5\v\31\0009\f\29\0009\f\30\f=\f \vB\t\2\2=\t!\b9\t\17\0009\t\28\t5\v\"\0009\f\29\0009\f\30\f=\f \vB\t\2\2=\t#\b9\t\17\0003\v$\0005\f%\0B\t\3\2=\t&\b9\t\17\0003\v'\0005\f(\0B\t\3\2=\t)\b=\b\17\a9\b*\0009\b+\b4\n\6\0005\v,\0>\v\1\n5\v-\0>\v\2\n5\v.\0>\v\3\n5\v/\0>\v\4\n5\v0\0>\v\5\n4\v\3\0005\f1\0>\f\1\vB\b\3\2=\b+\a5\b2\0=\b3\aB\5\2\0019\5\n\0024\a\0\0B\5\2\0019\0054\0\18\a\5\0009\0055\5'\b6\0009\t7\0035\v9\0005\f8\0=\f:\vB\t\2\0A\5\2\0012\0\0�K\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\17experimental\1\0\1\15ghost_text\1\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\18latex_symbols\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\1\0\1\tname\28nvim_lsp_signature_help\fsources\vconfig\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\f<Right>\rbehavior\1\0\1\vselect\2\vInsert\20ConfirmBehavior\fconfirm\v<Left>\nclose\r<S-Down>\v<S-Up>\16scroll_docs\v<Down>\21select_next_item\t<Up>\1\0\0\21select_prev_item\fmapping\15formatting\1\0\0\vformat\1\0\0\1\0\2\rmaxwidth\0032\14with_text\2\15cmp_format\nsetup\26menu,menuone,noselect\16completeopt\bopt\bvim\0\"nvim-autopairs.completion.cmp\19nvim-autopairs\flspkind\bcmp\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\nO\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\1\nnames\1\1\2\0\0\6*\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lastplace"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-lastplace\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-lastplace",
    url = "https://github.com/ethanholz/nvim-lastplace"
  },
  ["nvim-lightbulb"] = {
    config = { "\27LJ\2\n�\2\0\0\4\0\15\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\0016\0\f\0009\0\r\0'\2\14\0B\0\2\1K\0\1\0Tautocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()\bcmd\bvim\16status_text\1\0\3\21text_unavailable\5\fenabled\1\ttext\t💡\17virtual_text\1\0\3\fenabled\2\fhl_mode\freplace\ttext\t💡\nfloat\1\0\2\ttext\t💡\fenabled\1\tsign\1\0\0\1\0\2\rpriority\3\n\fenabled\1\21update_lightbulb\19nvim-lightbulb\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-lightbulb",
    url = "https://github.com/kosayoda/nvim-lightbulb"
  },
  ["nvim-lsp-basics"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-lsp-basics",
    url = "https://github.com/nanotee/nvim-lsp-basics"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n�\1\0\1\6\1\b\0\0186\1\0\0009\1\1\0019\1\2\1)\3\0\0'\4\3\0'\5\4\0B\1\4\1-\1\0\0009\1\5\1\18\3\0\0006\4\6\0B\1\3\1-\1\0\0009\1\a\1\18\3\0\0006\4\6\0B\1\3\1K\0\1\0\2�\22make_lsp_mappings\nbufnr\22make_lsp_commands\27v:lua.vim.lsp.omnifunc\romnifunc\24nvim_buf_set_option\bapi\bvim�\a\1\0\17\0(\0I6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\4\0009\3\5\0039\3\6\0035\5\a\0B\3\2\0015\3\b\0006\4\t\0\18\6\3\0B\4\2\4H\a\f�'\t\n\0\18\n\a\0&\t\n\t6\n\4\0009\n\v\n9\n\f\n\18\f\t\0005\r\r\0=\b\14\r=\t\15\r=\t\16\rB\n\3\1F\a\3\3R\a�3\4\17\0006\5\4\0009\5\18\0059\5\19\0059\5\20\5B\5\1\0029\6\21\1\18\b\5\0B\6\2\2\18\5\6\0004\6\0\0005\a\28\0005\b\26\0005\t\23\0005\n\24\0=\n\25\t=\t\27\b=\b\29\a=\a\22\0065\a\30\0006\b\31\0\18\n\a\0B\b\2\4X\v\f�8\r\f\0009\r \r5\15!\0=\4\"\15=\5#\0156\16$\0=\16$\0155\16%\0=\16&\0158\16\f\6=\16'\15B\r\2\1E\v\3\3R\v�2\0\0�K\0\1\0\rsettings\nflags\1\0\1\26debounce_text_changes\3�\1\rhandlers\17capabilities\14on_attach\1\0\0\nsetup\vipairs\1\3\0\0\fpyright\fjulials\vpython\1\0\0\ranalysis\1\0\0 diagnosticSeverityOverrides\1\0\4\29reportPrivateImportUsage\tnone\28reportGeneralTypeIssues\tnone\28reportOptionalSubscript\tnone\31reportOptionalMemberAccess\tnone\1\0\4\20autoSearchPaths\2\19diagnosticMode\14workspace\21typeCheckingMode\nbasic\27useLibraryCodeForTypes\2\fpyright\24update_capabilities\29make_client_capabilities\rprotocol\blsp\0\nnumhl\vtexthl\ttext\1\0\0\16sign_define\afn\19DiagnosticSign\npairs\1\0\4\tHint\t \nError\t \tInfo\t \tWarn\t \1\0\5\14underline\2\nsigns\1\17virtual_text\1\18severity_sort\1\21update_in_insert\1\vconfig\15diagnostic\bvim\15lsp_basics\17cmp_nvim_lsp\14lspconfig\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-pqf"] = {
    config = { "\27LJ\2\nu\0\0\5\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\3B\1\2\1K\0\1\0\nsigns\1\0\0\1\0\4\fwarning\t \tinfo\t \thint\t \nerror\t \nsetup\bpqf\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-pqf",
    url = "https://gitlab.com/yorickpeterse/nvim-pqf"
  },
  ["nvim-revJ.lua"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\fkeymaps\1\0\3\tline\agj\roperator\agJ\vvisual\agj\rbrackets\1\0\4!new_line_before_last_bracket\2\22parameter_mapping\6,\27enable_default_keymaps\1%add_seperator_for_last_parameter\2\1\0\2\nfirst\t([{<\tlast\t)]}>\nsetup\trevj\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-revJ.lua",
    url = "https://github.com/AckslD/nvim-revJ.lua"
  },
  ["nvim-tetris"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-tetris",
    url = "https://github.com/alec-gibson/nvim-tetris"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\4\0\0\6\0\19\0\0235\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0=\0\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0004\5\0\0=\5\v\0045\5\f\0=\5\r\4=\4\14\0035\4\16\0005\5\15\0=\5\17\4=\4\18\3B\1\2\1K\0\1\0\16textobjects\vselect\1\0\0\1\0\1\venable\2\15playground\16keybindings\1\0\n\21unfocus_language\6F\19focus_language\6f\28toggle_language_display\6I\27toggle_anonymous_nodes\6a\30toggle_injected_languages\6t\21toggle_hl_groups\6i\24toggle_query_editor\6o\14show_help\6?\vupdate\6R\14goto_node\t<cr>\fdisable\1\0\3\15updatetime\3\25\venable\2\20persist_queries\1\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\1\17sync_install\1\nsetup\28nvim-treesitter.configs\frequire\1\n\0\0\fcomment\rmarkdown\vpython\tbash\blua\nregex\njulia\6r\brst\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\2B\0\2\1K\0\1\0\rpatterns\fdefault\1\0\0\1\4\0\0\nclass\rfunction\vmethod\1\0\3\venable\2\14max_lines\3\0\rthrottle\2\nsetup\23treesitter-context\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/romgrk/nvim-treesitter-context"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  popfix = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/popfix",
    url = "https://github.com/RishabhRD/popfix"
  },
  ["quick-scope"] = {
    config = { "\27LJ\2\n�\4\0\0\3\0\a\0\r6\0\0\0009\0\1\0)\1 \3=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0006\0\0\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0�\3            function! QSColors()\n                highlight QuickScopePrimary guifg='#ff007c' gui=bold ctermfg=198 cterm=bold\n                highlight QuickScopeSecondary guifg='#00dfff' gui=bold ctermfg=45 cterm=bold\n            endfunction\n            call QSColors()\n            augroup qs_colors\n                autocmd!\n                autocmd ColorScheme * call QSColors()\n            augroup END\n        \bcmd\1\5\0\0\6f\6F\6t\6T\25qs_highlight_on_keys\17qs_max_chars\6g\bvim\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/quick-scope",
    url = "https://github.com/unblevable/quick-scope"
  },
  ["range-highlight.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\20range-highlight\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/range-highlight.nvim",
    url = "https://github.com/winston0410/range-highlight.nvim"
  },
  ["spellsitter.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16spellsitter\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/spellsitter.nvim",
    url = "https://github.com/lewis6991/spellsitter.nvim"
  },
  ["stabilize.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14stabilize\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/stabilize.nvim",
    url = "https://github.com/luukvbaal/stabilize.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope-bibtex.nvim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/telescope-bibtex.nvim",
    url = "https://github.com/nvim-telescope/telescope-bibtex.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\b\0\21\0\0296\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0025\2\6\0005\3\4\0009\4\3\1=\4\5\3=\3\a\0025\3\b\0009\4\3\1=\4\t\3=\3\n\0029\3\v\0005\5\15\0005\6\r\0005\a\f\0=\a\14\6=\6\16\0055\6\17\0=\2\18\6=\6\19\5B\3\2\0019\3\20\0'\5\14\0B\3\2\1K\0\1\0\19load_extension\rdefaults\rmappings\1\0\0\15extensions\1\0\0\bfzf\1\0\0\1\0\4\28override_generic_sorter\2\nfuzzy\2\14case_mode\15smart_case\25override_file_sorter\2\nsetup\6i\n<esc>\1\0\0\6n\1\0\0\6q\1\0\0\nclose\22telescope.actions\14telescope\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["textobj-word-column.vim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/textobj-word-column.vim",
    url = "https://github.com/coderifous/textobj-word-column.vim"
  },
  ["twilight.nvim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-expand-region"] = {
    config = { "\27LJ\2\n�\1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0k            map + <Plug>(expand_region_expand)\n            map - <Plug>(expand_region_shrink)\n        \bcmd\bvim\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-expand-region",
    url = "https://github.com/terryma/vim-expand-region"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-illuminate"] = {
    config = { "\27LJ\2\n@\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\blir\27Illuminate_ftblacklist\6g\bvim\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-lion"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-lion",
    url = "https://github.com/tommcdo/vim-lion"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-polyglot",
    url = "https://github.com/sheerun/vim-polyglot"
  },
  ["vim-python-pep8-indent"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-python-pep8-indent",
    url = "https://github.com/Vimjas/vim-python-pep8-indent"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-slime"] = {
    config = { "\27LJ\2\nZ\0\0\2\0\5\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0K\0\1\0\25slime_python_ipython\vneovim\17slime_target\6g\bvim\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-slime",
    url = "https://github.com/jpalardy/vim-slime"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-textobj-user",
    url = "https://github.com/kana/vim-textobj-user"
  },
  ["vim-textobj-variable-segment"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-textobj-variable-segment",
    url = "https://github.com/Julian/vim-textobj-variable-segment"
  },
  ["virt-column.nvim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/virt-column.nvim",
    url = "https://github.com/lukas-reineke/virt-column.nvim"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\nz\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\vwindow\1\0\0\foptions\1\0\0\1\0\2\19relativenumber\1\vnumber\1\nsetup\rzen-mode\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\nz\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\vwindow\1\0\0\foptions\1\0\0\1\0\2\19relativenumber\1\vnumber\1\nsetup\rzen-mode\frequire\0", "config", "zen-mode.nvim")
time([[Config for zen-mode.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n�\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20�6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2�+\2\1\0X\3\1�+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2}\0\1\3\2\3\0\20-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\n�-\1\1\0B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\2\1B\1\1\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\4�\rcomplete\21select_next_item\fvisibleR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4�-\1\0\0009\1\1\1B\1\1\1X\1\2�\18\1\0\0B\1\1\1K\0\1\0\0�\21select_prev_item\fvisible�\b\1\0\r\0;\0o6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0023\4\5\0006\5\6\0009\5\a\5'\6\t\0=\6\b\0059\5\n\0005\a\15\0005\b\r\0009\t\v\0015\v\f\0B\t\2\2=\t\14\b=\b\16\a5\b\19\0009\t\17\0009\t\18\tB\t\1\2=\t\20\b9\t\17\0009\t\21\tB\t\1\2=\t\22\b9\t\17\0009\t\23\t)\v��B\t\2\2=\t\24\b9\t\17\0009\t\23\t)\v\4\0B\t\2\2=\t\25\b9\t\17\0009\t\26\tB\t\1\2=\t\27\b9\t\17\0009\t\28\t5\v\31\0009\f\29\0009\f\30\f=\f \vB\t\2\2=\t!\b9\t\17\0009\t\28\t5\v\"\0009\f\29\0009\f\30\f=\f \vB\t\2\2=\t#\b9\t\17\0003\v$\0005\f%\0B\t\3\2=\t&\b9\t\17\0003\v'\0005\f(\0B\t\3\2=\t)\b=\b\17\a9\b*\0009\b+\b4\n\6\0005\v,\0>\v\1\n5\v-\0>\v\2\n5\v.\0>\v\3\n5\v/\0>\v\4\n5\v0\0>\v\5\n4\v\3\0005\f1\0>\f\1\vB\b\3\2=\b+\a5\b2\0=\b3\aB\5\2\0019\5\n\0024\a\0\0B\5\2\0019\0054\0\18\a\5\0009\0055\5'\b6\0009\t7\0035\v9\0005\f8\0=\f:\vB\t\2\0A\5\2\0012\0\0�K\0\1\0\rmap_char\1\0\0\1\0\1\btex\5\20on_confirm_done\17confirm_done\aon\nevent\17experimental\1\0\1\15ghost_text\1\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\18latex_symbols\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\1\0\1\tname\28nvim_lsp_signature_help\fsources\vconfig\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\f<Right>\rbehavior\1\0\1\vselect\2\vInsert\20ConfirmBehavior\fconfirm\v<Left>\nclose\r<S-Down>\v<S-Up>\16scroll_docs\v<Down>\21select_next_item\t<Up>\1\0\0\21select_prev_item\fmapping\15formatting\1\0\0\vformat\1\0\0\1\0\2\rmaxwidth\0032\14with_text\2\15cmp_format\nsetup\26menu,menuone,noselect\16completeopt\bopt\bvim\0\"nvim-autopairs.completion.cmp\19nvim-autopairs\flspkind\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n�\4\0\0\5\0\31\0/6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0034\4\0\0=\4\b\3=\3\n\0025\3\f\0005\4\v\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\3=\3\24\0025\3\25\0004\4\0\0=\4\r\0034\4\0\0=\4\15\0035\4\26\0=\4\17\0035\4\27\0=\4\19\0034\4\0\0=\4\21\0034\4\0\0=\4\23\3=\3\28\0024\3\0\0=\3\29\0024\3\0\0=\3\30\2B\0\2\1K\0\1\0\15extensions\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\ttabs\14lualine_y\1\3\0\0\rlocation\rprogress\14lualine_x\1\2\0\0\rfiletype\14lualine_c\1\3\0\0\rfilename\17lsp_progress\14lualine_b\1\3\0\0\vbranch\tdiff\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\23section_separators\1\0\2\nright\b\tleft\b\25component_separators\1\0\2\nright\b\tleft\b\1\0\3\25always_divide_middle\2\ntheme\fgruvbox\18icons_enabled\2\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-treesitter-context
time([[Config for nvim-treesitter-context]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\2B\0\2\1K\0\1\0\rpatterns\fdefault\1\0\0\1\4\0\0\nclass\rfunction\vmethod\1\0\3\venable\2\14max_lines\3\0\rthrottle\2\nsetup\23treesitter-context\frequire\0", "config", "nvim-treesitter-context")
time([[Config for nvim-treesitter-context]], false)
-- Config for: nvim-revJ.lua
time([[Config for nvim-revJ.lua]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\fkeymaps\1\0\3\tline\agj\roperator\agJ\vvisual\agj\rbrackets\1\0\4!new_line_before_last_bracket\2\22parameter_mapping\6,\27enable_default_keymaps\1%add_seperator_for_last_parameter\2\1\0\2\nfirst\t([{<\tlast\t)]}>\nsetup\trevj\frequire\0", "config", "nvim-revJ.lua")
time([[Config for nvim-revJ.lua]], false)
-- Config for: vim-expand-region
time([[Config for vim-expand-region]], true)
try_loadstring("\27LJ\2\n�\1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0k            map + <Plug>(expand_region_expand)\n            map - <Plug>(expand_region_shrink)\n        \bcmd\bvim\0", "config", "vim-expand-region")
time([[Config for vim-expand-region]], false)
-- Config for: vim-slime
time([[Config for vim-slime]], true)
try_loadstring("\27LJ\2\nZ\0\0\2\0\5\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0K\0\1\0\25slime_python_ipython\vneovim\17slime_target\6g\bvim\0", "config", "vim-slime")
time([[Config for vim-slime]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\nO\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\1\nnames\1\1\2\0\0\6*\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: stabilize.nvim
time([[Config for stabilize.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14stabilize\frequire\0", "config", "stabilize.nvim")
time([[Config for stabilize.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\nu\0\0\6\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0004\4\3\0009\5\3\0009\5\4\0059\5\5\5>\5\1\4=\4\a\3B\1\2\1K\0\1\0\fsources\1\0\0\tyapf\15formatting\rbuiltins\nsetup\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: lir.nvim
time([[Config for lir.nvim]], true)
try_loadstring("\27LJ\2\n�\a\0\0\b\0006\0D6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0029\3\5\0035\5\6\0005\6\b\0009\a\a\0=\a\t\0069\a\n\0=\a\v\0069\a\f\0=\a\r\0069\a\14\0=\a\15\0069\a\16\0=\a\17\0069\a\18\0=\a\19\0069\a\18\0=\a\20\0069\a\21\0=\a\22\0069\a\23\0=\a\24\0069\a\25\0=\a\26\0069\a\27\0=\a\28\0069\a\29\0=\a\30\0069\a\31\0=\a \0069\a!\0=\a\"\0069\a#\1=\a$\0069\a%\2=\a&\0069\a'\2=\a(\0069\a)\2=\a*\6=\6+\0055\6,\0=\6-\5B\3\2\0016\3\0\0'\5.\0B\3\2\0029\3/\0035\0051\0005\0060\0=\0062\5B\3\2\0016\0033\0009\0034\3'\0055\0B\3\2\1K\0\1\0�\2            command! Lir edit %:p:h\n            augroup lir-settings\n                autocmd!\n                autocmd Filetype lir set nospell\n                autocmd Filetype lir nnoremap <buffer> <silent> <Leader><CR> <C-^>\n            augroup END\n        \bcmd\bvim\20lir_folder_icon\1\0\0\1\0\3\ncolor\f#7ebae4\ticon\b\tname\18LirFolderNode\rset_icon\22nvim-web-devicons\nfloat\1\0\1\rwinblend\3\0\rmappings\6P\npaste\6C\bcut\6Y\tcopy\6M\16toggle_mark\add\vdelete\6.\23toggle_show_hidden\ayy\14yank_path\6@\acd\6R\vrename\6f\fnewfile\6F\nmkdir\n<ESC>\6q\tquit\t<BS>\aup\6T\ftabedit\6|\vvsplit\6_\nsplit\t<CR>\1\0\0\tedit\1\0\3\22show_hidden_files\1\16hide_cursor\2\20devicons_enable\2\nsetup\blir\26lir.clipboard.actions\21lir.mark.actions\16lir.actions\frequire\0", "config", "lir.nvim")
time([[Config for lir.nvim]], false)
-- Config for: nvim-pqf
time([[Config for nvim-pqf]], true)
try_loadstring("\27LJ\2\nu\0\0\5\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\3B\1\2\1K\0\1\0\nsigns\1\0\0\1\0\4\fwarning\t \tinfo\t \thint\t \nerror\t \nsetup\bpqf\frequire\0", "config", "nvim-pqf")
time([[Config for nvim-pqf]], false)
-- Config for: vim-illuminate
time([[Config for vim-illuminate]], true)
try_loadstring("\27LJ\2\n@\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\blir\27Illuminate_ftblacklist\6g\bvim\0", "config", "vim-illuminate")
time([[Config for vim-illuminate]], false)
-- Config for: range-highlight.nvim
time([[Config for range-highlight.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\20range-highlight\frequire\0", "config", "range-highlight.nvim")
time([[Config for range-highlight.nvim]], false)
-- Config for: nvim-lightbulb
time([[Config for nvim-lightbulb]], true)
try_loadstring("\27LJ\2\n�\2\0\0\4\0\15\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\0016\0\f\0009\0\r\0'\2\14\0B\0\2\1K\0\1\0Tautocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()\bcmd\bvim\16status_text\1\0\3\21text_unavailable\5\fenabled\1\ttext\t💡\17virtual_text\1\0\3\fenabled\2\fhl_mode\freplace\ttext\t💡\nfloat\1\0\2\ttext\t💡\fenabled\1\tsign\1\0\0\1\0\2\rpriority\3\n\fenabled\1\21update_lightbulb\19nvim-lightbulb\frequire\0", "config", "nvim-lightbulb")
time([[Config for nvim-lightbulb]], false)
-- Config for: quick-scope
time([[Config for quick-scope]], true)
try_loadstring("\27LJ\2\n�\4\0\0\3\0\a\0\r6\0\0\0009\0\1\0)\1 \3=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0006\0\0\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0�\3            function! QSColors()\n                highlight QuickScopePrimary guifg='#ff007c' gui=bold ctermfg=198 cterm=bold\n                highlight QuickScopeSecondary guifg='#00dfff' gui=bold ctermfg=45 cterm=bold\n            endfunction\n            call QSColors()\n            augroup qs_colors\n                autocmd!\n                autocmd ColorScheme * call QSColors()\n            augroup END\n        \bcmd\1\5\0\0\6f\6F\6t\6T\25qs_highlight_on_keys\17qs_max_chars\6g\bvim\0", "config", "quick-scope")
time([[Config for quick-scope]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\4\0\0\6\0\19\0\0235\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0=\0\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0004\5\0\0=\5\v\0045\5\f\0=\5\r\4=\4\14\0035\4\16\0005\5\15\0=\5\17\4=\4\18\3B\1\2\1K\0\1\0\16textobjects\vselect\1\0\0\1\0\1\venable\2\15playground\16keybindings\1\0\n\21unfocus_language\6F\19focus_language\6f\28toggle_language_display\6I\27toggle_anonymous_nodes\6a\30toggle_injected_languages\6t\21toggle_hl_groups\6i\24toggle_query_editor\6o\14show_help\6?\vupdate\6R\14goto_node\t<cr>\fdisable\1\0\3\15updatetime\3\25\venable\2\20persist_queries\1\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\1\17sync_install\1\nsetup\28nvim-treesitter.configs\frequire\1\n\0\0\fcomment\rmarkdown\vpython\tbash\blua\nregex\njulia\6r\brst\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0025\3\5\0=\3\6\2B\0\2\1K\0\1\0\19preview_config\1\0\3\nstyle\fminimal\rrelative\vcursor\vborder\tnone\fkeymaps\1\0\4\vlinehl\1\23current_line_blame\2\15signcolumn\1\nnumhl\2\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: gruvbox.nvim
time([[Config for gruvbox.nvim]], true)
try_loadstring("\27LJ\2\n�\4\0\0\3\0\t\0\0216\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0)\1\1\0=\1\4\0006\0\0\0009\0\3\0'\1\6\0=\1\5\0006\0\0\0009\0\3\0)\1\1\0=\1\a\0006\0\0\0009\0\1\0'\2\b\0B\0\2\1K\0\1\0\24colorscheme gruvbox\30gruvbox_italicize_strings\thard\26gruvbox_contrast_dark\19gruvbox_italic\6g�\2            augroup colorscheme_overrides\n                autocmd!\n                autocmd ColorScheme * hi Folded guibg='#282828'\n                autocmd ColorScheme * hi ColorColumn guibg='#282828'\n                autocmd ColorScheme * hi CursorLine guibg='#282828'\n                autocmd ColorScheme * hi CursorLineNr guibg='#282828'\n            augroup END\n        \bcmd\bvim\0", "config", "gruvbox.nvim")
time([[Config for gruvbox.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\b\0\21\0\0296\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0025\2\6\0005\3\4\0009\4\3\1=\4\5\3=\3\a\0025\3\b\0009\4\3\1=\4\t\3=\3\n\0029\3\v\0005\5\15\0005\6\r\0005\a\f\0=\a\14\6=\6\16\0055\6\17\0=\2\18\6=\6\19\5B\3\2\0019\3\20\0'\5\14\0B\3\2\1K\0\1\0\19load_extension\rdefaults\rmappings\1\0\0\15extensions\1\0\0\bfzf\1\0\0\1\0\4\28override_generic_sorter\2\nfuzzy\2\14case_mode\15smart_case\25override_file_sorter\2\nsetup\6i\n<esc>\1\0\0\6n\1\0\0\6q\1\0\0\nclose\22telescope.actions\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-lastplace
time([[Config for nvim-lastplace]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-lastplace\frequire\0", "config", "nvim-lastplace")
time([[Config for nvim-lastplace]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\4\0\v\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\0016\0\b\0009\0\t\0'\2\n\0B\0\2\1K\0\1\0Ehighlight IndentBlanklineContextChar guifg=#a89984 gui=nocombine\bcmd\bvim\20buftype_exclude\1\2\0\0\rterminal\21filetype_exclude\1\6\0\0\thelp\nalpha\blir\vpacker\bman\1\0\2\31show_current_context_start\1\25show_current_context\2\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: firenvim
time([[Config for firenvim]], true)
try_loadstring("\27LJ\2\n�\5\0\0\4\0\r\0\0196\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0005\1\6\0005\2\5\0=\2\a\0015\2\t\0005\3\b\0=\3\n\2=\2\v\1=\1\4\0006\0\0\0009\0\1\0'\2\f\0B\0\2\1K\0\1\0�\2            if exists('g:started_by_firenvim')\n                set wrap linebreak colorcolumn=0 breakindent\n                \"autocmd! TextChanged * ++nested write\n                \"autocmd! TextChangedI * ++nested write\n                autocmd! InsertLeave,TextChanged * write\n                echo 'TRACE'\n                \"hi Normal guibg='#1d2021'\n            endif\n        \18localSettings\a.*\1\0\0\1\0\5\rpriority\3\0\rtakeover\nnever\rselector\rtextarea\fcontent\ttext\fcmdline\vneovim\19globalSettings\1\0\0\1\0\1\balt\ball\20firenvim_config\6g9 au BufEnter github.com_*.txt set filetype=markdown \bcmd\bvim\0", "config", "firenvim")
time([[Config for firenvim]], false)
-- Config for: numb.nvim
time([[Config for numb.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tnumb\frequire\0", "config", "numb.nvim")
time([[Config for numb.nvim]], false)
-- Config for: spellsitter.nvim
time([[Config for spellsitter.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16spellsitter\frequire\0", "config", "spellsitter.nvim")
time([[Config for spellsitter.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n�\1\0\1\6\1\b\0\0186\1\0\0009\1\1\0019\1\2\1)\3\0\0'\4\3\0'\5\4\0B\1\4\1-\1\0\0009\1\5\1\18\3\0\0006\4\6\0B\1\3\1-\1\0\0009\1\a\1\18\3\0\0006\4\6\0B\1\3\1K\0\1\0\2�\22make_lsp_mappings\nbufnr\22make_lsp_commands\27v:lua.vim.lsp.omnifunc\romnifunc\24nvim_buf_set_option\bapi\bvim�\a\1\0\17\0(\0I6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\4\0009\3\5\0039\3\6\0035\5\a\0B\3\2\0015\3\b\0006\4\t\0\18\6\3\0B\4\2\4H\a\f�'\t\n\0\18\n\a\0&\t\n\t6\n\4\0009\n\v\n9\n\f\n\18\f\t\0005\r\r\0=\b\14\r=\t\15\r=\t\16\rB\n\3\1F\a\3\3R\a�3\4\17\0006\5\4\0009\5\18\0059\5\19\0059\5\20\5B\5\1\0029\6\21\1\18\b\5\0B\6\2\2\18\5\6\0004\6\0\0005\a\28\0005\b\26\0005\t\23\0005\n\24\0=\n\25\t=\t\27\b=\b\29\a=\a\22\0065\a\30\0006\b\31\0\18\n\a\0B\b\2\4X\v\f�8\r\f\0009\r \r5\15!\0=\4\"\15=\5#\0156\16$\0=\16$\0155\16%\0=\16&\0158\16\f\6=\16'\15B\r\2\1E\v\3\3R\v�2\0\0�K\0\1\0\rsettings\nflags\1\0\1\26debounce_text_changes\3�\1\rhandlers\17capabilities\14on_attach\1\0\0\nsetup\vipairs\1\3\0\0\fpyright\fjulials\vpython\1\0\0\ranalysis\1\0\0 diagnosticSeverityOverrides\1\0\4\29reportPrivateImportUsage\tnone\28reportGeneralTypeIssues\tnone\28reportOptionalSubscript\tnone\31reportOptionalMemberAccess\tnone\1\0\4\20autoSearchPaths\2\19diagnosticMode\14workspace\21typeCheckingMode\nbasic\27useLibraryCodeForTypes\2\fpyright\24update_capabilities\29make_client_capabilities\rprotocol\blsp\0\nnumhl\vtexthl\ttext\1\0\0\16sign_define\afn\19DiagnosticSign\npairs\1\0\4\tHint\t \nError\t \tInfo\t \tWarn\t \1\0\5\14underline\2\nsigns\1\17virtual_text\1\18severity_sort\1\21update_in_insert\1\vconfig\15diagnostic\bvim\15lsp_basics\17cmp_nvim_lsp\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: FTerm.nvim
time([[Config for FTerm.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\nFTerm\frequire\0", "config", "FTerm.nvim")
time([[Config for FTerm.nvim]], false)
-- Config for: neogen
time([[Config for neogen]], true)
try_loadstring("\27LJ\2\nD\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fenabled\2\nsetup\vneogen\frequire\0", "config", "neogen")
time([[Config for neogen]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
