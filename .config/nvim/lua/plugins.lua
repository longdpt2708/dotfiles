local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)

  use 'wbthomason/packer.nvim' -- Have packer manage itself
  use 'nvim-lua/plenary.nvim' -- Useful lua functions used ny lots of plugins

  -- Colorschemes
  use 'Mofiqul/dracula.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig' -- enable LSP
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'L3MON4D3/LuaSnip'
  use 'windwp/nvim-autopairs' -- auto close tag {} "" ''
  use 'windwp/nvim-ts-autotag' -- auto close tag html
  use 'norcalli/nvim-colorizer.lua'
  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use({
    "jose-elias-alvarez/null-ls.nvim", -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    config = function()
        require("null-ls").setup()
    end,
    requires = { "nvim-lua/plenary.nvim" },
  })
  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client

 -- Project
  use "ahmedkhalf/project.nvim"
  use "windwp/nvim-spectre"

  -- Bufferline
  use {
    'akinsho/bufferline.nvim',
    tag = "v2.*",
    requires = 'kyazdani42/nvim-web-devicons'}
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'famiu/bufdelete.nvim'
  use {
    'rmagatti/goto-preview',
    config = function()
      require('goto-preview').setup {}
    end
  }

  -- Comment
  use "numToStr/Comment.nvim"
  use "folke/todo-comments.nvim"

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'nvim-telescope/telescope-ui-select.nvim'
  use 'cljoly/telescope-repo.nvim'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use 'nvim-treesitter/playground'

  use {'kyazdani42/nvim-web-devicons'} -- File icon
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Git
  use 'lewis6991/gitsigns.nvim'
  use "f-person/git-blame.nvim"

  -- Dashborad
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  use'lukas-reineke/indent-blankline.nvim'

  -- Debug
  use 'mfussenegger/nvim-dap'
  use 'theHamsta/nvim-dap-virtual-text'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use 'nvim-telescope/telescope-dap.nvim'
  use {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npm run compile"
  }
  use 'mxsdev/nvim-dap-vscode-js'

  -- Terminal
  use {
    "akinsho/toggleterm.nvim",
     tag = '*',
  }
 end)

 vim.cmd[[colorscheme dracula]]
