
packer_startup = function()
    use 'wbthomason/packer.nvim'
    use 'gruvbox-community/gruvbox'
end

return require('packer').startup(packer_startup)

