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
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/FTerm.nvim",
    url = "https://github.com/numToStr/FTerm.nvim"
  },
  ["beacon.nvim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/beacon.nvim",
    url = "https://github.com/danilamihailov/beacon.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
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
  ["dial.nvim"] = {
    config = { "\27LJ\2\nÕ\2\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0≠\2            nmap  <C-a>  <Plug>(dial-increment)\n            nmap  <C-x>  <Plug>(dial-decrement)\n            vmap  <C-a>  <Plug>(dial-increment)\n            vmap  <C-x>  <Plug>(dial-decrement)\n            vmap g<C-a> g<Plug>(dial-increment)\n            vmap g<C-x> g<Plug>(dial-decrement)\n        \bcmd\bvim\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/dial.nvim",
    url = "https://github.com/monaqa/dial.nvim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n¿\1\0\0\4\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0025\3\5\0=\3\6\2B\0\2\1K\0\1\0\19preview_config\1\0\3\rrelative\vcursor\nstyle\fminimal\vborder\tnone\fkeymaps\1\0\4\15signcolumn\1\23current_line_blame\2\vlinehl\1\nnumhl\2\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gruvbox.nvim"] = {
    config = { "\27LJ\2\n˛\4\0\0\3\0\n\0\0256\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0)\1\1\0=\1\4\0006\0\0\0009\0\3\0'\1\6\0=\1\5\0006\0\0\0009\0\3\0)\1\1\0=\1\a\0006\0\0\0009\0\1\0'\2\b\0B\0\2\0016\0\0\0009\0\1\0'\2\t\0B\0\2\1K\0\1\0Ehighlight IndentBlanklineContextChar guifg=#a89984 gui=nocombine\24colorscheme gruvbox\30gruvbox_italicize_strings\thard\26gruvbox_contrast_dark\19gruvbox_italic\6gÛ\2            augroup gruvbox_overrides\n                autocmd!\n                autocmd ColorScheme * hi Folded guibg='#282828'\n                autocmd ColorScheme * hi ColorColumn guibg='#282828'\n                autocmd ColorScheme * hi CursorLine guibg='#282828'\n                autocmd ColorScheme * hi CursorLineNr guibg='#282828'\n            augroup END\n        \bcmd\bvim\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n”\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\20buftype_exclude\1\2\0\0\rterminal\21filetype_exclude\1\6\0\0\thelp\nalpha\blir\vpacker\bman\1\0\2\25show_current_context\2\31show_current_context_start\1\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp-command"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/lsp-command",
    url = "https://github.com/ii14/lsp-command"
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
    config = { "\27LJ\2\ná\5\0\0\6\0\31\00016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0034\4\0\0=\4\b\3=\3\n\0025\3\f\0005\4\v\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0034\4\3\0005\5\22\0>\5\1\4=\4\23\3=\3\24\0025\3\25\0004\4\0\0=\4\r\0034\4\0\0=\4\15\0035\4\26\0=\4\17\0035\4\27\0=\4\19\0034\4\0\0=\4\21\0034\4\0\0=\4\23\3=\3\28\0024\3\0\0=\3\29\0024\3\0\0=\3\30\2B\0\2\1K\0\1\0\15extensions\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\1\0\ttabs\tmode\3\1\14lualine_y\1\3\0\0\rlocation\rprogress\14lualine_x\1\2\0\0\rfiletype\14lualine_c\1\3\0\0\rfilename\17lsp_progress\14lualine_b\1\3\0\0\vbranch\tdiff\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\23section_separators\1\0\2\tleft\bÓÇ∞\nright\bÓÇ≤\25component_separators\1\0\2\tleft\bÓÇ±\nright\bÓÇ≥\1\0\4\ntheme\fgruvbox\18icons_enabled\2\25always_divide_middle\2\17globalstatus\2\nsetup\flualine\frequire\0" },
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
    config = { "\27LJ\2\n¨\1\0\0\6\0\v\0\0216\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\t\0004\4\4\0009\5\3\0009\5\4\0059\5\5\5>\5\1\0049\5\3\0009\5\6\0059\5\a\5>\5\2\0049\5\3\0009\5\4\0059\5\b\5>\5\3\4=\4\n\3B\1\2\1K\0\1\0\fsources\1\0\0\ajq\vpylint\16diagnostics\nblack\15formatting\rbuiltins\nsetup\fnull-ls\frequire\0" },
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
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n–\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20Ä6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2Ä+\2\1\0X\3\1Ä+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2}\0\1\3\2\3\0\20-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\nÄ-\1\1\0B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\2\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\4¿\rcomplete\21select_next_item\fvisibleR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\21select_prev_item\fvisible∆\b\1\0\15\0=\0z6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0023\4\5\0006\5\6\0009\5\a\5'\6\t\0=\6\b\0059\5\n\0005\a\15\0005\b\r\0009\t\v\0015\v\f\0B\t\2\2=\t\14\b=\b\16\a5\b\20\0009\t\17\0009\v\17\0009\v\18\vB\v\1\0025\f\19\0B\t\3\2=\t\21\b9\t\17\0009\v\17\0009\v\22\vB\v\1\0025\f\23\0B\t\3\2=\t\24\b9\t\17\0009\t\25\t)\v¸ˇB\t\2\2=\t\26\b9\t\17\0009\t\25\t)\v\4\0B\t\2\2=\t\27\b9\t\17\0009\v\17\0009\v\28\vB\v\1\0025\f\29\0B\t\3\2=\t\30\b9\t\17\0009\v\17\0009\v\31\v5\r\"\0009\14 \0009\14!\14=\14#\rB\v\2\0025\f$\0B\t\3\2=\t%\b9\t\17\0009\t\31\t5\v&\0009\f \0009\f!\f=\f#\vB\t\2\2=\t'\b9\t\17\0003\v(\0005\f)\0B\t\3\2=\t*\b9\t\17\0003\v+\0005\f,\0B\t\3\2=\t-\b=\b\17\a4\b\6\0005\t.\0>\t\1\b5\t/\0>\t\2\b5\t0\0>\t\3\b5\t1\0>\t\4\b5\t2\0>\t\5\b=\b3\a5\b4\0=\b5\aB\5\2\0019\5\n\0009\0056\5'\a7\0005\b9\0004\t\3\0005\n8\0>\n\1\t=\t3\bB\5\3\0019\5\n\0009\0056\5'\a:\0005\b<\0004\t\3\0005\n;\0>\n\1\t=\t3\bB\5\3\0012\0\0ÄK\0\1\0\1\0\0\1\0\1\tname\vbuffer\6/\1\0\0\1\0\1\tname\fcmdline\6:\fcmdline\17experimental\1\0\1\15ghost_text\2\fsources\1\0\1\tname\18latex_symbols\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\1\0\1\tname\28nvim_lsp_signature_help\f<S-Tab>\1\4\0\0\6i\6s\6c\0\n<Tab>\1\4\0\0\6i\6s\6c\0\t<CR>\1\0\1\vselect\2\f<Right>\1\3\0\0\6i\6c\rbehavior\1\0\1\vselect\2\vInsert\20ConfirmBehavior\fconfirm\v<Left>\1\3\0\0\6i\6c\nclose\r<S-Down>\v<S-Up>\16scroll_docs\v<Down>\1\3\0\0\6i\6c\21select_next_item\t<Up>\1\0\0\1\3\0\0\6i\6c\21select_prev_item\fmapping\15formatting\1\0\0\vformat\1\0\0\1\0\2\rmaxwidth\0032\14with_text\2\15cmp_format\nsetup\26menu,menuone,noselect\16completeopt\bopt\bvim\0\"nvim-autopairs.completion.cmp\19nvim-autopairs\flspkind\bcmp\frequire\0" },
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
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nc\0\1\6\0\5\0\b6\1\0\0009\1\1\0019\1\2\1)\3\0\0'\4\3\0'\5\4\0B\1\4\1K\0\1\0\27v:lua.vim.lsp.omnifunc\romnifunc\24nvim_buf_set_option\bapi\bvimõ\n\1\0\17\0A\0k6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\3\0009\2\4\0029\2\5\0025\4\6\0B\2\2\0015\2\a\0006\3\b\0\18\5\2\0B\3\2\4H\6\fÄ'\b\t\0\18\t\6\0&\b\t\b6\t\3\0009\t\n\t9\t\v\t\18\v\b\0005\f\f\0=\a\r\f=\b\14\f=\b\15\fB\t\3\1F\6\3\3R\6Ú3\3\16\0006\4\3\0009\4\17\0049\4\18\0049\4\19\4B\4\1\0029\5\20\1\18\a\4\0B\5\2\2\18\4\5\0006\5\3\0009\5\21\0056\a\22\0009\a\23\a'\b\24\0B\5\3\0026\6\25\0009\6\26\6\18\b\5\0'\t\27\0B\6\3\0016\6\25\0009\6\26\6\18\b\5\0'\t\28\0B\6\3\0014\6\0\0005\a#\0005\b!\0005\t\30\0005\n\31\0=\n \t=\t\"\b=\b$\a=\a\29\0065\a5\0005\b'\0005\t&\0=\5\23\t=\t(\b5\t*\0005\n)\0=\n+\t=\t,\b5\t0\0006\n\3\0009\n-\n9\n.\n'\f/\0+\r\2\0B\n\3\2=\n1\t=\t2\b5\t3\0=\t4\b=\b6\a=\a%\0065\a7\0006\b8\0\18\n\a\0B\b\2\4X\v\fÄ8\r\f\0009\r9\r5\15:\0=\3;\15=\4<\0156\16=\0=\16=\0155\16>\0=\16?\0158\16\f\6=\16@\15B\r\2\1E\v\3\3R\vÚK\0\1\0\rsettings\nflags\1\0\1\26debounce_text_changes\3ñ\1\rhandlers\17capabilities\14on_attach\1\0\0\nsetup\vipairs\1\3\0\0\fpyright\fjulials\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\bapi\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\1\0\1\fversion\vLuaJIT\16sumneko_lua\vpython\1\0\0\ranalysis\1\0\0 diagnosticSeverityOverrides\1\0\4\28reportOptionalSubscript\tnone\29reportPrivateImportUsage\tnone\28reportGeneralTypeIssues\tnone\31reportOptionalMemberAccess\tnone\1\0\4\19diagnosticMode\14workspace\20autoSearchPaths\2\21typeCheckingMode\nbasic\27useLibraryCodeForTypes\2\fpyright\19lua/?/init.lua\14lua/?.lua\vinsert\ntable\6;\tpath\fpackage\nsplit\24update_capabilities\29make_client_capabilities\rprotocol\blsp\0\nnumhl\vtexthl\ttext\1\0\0\16sign_define\afn\19DiagnosticSign\npairs\1\0\4\tHint\tÔ†µ \tWarn\tÔî© \tInfo\tÔëâ \nError\tÔôô \1\0\5\17virtual_text\1\18severity_sort\1\21update_in_insert\1\14underline\2\nsigns\1\vconfig\15diagnostic\bvim\17cmp_nvim_lsp\14lspconfig\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-pqf"] = {
    config = { "\27LJ\2\nu\0\0\5\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\3B\1\2\1K\0\1\0\nsigns\1\0\0\1\0\4\nerror\tÔôô \fwarning\tÔî© \tinfo\tÔëâ \thint\tÔ†µ \nsetup\bpqf\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-pqf",
    url = "https://gitlab.com/yorickpeterse/nvim-pqf"
  },
  ["nvim-revJ.lua"] = {
    config = { "\27LJ\2\nk\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\fkeymaps\1\0\0\1\0\3\roperator\agJ\tline\bgJJ\vvisual\agJ\nsetup\trevj\frequire\0" },
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
    config = { "\27LJ\2\ní\2\0\0\6\0\14\0\0175\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0=\0\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\v\0005\5\n\0=\5\f\4=\4\r\3B\1\2\1K\0\1\0\16textobjects\vselect\1\0\0\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\1\17sync_install\1\nsetup\28nvim-treesitter.configs\frequire\1\n\0\0\fcomment\rmarkdown\vpython\tbash\blua\nregex\njulia\6r\brst\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    config = { "\27LJ\2\n£\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\2B\0\2\1K\0\1\0\rpatterns\fdefault\1\0\0\1\4\0\0\nclass\rfunction\vmethod\1\0\3\rthrottle\2\venable\2\14max_lines\3\0\nsetup\23treesitter-context\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/lewis6991/nvim-treesitter-context"
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
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["quick-scope"] = {
    config = { "\27LJ\2\nê\4\0\0\3\0\a\0\r6\0\0\0009\0\1\0)\1 \3=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0006\0\0\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0†\3            function! QSColors()\n                highlight QuickScopePrimary guifg='#ff007c' gui=bold ctermfg=198 cterm=bold\n                highlight QuickScopeSecondary guifg='#00dfff' gui=bold ctermfg=45 cterm=bold\n            endfunction\n            call QSColors()\n            augroup qs_colors\n                autocmd!\n                autocmd ColorScheme * call QSColors()\n            augroup END\n        \bcmd\1\5\0\0\6f\6F\6t\6T\25qs_highlight_on_keys\17qs_max_chars\6g\bvim\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/quick-scope",
    url = "https://github.com/unblevable/quick-scope"
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
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n•\t\0\0\t\0,\0:6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0025\2\6\0005\3\4\0009\4\3\1=\4\5\3=\3\a\0025\3\b\0009\4\3\1=\4\t\3=\3\n\0029\3\v\0005\5\19\0005\6\r\0005\a\f\0=\a\14\0065\a\16\0005\b\15\0=\b\17\a=\a\18\6=\6\20\0055\6\22\0005\a\21\0=\a\23\6=\2\24\6=\6\25\0055\6\27\0005\a\26\0=\a\28\0065\a\30\0005\b\29\0=\b\31\a=\a \0065\a!\0005\b\"\0=\b\23\a=\a#\0065\a$\0005\b%\0=\b\23\a=\a&\6=\6'\5B\3\2\0019\3(\0'\5\14\0B\3\2\0019\3(\0'\5\18\0B\3\2\0016\3)\0009\3*\3'\5+\0B\3\2\1K\0\1\0Ô\2            highlight TelescopePromptBorder guibg=#282828\n            highlight TelescopePromptNormal guibg=#282828\n\n            highlight TelescopeResultsBorder guibg=#3c3836\n            highlight TelescopeResultsNormal guibg=#3c3836\n\n            highlight TelescopePreviewBorder guibg=#282828\n            highlight TelescopePreviewNormal guibg=#282828\n        \bcmd\bvim\19load_extension\fpickers\18spell_suggest\1\t\0\0\6 \6 \6 \6 \6 \6 \6 \6 \1\0\1\ntheme\bivy\14registers\1\t\0\0\6 \6 \6 \6 \6 \6 \6 \6 \1\0\1\ntheme\bivy\15git_status\14git_icons\1\0\0\1\0\a\frenamed\bÔöñ\vcopied\bÔÑ∏\runmerged\bÔòØ\fchanged\bÔÅö\14untracked\bÔÅô\nadded\bÔÅï\fdeleted\bÔÅñ\15find_files\1\0\0\1\0\1\vhidden\2\rdefaults\rmappings\16borderchars\1\0\0\1\t\0\0\6 \6 \6 \6 \6 \6 \6 \6 \15extensions\1\0\0\17file_browser\18layout_config\1\0\6\14previewer\1\vhidden\2\17display_stat\1\tpath\n%:p:h\fgrouped\2\17hijack_netrw\2\1\0\1\nwidth\3<\bfzf\1\0\0\1\0\4\14case_mode\15smart_case\25override_file_sorter\2\28override_generic_sorter\2\nfuzzy\2\nsetup\6i\n<esc>\1\0\0\6n\1\0\0\6q\1\0\0\nclose\22telescope.actions\14telescope\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tmux.nvim"] = {
    config = { "\27LJ\2\n÷\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vresize\1\0\3\31enable_default_keybindings\1\18resize_step_y\3\b\18resize_step_x\3\b\15navigation\1\0\1\31enable_default_keybindings\1\14copy_sync\1\0\0\1\0\1\venable\1\nsetup\ttmux\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/tmux.nvim",
    url = "https://github.com/aserowy/tmux.nvim"
  },
  ["trld.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ttrld\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/trld.nvim",
    url = "https://github.com/Mofiqul/trld.nvim"
  },
  ["twilight.nvim"] = {
    config = { "\27LJ\2\nÉ\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\fdimming\1\0\0\ncolor\1\3\0\0\vNormal\f#ffffff\1\0\2\nalpha\3\1\rinactive\1\nsetup\rtwilight\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
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
    config = { "\27LJ\2\nä\1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0k            map + <Plug>(expand_region_expand)\n            map - <Plug>(expand_region_shrink)\n        \bcmd\bvim\0" },
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
  ["vim-kitty"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-kitty",
    url = "https://github.com/fladson/vim-kitty"
  },
  ["vim-lion"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-lion",
    url = "https://github.com/tommcdo/vim-lion"
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
  ["vim-rsi"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-rsi",
    url = "https://github.com/tpope/vim-rsi"
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
  ["vim-textobj-parameter"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-textobj-parameter",
    url = "https://github.com/sgur/vim-textobj-parameter"
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
    config = { "\27LJ\2\nz\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\vwindow\1\0\0\foptions\1\0\0\1\0\2\vnumber\1\19relativenumber\1\nsetup\rzen-mode\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n”\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\20buftype_exclude\1\2\0\0\rterminal\21filetype_exclude\1\6\0\0\thelp\nalpha\blir\vpacker\bman\1\0\2\25show_current_context\2\31show_current_context_start\1\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\ná\5\0\0\6\0\31\00016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0034\4\0\0=\4\b\3=\3\n\0025\3\f\0005\4\v\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0034\4\3\0005\5\22\0>\5\1\4=\4\23\3=\3\24\0025\3\25\0004\4\0\0=\4\r\0034\4\0\0=\4\15\0035\4\26\0=\4\17\0035\4\27\0=\4\19\0034\4\0\0=\4\21\0034\4\0\0=\4\23\3=\3\28\0024\3\0\0=\3\29\0024\3\0\0=\3\30\2B\0\2\1K\0\1\0\15extensions\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\1\0\ttabs\tmode\3\1\14lualine_y\1\3\0\0\rlocation\rprogress\14lualine_x\1\2\0\0\rfiletype\14lualine_c\1\3\0\0\rfilename\17lsp_progress\14lualine_b\1\3\0\0\vbranch\tdiff\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\23section_separators\1\0\2\tleft\bÓÇ∞\nright\bÓÇ≤\25component_separators\1\0\2\tleft\bÓÇ±\nright\bÓÇ≥\1\0\4\ntheme\fgruvbox\18icons_enabled\2\25always_divide_middle\2\17globalstatus\2\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: trld.nvim
time([[Config for trld.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ttrld\frequire\0", "config", "trld.nvim")
time([[Config for trld.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\ní\2\0\0\6\0\14\0\0175\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0=\0\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\v\0005\5\n\0=\5\f\4=\4\r\3B\1\2\1K\0\1\0\16textobjects\vselect\1\0\0\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\1\17sync_install\1\nsetup\28nvim-treesitter.configs\frequire\1\n\0\0\fcomment\rmarkdown\vpython\tbash\blua\nregex\njulia\6r\brst\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\nO\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\1\nnames\1\1\2\0\0\6*\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: FTerm.nvim
time([[Config for FTerm.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "FTerm.nvim")
time([[Config for FTerm.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n¿\1\0\0\4\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0025\3\5\0=\3\6\2B\0\2\1K\0\1\0\19preview_config\1\0\3\rrelative\vcursor\nstyle\fminimal\vborder\tnone\fkeymaps\1\0\4\15signcolumn\1\23current_line_blame\2\vlinehl\1\nnumhl\2\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: numb.nvim
time([[Config for numb.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tnumb\frequire\0", "config", "numb.nvim")
time([[Config for numb.nvim]], false)
-- Config for: nvim-pqf
time([[Config for nvim-pqf]], true)
try_loadstring("\27LJ\2\nu\0\0\5\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\3B\1\2\1K\0\1\0\nsigns\1\0\0\1\0\4\nerror\tÔôô \fwarning\tÔî© \tinfo\tÔëâ \thint\tÔ†µ \nsetup\bpqf\frequire\0", "config", "nvim-pqf")
time([[Config for nvim-pqf]], false)
-- Config for: vim-slime
time([[Config for vim-slime]], true)
try_loadstring("\27LJ\2\nZ\0\0\2\0\5\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0K\0\1\0\25slime_python_ipython\vneovim\17slime_target\6g\bvim\0", "config", "vim-slime")
time([[Config for vim-slime]], false)
-- Config for: nvim-revJ.lua
time([[Config for nvim-revJ.lua]], true)
try_loadstring("\27LJ\2\nk\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\fkeymaps\1\0\0\1\0\3\roperator\agJ\tline\bgJJ\vvisual\agJ\nsetup\trevj\frequire\0", "config", "nvim-revJ.lua")
time([[Config for nvim-revJ.lua]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\nz\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\vwindow\1\0\0\foptions\1\0\0\1\0\2\vnumber\1\19relativenumber\1\nsetup\rzen-mode\frequire\0", "config", "zen-mode.nvim")
time([[Config for zen-mode.nvim]], false)
-- Config for: vim-illuminate
time([[Config for vim-illuminate]], true)
try_loadstring("\27LJ\2\n@\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\blir\27Illuminate_ftblacklist\6g\bvim\0", "config", "vim-illuminate")
time([[Config for vim-illuminate]], false)
-- Config for: tmux.nvim
time([[Config for tmux.nvim]], true)
try_loadstring("\27LJ\2\n÷\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vresize\1\0\3\31enable_default_keybindings\1\18resize_step_y\3\b\18resize_step_x\3\b\15navigation\1\0\1\31enable_default_keybindings\1\14copy_sync\1\0\0\1\0\1\venable\1\nsetup\ttmux\frequire\0", "config", "tmux.nvim")
time([[Config for tmux.nvim]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\n¨\1\0\0\6\0\v\0\0216\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\t\0004\4\4\0009\5\3\0009\5\4\0059\5\5\5>\5\1\0049\5\3\0009\5\6\0059\5\a\5>\5\2\0049\5\3\0009\5\4\0059\5\b\5>\5\3\4=\4\n\3B\1\2\1K\0\1\0\fsources\1\0\0\ajq\vpylint\16diagnostics\nblack\15formatting\rbuiltins\nsetup\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n–\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20Ä6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2Ä+\2\1\0X\3\1Ä+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2}\0\1\3\2\3\0\20-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\nÄ-\1\1\0B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\2\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\4¿\rcomplete\21select_next_item\fvisibleR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\21select_prev_item\fvisible∆\b\1\0\15\0=\0z6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0023\4\5\0006\5\6\0009\5\a\5'\6\t\0=\6\b\0059\5\n\0005\a\15\0005\b\r\0009\t\v\0015\v\f\0B\t\2\2=\t\14\b=\b\16\a5\b\20\0009\t\17\0009\v\17\0009\v\18\vB\v\1\0025\f\19\0B\t\3\2=\t\21\b9\t\17\0009\v\17\0009\v\22\vB\v\1\0025\f\23\0B\t\3\2=\t\24\b9\t\17\0009\t\25\t)\v¸ˇB\t\2\2=\t\26\b9\t\17\0009\t\25\t)\v\4\0B\t\2\2=\t\27\b9\t\17\0009\v\17\0009\v\28\vB\v\1\0025\f\29\0B\t\3\2=\t\30\b9\t\17\0009\v\17\0009\v\31\v5\r\"\0009\14 \0009\14!\14=\14#\rB\v\2\0025\f$\0B\t\3\2=\t%\b9\t\17\0009\t\31\t5\v&\0009\f \0009\f!\f=\f#\vB\t\2\2=\t'\b9\t\17\0003\v(\0005\f)\0B\t\3\2=\t*\b9\t\17\0003\v+\0005\f,\0B\t\3\2=\t-\b=\b\17\a4\b\6\0005\t.\0>\t\1\b5\t/\0>\t\2\b5\t0\0>\t\3\b5\t1\0>\t\4\b5\t2\0>\t\5\b=\b3\a5\b4\0=\b5\aB\5\2\0019\5\n\0009\0056\5'\a7\0005\b9\0004\t\3\0005\n8\0>\n\1\t=\t3\bB\5\3\0019\5\n\0009\0056\5'\a:\0005\b<\0004\t\3\0005\n;\0>\n\1\t=\t3\bB\5\3\0012\0\0ÄK\0\1\0\1\0\0\1\0\1\tname\vbuffer\6/\1\0\0\1\0\1\tname\fcmdline\6:\fcmdline\17experimental\1\0\1\15ghost_text\2\fsources\1\0\1\tname\18latex_symbols\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\1\0\1\tname\28nvim_lsp_signature_help\f<S-Tab>\1\4\0\0\6i\6s\6c\0\n<Tab>\1\4\0\0\6i\6s\6c\0\t<CR>\1\0\1\vselect\2\f<Right>\1\3\0\0\6i\6c\rbehavior\1\0\1\vselect\2\vInsert\20ConfirmBehavior\fconfirm\v<Left>\1\3\0\0\6i\6c\nclose\r<S-Down>\v<S-Up>\16scroll_docs\v<Down>\1\3\0\0\6i\6c\21select_next_item\t<Up>\1\0\0\1\3\0\0\6i\6c\21select_prev_item\fmapping\15formatting\1\0\0\vformat\1\0\0\1\0\2\rmaxwidth\0032\14with_text\2\15cmp_format\nsetup\26menu,menuone,noselect\16completeopt\bopt\bvim\0\"nvim-autopairs.completion.cmp\19nvim-autopairs\flspkind\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n•\t\0\0\t\0,\0:6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0025\2\6\0005\3\4\0009\4\3\1=\4\5\3=\3\a\0025\3\b\0009\4\3\1=\4\t\3=\3\n\0029\3\v\0005\5\19\0005\6\r\0005\a\f\0=\a\14\0065\a\16\0005\b\15\0=\b\17\a=\a\18\6=\6\20\0055\6\22\0005\a\21\0=\a\23\6=\2\24\6=\6\25\0055\6\27\0005\a\26\0=\a\28\0065\a\30\0005\b\29\0=\b\31\a=\a \0065\a!\0005\b\"\0=\b\23\a=\a#\0065\a$\0005\b%\0=\b\23\a=\a&\6=\6'\5B\3\2\0019\3(\0'\5\14\0B\3\2\0019\3(\0'\5\18\0B\3\2\0016\3)\0009\3*\3'\5+\0B\3\2\1K\0\1\0Ô\2            highlight TelescopePromptBorder guibg=#282828\n            highlight TelescopePromptNormal guibg=#282828\n\n            highlight TelescopeResultsBorder guibg=#3c3836\n            highlight TelescopeResultsNormal guibg=#3c3836\n\n            highlight TelescopePreviewBorder guibg=#282828\n            highlight TelescopePreviewNormal guibg=#282828\n        \bcmd\bvim\19load_extension\fpickers\18spell_suggest\1\t\0\0\6 \6 \6 \6 \6 \6 \6 \6 \1\0\1\ntheme\bivy\14registers\1\t\0\0\6 \6 \6 \6 \6 \6 \6 \6 \1\0\1\ntheme\bivy\15git_status\14git_icons\1\0\0\1\0\a\frenamed\bÔöñ\vcopied\bÔÑ∏\runmerged\bÔòØ\fchanged\bÔÅö\14untracked\bÔÅô\nadded\bÔÅï\fdeleted\bÔÅñ\15find_files\1\0\0\1\0\1\vhidden\2\rdefaults\rmappings\16borderchars\1\0\0\1\t\0\0\6 \6 \6 \6 \6 \6 \6 \6 \15extensions\1\0\0\17file_browser\18layout_config\1\0\6\14previewer\1\vhidden\2\17display_stat\1\tpath\n%:p:h\fgrouped\2\17hijack_netrw\2\1\0\1\nwidth\3<\bfzf\1\0\0\1\0\4\14case_mode\15smart_case\25override_file_sorter\2\28override_generic_sorter\2\nfuzzy\2\nsetup\6i\n<esc>\1\0\0\6n\1\0\0\6q\1\0\0\nclose\22telescope.actions\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: quick-scope
time([[Config for quick-scope]], true)
try_loadstring("\27LJ\2\nê\4\0\0\3\0\a\0\r6\0\0\0009\0\1\0)\1 \3=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0006\0\0\0009\0\5\0'\2\6\0B\0\2\1K\0\1\0†\3            function! QSColors()\n                highlight QuickScopePrimary guifg='#ff007c' gui=bold ctermfg=198 cterm=bold\n                highlight QuickScopeSecondary guifg='#00dfff' gui=bold ctermfg=45 cterm=bold\n            endfunction\n            call QSColors()\n            augroup qs_colors\n                autocmd!\n                autocmd ColorScheme * call QSColors()\n            augroup END\n        \bcmd\1\5\0\0\6f\6F\6t\6T\25qs_highlight_on_keys\17qs_max_chars\6g\bvim\0", "config", "quick-scope")
time([[Config for quick-scope]], false)
-- Config for: neogen
time([[Config for neogen]], true)
try_loadstring("\27LJ\2\nD\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fenabled\2\nsetup\vneogen\frequire\0", "config", "neogen")
time([[Config for neogen]], false)
-- Config for: gruvbox.nvim
time([[Config for gruvbox.nvim]], true)
try_loadstring("\27LJ\2\n˛\4\0\0\3\0\n\0\0256\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\3\0)\1\1\0=\1\4\0006\0\0\0009\0\3\0'\1\6\0=\1\5\0006\0\0\0009\0\3\0)\1\1\0=\1\a\0006\0\0\0009\0\1\0'\2\b\0B\0\2\0016\0\0\0009\0\1\0'\2\t\0B\0\2\1K\0\1\0Ehighlight IndentBlanklineContextChar guifg=#a89984 gui=nocombine\24colorscheme gruvbox\30gruvbox_italicize_strings\thard\26gruvbox_contrast_dark\19gruvbox_italic\6gÛ\2            augroup gruvbox_overrides\n                autocmd!\n                autocmd ColorScheme * hi Folded guibg='#282828'\n                autocmd ColorScheme * hi ColorColumn guibg='#282828'\n                autocmd ColorScheme * hi CursorLine guibg='#282828'\n                autocmd ColorScheme * hi CursorLineNr guibg='#282828'\n            augroup END\n        \bcmd\bvim\0", "config", "gruvbox.nvim")
time([[Config for gruvbox.nvim]], false)
-- Config for: spellsitter.nvim
time([[Config for spellsitter.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16spellsitter\frequire\0", "config", "spellsitter.nvim")
time([[Config for spellsitter.nvim]], false)
-- Config for: nvim-lastplace
time([[Config for nvim-lastplace]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-lastplace\frequire\0", "config", "nvim-lastplace")
time([[Config for nvim-lastplace]], false)
-- Config for: dial.nvim
time([[Config for dial.nvim]], true)
try_loadstring("\27LJ\2\nÕ\2\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0≠\2            nmap  <C-a>  <Plug>(dial-increment)\n            nmap  <C-x>  <Plug>(dial-decrement)\n            vmap  <C-a>  <Plug>(dial-increment)\n            vmap  <C-x>  <Plug>(dial-decrement)\n            vmap g<C-a> g<Plug>(dial-increment)\n            vmap g<C-x> g<Plug>(dial-decrement)\n        \bcmd\bvim\0", "config", "dial.nvim")
time([[Config for dial.nvim]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
try_loadstring("\27LJ\2\nÉ\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\fdimming\1\0\0\ncolor\1\3\0\0\vNormal\f#ffffff\1\0\2\nalpha\3\1\rinactive\1\nsetup\rtwilight\frequire\0", "config", "twilight.nvim")
time([[Config for twilight.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nc\0\1\6\0\5\0\b6\1\0\0009\1\1\0019\1\2\1)\3\0\0'\4\3\0'\5\4\0B\1\4\1K\0\1\0\27v:lua.vim.lsp.omnifunc\romnifunc\24nvim_buf_set_option\bapi\bvimõ\n\1\0\17\0A\0k6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\3\0009\2\4\0029\2\5\0025\4\6\0B\2\2\0015\2\a\0006\3\b\0\18\5\2\0B\3\2\4H\6\fÄ'\b\t\0\18\t\6\0&\b\t\b6\t\3\0009\t\n\t9\t\v\t\18\v\b\0005\f\f\0=\a\r\f=\b\14\f=\b\15\fB\t\3\1F\6\3\3R\6Ú3\3\16\0006\4\3\0009\4\17\0049\4\18\0049\4\19\4B\4\1\0029\5\20\1\18\a\4\0B\5\2\2\18\4\5\0006\5\3\0009\5\21\0056\a\22\0009\a\23\a'\b\24\0B\5\3\0026\6\25\0009\6\26\6\18\b\5\0'\t\27\0B\6\3\0016\6\25\0009\6\26\6\18\b\5\0'\t\28\0B\6\3\0014\6\0\0005\a#\0005\b!\0005\t\30\0005\n\31\0=\n \t=\t\"\b=\b$\a=\a\29\0065\a5\0005\b'\0005\t&\0=\5\23\t=\t(\b5\t*\0005\n)\0=\n+\t=\t,\b5\t0\0006\n\3\0009\n-\n9\n.\n'\f/\0+\r\2\0B\n\3\2=\n1\t=\t2\b5\t3\0=\t4\b=\b6\a=\a%\0065\a7\0006\b8\0\18\n\a\0B\b\2\4X\v\fÄ8\r\f\0009\r9\r5\15:\0=\3;\15=\4<\0156\16=\0=\16=\0155\16>\0=\16?\0158\16\f\6=\16@\15B\r\2\1E\v\3\3R\vÚK\0\1\0\rsettings\nflags\1\0\1\26debounce_text_changes\3ñ\1\rhandlers\17capabilities\14on_attach\1\0\0\nsetup\vipairs\1\3\0\0\fpyright\fjulials\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\0\5\26nvim_get_runtime_file\bapi\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\1\0\1\fversion\vLuaJIT\16sumneko_lua\vpython\1\0\0\ranalysis\1\0\0 diagnosticSeverityOverrides\1\0\4\28reportOptionalSubscript\tnone\29reportPrivateImportUsage\tnone\28reportGeneralTypeIssues\tnone\31reportOptionalMemberAccess\tnone\1\0\4\19diagnosticMode\14workspace\20autoSearchPaths\2\21typeCheckingMode\nbasic\27useLibraryCodeForTypes\2\fpyright\19lua/?/init.lua\14lua/?.lua\vinsert\ntable\6;\tpath\fpackage\nsplit\24update_capabilities\29make_client_capabilities\rprotocol\blsp\0\nnumhl\vtexthl\ttext\1\0\0\16sign_define\afn\19DiagnosticSign\npairs\1\0\4\tHint\tÔ†µ \tWarn\tÔî© \tInfo\tÔëâ \nError\tÔôô \1\0\5\17virtual_text\1\18severity_sort\1\21update_in_insert\1\14underline\2\nsigns\1\vconfig\15diagnostic\bvim\17cmp_nvim_lsp\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-treesitter-context
time([[Config for nvim-treesitter-context]], true)
try_loadstring("\27LJ\2\n£\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\2B\0\2\1K\0\1\0\rpatterns\fdefault\1\0\0\1\4\0\0\nclass\rfunction\vmethod\1\0\3\rthrottle\2\venable\2\14max_lines\3\0\nsetup\23treesitter-context\frequire\0", "config", "nvim-treesitter-context")
time([[Config for nvim-treesitter-context]], false)
-- Config for: stabilize.nvim
time([[Config for stabilize.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14stabilize\frequire\0", "config", "stabilize.nvim")
time([[Config for stabilize.nvim]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: vim-expand-region
time([[Config for vim-expand-region]], true)
try_loadstring("\27LJ\2\nä\1\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0k            map + <Plug>(expand_region_expand)\n            map - <Plug>(expand_region_shrink)\n        \bcmd\bvim\0", "config", "vim-expand-region")
time([[Config for vim-expand-region]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
