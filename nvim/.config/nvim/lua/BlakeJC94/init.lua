local disabled_built_ins = {
  'gzip',
  'man',
  'shada_plugin',
  'tarPlugin',
  'tar',
  'zipPlugin',
  'zip',
  'netrwPlugin',
  'tutor_mode_plugin',
  'remote_plugins',
  'spellfile_plugin',
  '2html_plugin'
}

for _, i in pairs(disabled_built_ins) do
  vim.g['loaded_' .. i] = 1
end

require("BlakeJC94.plugins")
require("BlakeJC94.options")
require("BlakeJC94.commands")
require("BlakeJC94.mappings")
require("BlakeJC94.augroups")
require("BlakeJC94.scratchpad")
