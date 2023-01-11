-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

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
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

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
  LuaSnip = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
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
  cmp_luasnip = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    after = { "gruvbox.nvim" },
    config = { "\27LJ\2\n¿\1\0\0\4\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0025\3\5\0=\3\6\2B\0\2\1K\0\1\0\19preview_config\1\0\3\vborder\tnone\rrelative\vcursor\nstyle\fminimal\fkeymaps\1\0\4\23current_line_blame\2\vlinehl\1\nnumhl\2\15signcolumn\1\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gruvbox.nvim"] = {
    config = { "\27LJ\2\n¬\f\0\0\24\0S\0±\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\3\0009\2\4\0029\4\5\0019\5\6\1)\6\n\0)\a\1\0B\2\5\0026\3\3\0009\3\4\0039\5\5\0019\6\a\1)\a\n\0)\b\1\0B\3\5\0026\4\3\0009\4\4\0049\6\5\0019\a\b\1)\b\n\0)\t\1\0B\4\5\0026\5\3\0009\5\4\0059\a\5\0019\b\t\1)\t\n\0)\n\3\0B\5\5\0026\6\n\0009\6\v\6'\a\r\0=\a\f\0069\6\14\0005\b\15\0005\t\19\0005\n\17\0009\v\16\1=\v\18\n=\n\20\t5\n\21\0009\v\16\1=\v\18\n=\n\22\t5\n\23\0009\v\16\1=\v\18\n=\n\24\t5\n\25\0009\v\16\1=\v\18\n=\n\26\t5\n\28\0009\v\27\1=\v\29\n=\n\30\t5\n \0009\v\31\1=\v\29\n9\v\16\1=\v\18\n=\n!\t5\n\"\0009\v\31\1=\v\18\n9\v\16\1=\v\29\n=\n#\t5\n$\0009\v\31\1=\v\29\n9\v\16\1=\v\18\n=\n%\t5\n&\0=\4\18\n=\n'\t5\n(\0=\3\18\n=\n)\t5\n*\0=\2\18\n=\n+\t5\n,\0=\5\18\n=\n-\t5\n.\0009\v\16\1=\v\18\n=\n/\t5\n0\0009\v\16\1=\v\18\n=\n1\t5\n2\0009\v\16\1=\v\18\n=\n3\t=\t4\bB\6\2\0016\6\n\0009\0065\0069\0066\6'\b\1\0B\6\2\0015\6E\0005\a8\0005\b7\0009\t\5\1=\t\18\b=\b9\a5\b:\0009\t\5\1=\t\18\b=\b;\a5\b=\0009\t<\1=\t\18\b=\b>\a5\b?\0009\t<\1=\t\18\b=\b@\a5\bA\0009\t\5\1=\t\18\b=\bB\a5\bC\0009\t\5\1=\t\18\b=\bD\a=\aF\0065\aH\0005\bG\0009\t\16\1=\t\18\b=\bI\a5\bJ\0009\t\16\1=\t\18\b=\bK\a5\bL\0009\t\16\1=\t\18\b=\bM\a=\aN\0066\aO\0\18\t\6\0B\a\2\4H\n\19Ä6\fP\0006\14\0\0\18\15\n\0B\f\3\3\15\0\f\0X\14\rÄ6\14O\0\18\16\v\0B\14\2\4H\17\aÄ6\19\n\0009\19Q\0199\19R\19)\21\0\0\18\22\17\0\18\23\18\0B\19\4\1F\17\3\3R\17˜\127F\n\3\3R\nÎ\127K\0\1\0\16nvim_set_hl\bapi\npcall\npairs\15illuminate\25IlluminatedWordWrite\1\0\0\24IlluminatedWordRead\1\0\0\24IlluminatedWordText\1\0\0\1\0\0\14telescope\1\0\0\27TelescopePreviewNormal\1\0\0\27TelescopePreviewBorder\1\0\0\27TelescopeResultsNormal\1\0\0\27TelescopeResultsBorder\1\0\0\ndark1\26TelescopePromptNormal\1\0\0\26TelescopePromptBorder\1\0\0\1\0\0\16colorscheme\bcmd\14overrides\17MatchWordCur\1\0\0\18MatchParenCur\1\0\0\14MatchWord\1\0\0\rDiffText\1\0\2\afg\5\freverse\1\15DiffDelete\1\0\2\afg\5\freverse\1\fDiffAdd\1\0\2\afg\5\freverse\1\15DiffChange\1\0\2\afg\5\freverse\1\14IncSearch\1\0\0\14CurSearch\1\0\0\vSearch\1\0\0\18bright_yellow\31IndentBlanklineContextChar\afg\1\0\0\vlight4\17CursorLineNr\1\0\0\15CursorLine\1\0\0\16ColorColumn\1\0\0\vFolded\1\0\0\abg\1\0\0\ndark0\1\0\t\rcontrast\thard\25invert_intend_guides\1\19invert_tabline\1\17invert_signs\1\21invert_selection\1\vitalic\1\tbold\2\14underline\2\14undercurl\2\nsetup\tdark\15background\6o\bvim\19neutral_yellow\17neutral_blue\18neutral_green\16neutral_red\15dark0_hard\19color_midpoint\a_G\20gruvbox.palette\fgruvbox\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/blake/.local/share/nvim/site/pack/packer/opt/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n…\1\0\0\4\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0006\3\4\0009\3\5\0039\3\6\3=\3\6\0025\3\a\0=\3\b\2B\0\2\1K\0\1\0\20buftype_exclude\1\2\0\0\rterminal\21filetype_exclude\r_configs\a_G\1\0\2\31show_current_context_start\1\25show_current_context\2\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["jsonpath.nvim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/jsonpath.nvim",
    url = "https://github.com/phelipetls/jsonpath.nvim"
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
    config = { "\27LJ\2\nÑ\5\0\0\6\0\31\00016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0034\4\0\0=\4\b\3=\3\n\0025\3\f\0005\4\v\0=\4\r\0034\4\3\0005\5\14\0>\5\1\4=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\3=\3\24\0025\3\25\0004\4\0\0=\4\r\0034\4\0\0=\4\15\0035\4\26\0=\4\17\0035\4\27\0=\4\19\0034\4\0\0=\4\21\0034\4\0\0=\4\23\3=\3\28\0024\3\0\0=\3\29\0024\3\0\0=\3\30\2B\0\2\1K\0\1\0\15extensions\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\vbranch\14lualine_y\1\4\0\0\rlocation\rprogress\tdiff\14lualine_x\1\3\0\0\16searchcount\rfiletype\14lualine_c\1\2\0\0\17lsp_progress\14lualine_b\1\2\1\0\ttabs\tmode\3\1\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\23section_separators\1\0\2\nright\5\tleft\5\25component_separators\1\0\2\nright\b‚îÇ\tleft\b‚îÇ\1\0\4\18icons_enabled\2\25always_divide_middle\2\17globalstatus\2\ntheme\fgruvbox\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["mason-tool-installer.nvim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/mason-tool-installer.nvim",
    url = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\nÁ\1\0\0\4\0\a\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\5\0005\3\4\0=\3\6\2B\0\2\1K\0\1\0\21ensure_installed\1\0\0\1\n\0\0\fpyright\24lua-language-server\25bash-language-server\14julia-lsp\18rust-analyzer\ajq\vstylua\rluacheck\15shellcheck\25mason-tool-installer\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  neogen = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/neogen",
    url = "https://github.com/danymat/neogen"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\nï\2\0\0\a\0\16\1\"6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\14\0004\4\a\0009\5\3\0009\5\4\0059\5\5\5>\5\1\0049\5\3\0009\5\6\0059\5\a\5>\5\2\0049\5\3\0009\5\4\0059\5\b\5>\5\3\0049\5\3\0009\5\6\0059\5\t\5>\5\4\0049\5\3\0009\5\4\0059\5\n\5>\5\5\0046\5\v\0009\5\f\0059\5\r\5B\5\1\0?\5\0\0=\4\15\3B\1\2\1K\0\1\0\fsources\1\0\0\23get_juliaformatter\r_configs\a_G\vstylua\rluacheck\ajq\vpylint\16diagnostics\nblack\15formatting\rbuiltins\nsetup\fnull-ls\frequire\rÄÄ¿ô\4\0" },
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
    config = { "\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireı\6\1\0\r\0002\0Y6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\4\0009\3\5\3'\4\a\0=\4\6\0039\3\b\0005\5\r\0005\6\v\0009\a\t\0015\t\n\0B\a\2\2=\a\f\6=\6\14\0056\6\15\0009\6\16\0069\6\17\6B\6\1\2=\6\18\0059\6\19\0009\6\20\6=\6\21\0055\6\23\0003\a\22\0=\a\24\6=\6\25\0054\6\a\0005\a\26\0>\a\1\0065\a\27\0>\a\2\0065\a\28\0>\a\3\0065\a\29\0>\a\4\0065\a\30\0>\a\5\0065\a\31\0>\a\6\6=\6 \5B\3\2\0019\3\b\0009\3!\3'\5\"\0005\6$\0004\a\3\0005\b#\0>\b\1\a=\a \6B\3\3\0019\3\b\0009\3!\3'\5%\0005\6'\0004\a\3\0005\b&\0>\b\1\a=\a \6B\3\3\0019\3\b\0024\5\0\0B\3\2\0016\3\0\0'\5(\0B\3\2\0029\4)\0039\5*\0\18\a\5\0009\5+\5'\b,\0\18\t\4\0005\v.\0005\f-\0=\f/\vB\t\2\0A\5\2\0016\5\0\0'\a0\0B\5\2\0029\0051\5B\5\1\1K\0\1\0\14lazy_load luasnip.loaders.from_vscode\rmap_char\1\0\0\1\0\1\btex\5\17confirm_done\aon\nevent\20on_confirm_done\"nvim-autopairs.completion.cmp\1\0\0\1\0\1\tname\vbuffer\6/\1\0\0\1\0\1\tname\fcmdline\6:\fcmdline\fsources\1\0\1\tname\18latex_symbols\1\0\1\tname\fluasnip\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\1\0\1\tname\28nvim_lsp_signature_help\fsnippet\vexpand\1\0\0\0\14preselect\tNone\18PreselectMode\fmapping\17cmp_mappings\r_configs\a_G\15formatting\1\0\0\vformat\1\0\0\1\0\2\rmaxwidth\0032\14with_text\2\15cmp_format\nsetup\26menu,menuone,noselect\16completeopt\bopt\bvim\19nvim-autopairs\flspkind\bcmp\frequire\0" },
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
  ["nvim-dap"] = {
    config = { "\27LJ\2\n/\0\0\1\0\1\0\2'\0\0\0L\0\2\0$/home/blake/.pyenv/shims/pythonÜ\2\1\0\5\0\f\0\0226\0\0\0'\2\1\0B\0\2\0029\1\2\0004\2\3\0005\3\4\0003\4\5\0=\4\6\3>\3\1\2=\2\3\0016\1\0\0'\3\a\0B\1\2\2'\2\t\0=\2\b\0016\1\0\0'\3\a\0B\1\2\0029\1\n\1'\3\v\0B\1\2\1K\0\1\0\26~/.pyenv/shims/python\nsetup\vpytest\16test_runner\15dap-python\15pythonPath\0\1\0\4\tname\16Launch file\fprogram\f${file}\frequest\vlaunch\ttype\vpython\vpython\19configurations\bdap\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-python"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-dap-python",
    url = "https://github.com/mfussenegger/nvim-dap-python"
  },
  ["nvim-lastplace"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-lastplace\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-lastplace",
    url = "https://github.com/ethanholz/nvim-lastplace"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nÖ\3\0\0\f\0\17\0(6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1B\1\1\0016\1\2\0009\1\3\0019\1\5\1B\1\1\0026\2\2\0009\2\3\0029\2\6\2B\2\1\0026\3\a\0\18\5\1\0B\3\2\4H\6\fÄ8\b\6\0009\b\b\b5\n\n\0006\v\2\0009\v\3\v9\v\t\v=\v\v\n=\2\f\n5\v\r\0=\v\14\n=\a\15\nB\b\2\1F\6\3\3R\6Ú\1276\3\0\0'\5\16\0B\3\2\0029\3\b\0034\5\0\0B\3\2\1K\0\1\0\ttrld\rsettings\nflags\1\0\1\26debounce_text_changes\3ñ\1\17capabilities\14on_attach\1\0\0\24lspconfig_on_attach\nsetup\npairs\31lspconfig_get_capabilities\31lspconfig_get_lsp_settings$lspconfig_configure_diagnostics\r_configs\a_G\14lspconfig\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-lua-gf"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-lua-gf",
    url = "https://github.com/sam4llis/nvim-lua-gf"
  },
  ["nvim-luaref"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-luaref",
    url = "https://github.com/milisims/nvim-luaref"
  },
  ["nvim-pqf"] = {
    config = { "\27LJ\2\nu\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\nsigns\1\0\0\1\0\4\fwarning\tÔî© \nerror\tÔôô \thint\tÔ†µ \tinfo\tÔëâ \nsetup\bpqf\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-pqf",
    url = "https://gitlab.com/yorickpeterse/nvim-pqf"
  },
  ["nvim-treesitter"] = {
    after = { "gruvbox.nvim" },
    config = { "\27LJ\2\n]\0\2\6\0\5\0\v6\2\0\0009\2\1\0029\2\2\2\18\4\1\0'\5\3\0B\2\3\2\a\2\4\0X\2\2Ä+\2\2\0L\2\2\0K\0\1\0\thelp\rfiletype\24nvim_buf_get_option\bapi\bvim›\4\1\0\a\0\31\0/5\0\0\0006\1\1\0009\1\2\1\18\3\0\0006\4\3\0009\4\4\0049\4\5\4B\1\3\0026\2\6\0'\4\a\0B\2\2\0029\2\b\0025\4\t\0=\1\n\0045\5\v\0003\6\f\0=\6\r\5=\5\14\0045\5\15\0=\5\16\0045\5\17\0=\5\18\0045\5\19\0=\5\20\0046\5\3\0009\5\4\0059\5\21\5B\5\1\2=\5\22\4B\2\2\0016\2\6\0'\4\23\0B\2\2\0029\2\b\0025\4\24\0005\5\26\0005\6\25\0=\6\27\5=\5\28\4B\2\2\0016\2\6\0'\4\29\0B\2\2\0029\2\b\0025\4\30\0B\2\2\1K\0\1\0\1\0\1\fenabled\2\vneogen\rpatterns\fdefault\1\0\0\1\4\0\0\nclass\rfunction\vmethod\1\0\3\venable\2\14max_lines\3\0\rthrottle\2\23treesitter-context\16textobjects\28treesitter_get_textobjs\fmatchup\1\0\1\venable\2\15playground\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\fdisable\0\1\0\1\venable\2\21ensure_installed\1\0\1\17sync_install\1\nsetup\28nvim-treesitter.configs\frequire\21filetype_include\r_configs\a_G\16list_extend\bvim\1\6\0\0\fcomment\rmarkdown\20markdown_inline\nregex\fgraphql\0" },
    loaded = true,
    only_config = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
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
  ["pytest-vim-compiler"] = {
    config = { "\27LJ\2\n7\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0\vpytest\rcompiler\bcmd\bvimÕ\1\1\0\n\0\v\0\0186\0\0\0009\0\1\0009\0\2\0006\1\0\0009\1\1\0019\1\3\1\18\2\1\0005\4\4\0005\5\a\0\18\6\0\0'\b\5\0005\t\6\0B\6\3\2=\6\b\0053\6\t\0=\6\n\5B\2\3\1K\0\1\0\rcallback\0\ngroup\1\0\1\fpattern\t*.py\1\0\1\nclear\2\24pytest_vim_compiler\1\2\0\0\16ColorScheme\24nvim_create_autocmd\24nvim_create_augroup\bapi\bvim\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/pytest-vim-compiler",
    url = "https://github.com/5long/pytest-vim-compiler"
  },
  ["quick-scope"] = {
    config = { "\27LJ\2\nº\2\0\0\n\0\16\0 6\0\0\0009\0\1\0)\1 \3=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0006\0\5\0009\0\6\0009\0\a\0B\0\1\0016\0\0\0009\0\b\0009\0\t\0006\1\0\0009\1\b\0019\1\n\1\18\2\1\0005\4\v\0005\5\r\0\18\6\0\0'\b\a\0005\t\f\0B\6\3\2=\6\14\0056\6\5\0009\6\6\0069\6\a\6=\6\15\5B\2\3\1K\0\1\0\rcallback\ngroup\1\0\1\fpattern\6*\1\0\1\nclear\2\1\2\0\0\16ColorScheme\24nvim_create_autocmd\24nvim_create_augroup\bapi\23quick_scope_colors\r_configs\a_G\1\5\0\0\6f\6F\6t\6T\25qs_highlight_on_keys\17qs_max_chars\6g\bvim\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/quick-scope",
    url = "https://github.com/unblevable/quick-scope"
  },
  ["smart-splits.nvim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/smart-splits.nvim",
    url = "https://github.com/mrjones2014/smart-splits.nvim"
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
    after = { "gruvbox.nvim" },
    config = { "\27LJ\2\n”\6\0\0\n\0*\00086\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0025\2\6\0005\3\4\0009\4\3\1=\4\5\3=\3\a\0025\3\b\0009\4\3\1=\4\t\3=\3\n\0025\3\v\0009\4\f\0005\6\22\0005\a\14\0005\b\r\0=\b\15\a5\b\17\0005\t\16\0=\t\18\b5\t\19\0=\t\20\b=\b\21\a=\a\23\0065\a\24\0=\3\25\a=\2\26\a5\b\27\0=\b\20\a=\a\28\0065\a\30\0005\b\29\0=\b\31\a5\b!\0005\t \0=\t\"\b=\b#\a5\b$\0=\3\25\b=\b%\a5\b&\0=\3\25\b=\b'\a=\a(\6B\4\2\0019\4)\0'\6\15\0B\4\2\0019\4)\0'\6\21\0B\4\2\1K\0\1\0\19load_extension\fpickers\18spell_suggest\1\0\1\ntheme\bivy\14registers\1\0\1\ntheme\bivy\15git_status\14git_icons\1\0\0\1\0\a\fchanged\bÔÅö\frenamed\bÔöñ\nadded\bÔÅï\runmerged\bÔòØ\fdeleted\bÔÅñ\14untracked\bÔÅô\vcopied\bÔÑ∏\15find_files\1\0\0\1\0\1\vhidden\2\rdefaults\1\4\0\0\v%.git/\19%/__pycache__/\f%/data/\rmappings\16borderchars\1\0\0\15extensions\1\0\0\17file_browser\25file_ignore_patterns\1\3\0\0\f%/.git/\19%/__pycache__/\18layout_config\1\0\6\fgrouped\2\tpath\n%:p:h\17hijack_netrw\2\14previewer\1\17display_stat\1\vhidden\2\1\0\1\nwidth\3<\bfzf\1\0\0\1\0\4\14case_mode\15smart_case\25override_file_sorter\2\28override_generic_sorter\2\nfuzzy\2\nsetup\1\t\0\0\6 \6 \6 \6 \6 \6 \6 \6 \6i\n<esc>\1\0\0\6n\1\0\0\6q\1\0\0\nclose\22telescope.actions\14telescope\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["trld.nvim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/trld.nvim",
    url = "https://github.com/Mofiqul/trld.nvim"
  },
  ["vim-ReplaceWithRegister"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-ReplaceWithRegister",
    url = "https://github.com/inkarkat/vim-ReplaceWithRegister"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-illuminate"] = {
    after = { "gruvbox.nvim" },
    config = { "\27LJ\2\n∏\1\0\0\4\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0006\3\3\0009\3\4\0039\3\5\3=\3\a\0026\3\3\0009\3\4\0039\3\b\3=\3\t\2B\0\2\1K\0\1\0\24filetypes_allowlist\21filetype_include\23filetypes_denylist\1\0\0\21filetype_exclude\r_configs\a_G\14configure\15illuminate\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-lion"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-lion",
    url = "https://github.com/tommcdo/vim-lion"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rsi"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-rsi",
    url = "https://github.com/tpope/vim-rsi"
  },
  ["vim-slime"] = {
    config = { "\27LJ\2\n]\0\0\2\0\6\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\3\0009\0\4\0009\0\5\0B\0\1\1K\0\1\0\15slime_tmux\r_configs\a_G\25slime_python_ipython\6g\bvim\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-slime",
    url = "https://github.com/jpalardy/vim-slime"
  },
  ["vim-sort-motion"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-sort-motion",
    url = "https://github.com/christoomey/vim-sort-motion"
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
  }
}

time([[Defining packer_plugins]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n¿\1\0\0\4\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\0025\3\5\0=\3\6\2B\0\2\1K\0\1\0\19preview_config\1\0\3\vborder\tnone\rrelative\vcursor\nstyle\fminimal\fkeymaps\1\0\4\23current_line_blame\2\vlinehl\1\nnumhl\2\15signcolumn\1\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n…\1\0\0\4\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0006\3\4\0009\3\5\0039\3\6\3=\3\6\0025\3\a\0=\3\b\2B\0\2\1K\0\1\0\20buftype_exclude\1\2\0\0\rterminal\21filetype_exclude\r_configs\a_G\1\0\2\31show_current_context_start\1\25show_current_context\2\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n]\0\2\6\0\5\0\v6\2\0\0009\2\1\0029\2\2\2\18\4\1\0'\5\3\0B\2\3\2\a\2\4\0X\2\2Ä+\2\2\0L\2\2\0K\0\1\0\thelp\rfiletype\24nvim_buf_get_option\bapi\bvim›\4\1\0\a\0\31\0/5\0\0\0006\1\1\0009\1\2\1\18\3\0\0006\4\3\0009\4\4\0049\4\5\4B\1\3\0026\2\6\0'\4\a\0B\2\2\0029\2\b\0025\4\t\0=\1\n\0045\5\v\0003\6\f\0=\6\r\5=\5\14\0045\5\15\0=\5\16\0045\5\17\0=\5\18\0045\5\19\0=\5\20\0046\5\3\0009\5\4\0059\5\21\5B\5\1\2=\5\22\4B\2\2\0016\2\6\0'\4\23\0B\2\2\0029\2\b\0025\4\24\0005\5\26\0005\6\25\0=\6\27\5=\5\28\4B\2\2\0016\2\6\0'\4\29\0B\2\2\0029\2\b\0025\4\30\0B\2\2\1K\0\1\0\1\0\1\fenabled\2\vneogen\rpatterns\fdefault\1\0\0\1\4\0\0\nclass\rfunction\vmethod\1\0\3\venable\2\14max_lines\3\0\rthrottle\2\23treesitter-context\16textobjects\28treesitter_get_textobjs\fmatchup\1\0\1\venable\2\15playground\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\fdisable\0\1\0\1\venable\2\21ensure_installed\1\0\1\17sync_install\1\nsetup\28nvim-treesitter.configs\frequire\21filetype_include\r_configs\a_G\16list_extend\bvim\1\6\0\0\fcomment\rmarkdown\20markdown_inline\nregex\fgraphql\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: vim-illuminate
time([[Config for vim-illuminate]], true)
try_loadstring("\27LJ\2\n∏\1\0\0\4\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0006\3\3\0009\3\4\0039\3\5\3=\3\a\0026\3\3\0009\3\4\0039\3\b\3=\3\t\2B\0\2\1K\0\1\0\24filetypes_allowlist\21filetype_include\23filetypes_denylist\1\0\0\21filetype_exclude\r_configs\a_G\14configure\15illuminate\frequire\0", "config", "vim-illuminate")
time([[Config for vim-illuminate]], false)
-- Config for: stabilize.nvim
time([[Config for stabilize.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14stabilize\frequire\0", "config", "stabilize.nvim")
time([[Config for stabilize.nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\n/\0\0\1\0\1\0\2'\0\0\0L\0\2\0$/home/blake/.pyenv/shims/pythonÜ\2\1\0\5\0\f\0\0226\0\0\0'\2\1\0B\0\2\0029\1\2\0004\2\3\0005\3\4\0003\4\5\0=\4\6\3>\3\1\2=\2\3\0016\1\0\0'\3\a\0B\1\2\2'\2\t\0=\2\b\0016\1\0\0'\3\a\0B\1\2\0029\1\n\1'\3\v\0B\1\2\1K\0\1\0\26~/.pyenv/shims/python\nsetup\vpytest\16test_runner\15dap-python\15pythonPath\0\1\0\4\tname\16Launch file\fprogram\f${file}\frequest\vlaunch\ttype\vpython\vpython\19configurations\bdap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: numb.nvim
time([[Config for numb.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tnumb\frequire\0", "config", "numb.nvim")
time([[Config for numb.nvim]], false)
-- Config for: pytest-vim-compiler
time([[Config for pytest-vim-compiler]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\4\0\0066\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\1K\0\1\0\vpytest\rcompiler\bcmd\bvimÕ\1\1\0\n\0\v\0\0186\0\0\0009\0\1\0009\0\2\0006\1\0\0009\1\1\0019\1\3\1\18\2\1\0005\4\4\0005\5\a\0\18\6\0\0'\b\5\0005\t\6\0B\6\3\2=\6\b\0053\6\t\0=\6\n\5B\2\3\1K\0\1\0\rcallback\0\ngroup\1\0\1\fpattern\t*.py\1\0\1\nclear\2\24pytest_vim_compiler\1\2\0\0\16ColorScheme\24nvim_create_autocmd\24nvim_create_augroup\bapi\bvim\0", "config", "pytest-vim-compiler")
time([[Config for pytest-vim-compiler]], false)
-- Config for: nvim-pqf
time([[Config for nvim-pqf]], true)
try_loadstring("\27LJ\2\nu\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\nsigns\1\0\0\1\0\4\fwarning\tÔî© \nerror\tÔôô \thint\tÔ†µ \tinfo\tÔëâ \nsetup\bpqf\frequire\0", "config", "nvim-pqf")
time([[Config for nvim-pqf]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nÖ\3\0\0\f\0\17\0(6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1B\1\1\0016\1\2\0009\1\3\0019\1\5\1B\1\1\0026\2\2\0009\2\3\0029\2\6\2B\2\1\0026\3\a\0\18\5\1\0B\3\2\4H\6\fÄ8\b\6\0009\b\b\b5\n\n\0006\v\2\0009\v\3\v9\v\t\v=\v\v\n=\2\f\n5\v\r\0=\v\14\n=\a\15\nB\b\2\1F\6\3\3R\6Ú\1276\3\0\0'\5\16\0B\3\2\0029\3\b\0034\5\0\0B\3\2\1K\0\1\0\ttrld\rsettings\nflags\1\0\1\26debounce_text_changes\3ñ\1\17capabilities\14on_attach\1\0\0\24lspconfig_on_attach\nsetup\npairs\31lspconfig_get_capabilities\31lspconfig_get_lsp_settings$lspconfig_configure_diagnostics\r_configs\a_G\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\nÁ\1\0\0\4\0\a\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0005\2\5\0005\3\4\0=\3\6\2B\0\2\1K\0\1\0\21ensure_installed\1\0\0\1\n\0\0\fpyright\24lua-language-server\25bash-language-server\14julia-lsp\18rust-analyzer\ajq\vstylua\rluacheck\15shellcheck\25mason-tool-installer\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n”\6\0\0\n\0*\00086\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0025\2\6\0005\3\4\0009\4\3\1=\4\5\3=\3\a\0025\3\b\0009\4\3\1=\4\t\3=\3\n\0025\3\v\0009\4\f\0005\6\22\0005\a\14\0005\b\r\0=\b\15\a5\b\17\0005\t\16\0=\t\18\b5\t\19\0=\t\20\b=\b\21\a=\a\23\0065\a\24\0=\3\25\a=\2\26\a5\b\27\0=\b\20\a=\a\28\0065\a\30\0005\b\29\0=\b\31\a5\b!\0005\t \0=\t\"\b=\b#\a5\b$\0=\3\25\b=\b%\a5\b&\0=\3\25\b=\b'\a=\a(\6B\4\2\0019\4)\0'\6\15\0B\4\2\0019\4)\0'\6\21\0B\4\2\1K\0\1\0\19load_extension\fpickers\18spell_suggest\1\0\1\ntheme\bivy\14registers\1\0\1\ntheme\bivy\15git_status\14git_icons\1\0\0\1\0\a\fchanged\bÔÅö\frenamed\bÔöñ\nadded\bÔÅï\runmerged\bÔòØ\fdeleted\bÔÅñ\14untracked\bÔÅô\vcopied\bÔÑ∏\15find_files\1\0\0\1\0\1\vhidden\2\rdefaults\1\4\0\0\v%.git/\19%/__pycache__/\f%/data/\rmappings\16borderchars\1\0\0\15extensions\1\0\0\17file_browser\25file_ignore_patterns\1\3\0\0\f%/.git/\19%/__pycache__/\18layout_config\1\0\6\fgrouped\2\tpath\n%:p:h\17hijack_netrw\2\14previewer\1\17display_stat\1\vhidden\2\1\0\1\nwidth\3<\bfzf\1\0\0\1\0\4\14case_mode\15smart_case\25override_file_sorter\2\28override_generic_sorter\2\nfuzzy\2\nsetup\1\t\0\0\6 \6 \6 \6 \6 \6 \6 \6 \6i\n<esc>\1\0\0\6n\1\0\0\6q\1\0\0\nclose\22telescope.actions\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireı\6\1\0\r\0002\0Y6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\4\0009\3\5\3'\4\a\0=\4\6\0039\3\b\0005\5\r\0005\6\v\0009\a\t\0015\t\n\0B\a\2\2=\a\f\6=\6\14\0056\6\15\0009\6\16\0069\6\17\6B\6\1\2=\6\18\0059\6\19\0009\6\20\6=\6\21\0055\6\23\0003\a\22\0=\a\24\6=\6\25\0054\6\a\0005\a\26\0>\a\1\0065\a\27\0>\a\2\0065\a\28\0>\a\3\0065\a\29\0>\a\4\0065\a\30\0>\a\5\0065\a\31\0>\a\6\6=\6 \5B\3\2\0019\3\b\0009\3!\3'\5\"\0005\6$\0004\a\3\0005\b#\0>\b\1\a=\a \6B\3\3\0019\3\b\0009\3!\3'\5%\0005\6'\0004\a\3\0005\b&\0>\b\1\a=\a \6B\3\3\0019\3\b\0024\5\0\0B\3\2\0016\3\0\0'\5(\0B\3\2\0029\4)\0039\5*\0\18\a\5\0009\5+\5'\b,\0\18\t\4\0005\v.\0005\f-\0=\f/\vB\t\2\0A\5\2\0016\5\0\0'\a0\0B\5\2\0029\0051\5B\5\1\1K\0\1\0\14lazy_load luasnip.loaders.from_vscode\rmap_char\1\0\0\1\0\1\btex\5\17confirm_done\aon\nevent\20on_confirm_done\"nvim-autopairs.completion.cmp\1\0\0\1\0\1\tname\vbuffer\6/\1\0\0\1\0\1\tname\fcmdline\6:\fcmdline\fsources\1\0\1\tname\18latex_symbols\1\0\1\tname\fluasnip\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\1\0\1\tname\28nvim_lsp_signature_help\fsnippet\vexpand\1\0\0\0\14preselect\tNone\18PreselectMode\fmapping\17cmp_mappings\r_configs\a_G\15formatting\1\0\0\vformat\1\0\0\1\0\2\rmaxwidth\0032\14with_text\2\15cmp_format\nsetup\26menu,menuone,noselect\16completeopt\bopt\bvim\19nvim-autopairs\flspkind\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nÑ\5\0\0\6\0\31\00016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0034\4\0\0=\4\b\3=\3\n\0025\3\f\0005\4\v\0=\4\r\0034\4\3\0005\5\14\0>\5\1\4=\4\15\0035\4\16\0=\4\17\0035\4\18\0=\4\19\0035\4\20\0=\4\21\0035\4\22\0=\4\23\3=\3\24\0025\3\25\0004\4\0\0=\4\r\0034\4\0\0=\4\15\0035\4\26\0=\4\17\0035\4\27\0=\4\19\0034\4\0\0=\4\21\0034\4\0\0=\4\23\3=\3\28\0024\3\0\0=\3\29\0024\3\0\0=\3\30\2B\0\2\1K\0\1\0\15extensions\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\0\0\rfilename\1\0\0\rsections\14lualine_z\1\2\0\0\vbranch\14lualine_y\1\4\0\0\rlocation\rprogress\tdiff\14lualine_x\1\3\0\0\16searchcount\rfiletype\14lualine_c\1\2\0\0\17lsp_progress\14lualine_b\1\2\1\0\ttabs\tmode\3\1\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\23section_separators\1\0\2\nright\5\tleft\5\25component_separators\1\0\2\nright\b‚îÇ\tleft\b‚îÇ\1\0\4\18icons_enabled\2\25always_divide_middle\2\17globalstatus\2\ntheme\fgruvbox\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: vim-slime
time([[Config for vim-slime]], true)
try_loadstring("\27LJ\2\n]\0\0\2\0\6\0\t6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\3\0009\0\4\0009\0\5\0B\0\1\1K\0\1\0\15slime_tmux\r_configs\a_G\25slime_python_ipython\6g\bvim\0", "config", "vim-slime")
time([[Config for vim-slime]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\nO\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\1\nnames\1\1\2\0\0\6*\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: quick-scope
time([[Config for quick-scope]], true)
try_loadstring("\27LJ\2\nº\2\0\0\n\0\16\0 6\0\0\0009\0\1\0)\1 \3=\1\2\0006\0\0\0009\0\1\0005\1\4\0=\1\3\0006\0\5\0009\0\6\0009\0\a\0B\0\1\0016\0\0\0009\0\b\0009\0\t\0006\1\0\0009\1\b\0019\1\n\1\18\2\1\0005\4\v\0005\5\r\0\18\6\0\0'\b\a\0005\t\f\0B\6\3\2=\6\14\0056\6\5\0009\6\6\0069\6\a\6=\6\15\5B\2\3\1K\0\1\0\rcallback\ngroup\1\0\1\fpattern\6*\1\0\1\nclear\2\1\2\0\0\16ColorScheme\24nvim_create_autocmd\24nvim_create_augroup\bapi\23quick_scope_colors\r_configs\a_G\1\5\0\0\6f\6F\6t\6T\25qs_highlight_on_keys\17qs_max_chars\6g\bvim\0", "config", "quick-scope")
time([[Config for quick-scope]], false)
-- Config for: nvim-lastplace
time([[Config for nvim-lastplace]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-lastplace\frequire\0", "config", "nvim-lastplace")
time([[Config for nvim-lastplace]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\nï\2\0\0\a\0\16\1\"6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\14\0004\4\a\0009\5\3\0009\5\4\0059\5\5\5>\5\1\0049\5\3\0009\5\6\0059\5\a\5>\5\2\0049\5\3\0009\5\4\0059\5\b\5>\5\3\0049\5\3\0009\5\6\0059\5\t\5>\5\4\0049\5\3\0009\5\4\0059\5\n\5>\5\5\0046\5\v\0009\5\f\0059\5\r\5B\5\1\0?\5\0\0=\4\15\3B\1\2\1K\0\1\0\fsources\1\0\0\23get_juliaformatter\r_configs\a_G\vstylua\rluacheck\ajq\vpylint\16diagnostics\nblack\15formatting\rbuiltins\nsetup\fnull-ls\frequire\rÄÄ¿ô\4\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd gruvbox.nvim ]]

-- Config for: gruvbox.nvim
try_loadstring("\27LJ\2\n¬\f\0\0\24\0S\0±\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\3\0009\2\4\0029\4\5\0019\5\6\1)\6\n\0)\a\1\0B\2\5\0026\3\3\0009\3\4\0039\5\5\0019\6\a\1)\a\n\0)\b\1\0B\3\5\0026\4\3\0009\4\4\0049\6\5\0019\a\b\1)\b\n\0)\t\1\0B\4\5\0026\5\3\0009\5\4\0059\a\5\0019\b\t\1)\t\n\0)\n\3\0B\5\5\0026\6\n\0009\6\v\6'\a\r\0=\a\f\0069\6\14\0005\b\15\0005\t\19\0005\n\17\0009\v\16\1=\v\18\n=\n\20\t5\n\21\0009\v\16\1=\v\18\n=\n\22\t5\n\23\0009\v\16\1=\v\18\n=\n\24\t5\n\25\0009\v\16\1=\v\18\n=\n\26\t5\n\28\0009\v\27\1=\v\29\n=\n\30\t5\n \0009\v\31\1=\v\29\n9\v\16\1=\v\18\n=\n!\t5\n\"\0009\v\31\1=\v\18\n9\v\16\1=\v\29\n=\n#\t5\n$\0009\v\31\1=\v\29\n9\v\16\1=\v\18\n=\n%\t5\n&\0=\4\18\n=\n'\t5\n(\0=\3\18\n=\n)\t5\n*\0=\2\18\n=\n+\t5\n,\0=\5\18\n=\n-\t5\n.\0009\v\16\1=\v\18\n=\n/\t5\n0\0009\v\16\1=\v\18\n=\n1\t5\n2\0009\v\16\1=\v\18\n=\n3\t=\t4\bB\6\2\0016\6\n\0009\0065\0069\0066\6'\b\1\0B\6\2\0015\6E\0005\a8\0005\b7\0009\t\5\1=\t\18\b=\b9\a5\b:\0009\t\5\1=\t\18\b=\b;\a5\b=\0009\t<\1=\t\18\b=\b>\a5\b?\0009\t<\1=\t\18\b=\b@\a5\bA\0009\t\5\1=\t\18\b=\bB\a5\bC\0009\t\5\1=\t\18\b=\bD\a=\aF\0065\aH\0005\bG\0009\t\16\1=\t\18\b=\bI\a5\bJ\0009\t\16\1=\t\18\b=\bK\a5\bL\0009\t\16\1=\t\18\b=\bM\a=\aN\0066\aO\0\18\t\6\0B\a\2\4H\n\19Ä6\fP\0006\14\0\0\18\15\n\0B\f\3\3\15\0\f\0X\14\rÄ6\14O\0\18\16\v\0B\14\2\4H\17\aÄ6\19\n\0009\19Q\0199\19R\19)\21\0\0\18\22\17\0\18\23\18\0B\19\4\1F\17\3\3R\17˜\127F\n\3\3R\nÎ\127K\0\1\0\16nvim_set_hl\bapi\npcall\npairs\15illuminate\25IlluminatedWordWrite\1\0\0\24IlluminatedWordRead\1\0\0\24IlluminatedWordText\1\0\0\1\0\0\14telescope\1\0\0\27TelescopePreviewNormal\1\0\0\27TelescopePreviewBorder\1\0\0\27TelescopeResultsNormal\1\0\0\27TelescopeResultsBorder\1\0\0\ndark1\26TelescopePromptNormal\1\0\0\26TelescopePromptBorder\1\0\0\1\0\0\16colorscheme\bcmd\14overrides\17MatchWordCur\1\0\0\18MatchParenCur\1\0\0\14MatchWord\1\0\0\rDiffText\1\0\2\afg\5\freverse\1\15DiffDelete\1\0\2\afg\5\freverse\1\fDiffAdd\1\0\2\afg\5\freverse\1\15DiffChange\1\0\2\afg\5\freverse\1\14IncSearch\1\0\0\14CurSearch\1\0\0\vSearch\1\0\0\18bright_yellow\31IndentBlanklineContextChar\afg\1\0\0\vlight4\17CursorLineNr\1\0\0\15CursorLine\1\0\0\16ColorColumn\1\0\0\vFolded\1\0\0\abg\1\0\0\ndark0\1\0\t\rcontrast\thard\25invert_intend_guides\1\19invert_tabline\1\17invert_signs\1\21invert_selection\1\vitalic\1\tbold\2\14underline\2\14undercurl\2\nsetup\tdark\15background\6o\bvim\19neutral_yellow\17neutral_blue\18neutral_green\16neutral_red\15dark0_hard\19color_midpoint\a_G\20gruvbox.palette\fgruvbox\frequire\0", "config", "gruvbox.nvim")

time([[Sequenced loading]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
