local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)

  use 'wbthomason/packer.nvim'
  use {'dracula/vim', as = 'dracula'}

  use 'neovim/nvim-lspconfig'

  -- aesthetics
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/playground'

  use {'kyazdani42/nvim-web-devicons'} -- File icon
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
 end)
