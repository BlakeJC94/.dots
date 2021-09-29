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
  local success, result = pcall(loadstring(s))
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
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17config.alpha\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/alpha-nvim"
  },
  ["alpha-nvim-fortune"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/alpha-nvim-fortune"
  },
  ["beacon.nvim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/beacon.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-latex-symbols"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/cmp-latex-symbols"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/cmp_luasnip"
  },
  firenvim = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.firenvim\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/firenvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/gruvbox.nvim"
  },
  hop = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15config.hop\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/hop"
  },
  ["indent-blankline.nvim"] = {
    config = { "require('config.indent-blankline')" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["julia-vim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/julia-vim"
  },
  ["lir.nvim"] = {
    config = { "\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15config.lir\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/lir.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  ["nvim-cheat.sh"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-cheat.sh"
  },
  ["nvim-cmp"] = {
    config = { "require('config.cmp')" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    config = { "require('config.lspconfig')" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  popfix = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/popfix"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  ["telescope.nvim"] = {
    config = { "require('config.telescope')" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-indent-object"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-indent-object"
  },
  ["vim-lion"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-lion"
  },
  ["vim-maximizer"] = {
    config = { "\27LJ\2\n£\1\0\0\2\0\6\0\r6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0K\0\1\0\n<F11>\"maximizer_default_mapping_key$maximizer_set_mapping_with_bang\"maximizer_set_default_mapping\6g\bvim\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-maximizer"
  },
  ["vim-peekaboo"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-peekaboo"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-slime"] = {
    config = { "\27LJ\2\nZ\0\0\2\0\5\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0K\0\1\0\25slime_python_ipython\vneovim\17slime_target\6g\bvim\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-slime"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.zen-mode\frequire\0" },
    loaded = true,
    path = "/home/blake/.local/share/nvim/site/pack/packer/start/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require('config.cmp')
time([[Config for nvim-cmp]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
require('config.indent-blankline')
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: firenvim
time([[Config for firenvim]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.firenvim\frequire\0", "config", "firenvim")
time([[Config for firenvim]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20config.zen-mode\frequire\0", "config", "zen-mode.nvim")
time([[Config for zen-mode.nvim]], false)
-- Config for: vim-slime
time([[Config for vim-slime]], true)
try_loadstring("\27LJ\2\nZ\0\0\2\0\5\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0K\0\1\0\25slime_python_ipython\vneovim\17slime_target\6g\bvim\0", "config", "vim-slime")
time([[Config for vim-slime]], false)
-- Config for: hop
time([[Config for hop]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15config.hop\frequire\0", "config", "hop")
time([[Config for hop]], false)
-- Config for: vim-maximizer
time([[Config for vim-maximizer]], true)
try_loadstring("\27LJ\2\n£\1\0\0\2\0\6\0\r6\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\0\0=\1\3\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0K\0\1\0\n<F11>\"maximizer_default_mapping_key$maximizer_set_mapping_with_bang\"maximizer_set_default_mapping\6g\bvim\0", "config", "vim-maximizer")
time([[Config for vim-maximizer]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require('config.telescope')
time([[Config for telescope.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require('config.lspconfig')
time([[Config for nvim-lspconfig]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17config.alpha\frequire\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: lir.nvim
time([[Config for lir.nvim]], true)
try_loadstring("\27LJ\2\n*\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\15config.lir\frequire\0", "config", "lir.nvim")
time([[Config for lir.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
