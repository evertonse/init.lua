-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  print '=================================='
  print '    Boot Strap Being Set to True'
  print '=================================='
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd ([[packadd packer.nvim]])
end

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
    "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  }
--[[

  -- Simple plugins can be specified as strings
  --use 'rstacruz/vim-closer'
  
    -- Local plugins can be included
    -- use '~/projects/personal/hover.nvim'
    
    -- Plugins can have post-install/update hooks
    -- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
    
    -- Post-install/update hook with neovim command
    -- use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    
    -- Post-install/update hook with call of vimscript function with argument
    -- use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }
    
    -- Use specific branch, dependency and run lua file after load
    -- use {
    --   'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
    --   requires = {'kyazdani42/nvim-web-devicons'}
    -- }
    
    -- Use dependency and run lua function after load
    -- use {
      --   'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
      --   config = function() require('gitsigns').setup() end
      -- }
      
      -- -- You can specify multiple plugins in a single call
      -- use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}
      
      -- You can alias plugin names
      --use {'dracula/vim', as = 'dracula'}
--]]
  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  }

  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }

--[[    
    -- See more at: https://github.com/akinsho/bufferline.nvim
    -- color schemes can be set for this
    use {
      'akinsho/bufferline.nvim', 
      tag = "v3.*", 
      requires = 'nvim-tree/nvim-web-devicons'
    }
--]]


  -- Highlight, edit, and navigate code 
  use { 
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }
 
  -- Additional text objects via treesitter
  use { 
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  
  -- Git related plugins
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'

  --use 'navarasu/onedark.nvim' -- Theme inspired by Atom
  use 'nvim-lualine/lualine.nvim' -- Fancier statusline
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
  
  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

--[[
  -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
  local has_plugins, plugins = pcall(require, 'custom.plugins')
  if has_plugins then
    plugins(use)
  end
--]]

  -- Nice theme vs code theme
  use 'tomasiser/vim-code-dark'

  use 'nvim-tree/nvim-web-devicons'
  use {'romgrk/barbar.nvim', wants = 'nvim-web-devicons'}

  -- Another vs code theme:
  -- for more options see: https://github.com/Mofiqul/vscode.nvim
  --use 'Mofiqul/vscode.nvim'
  
  if is_bootstrap then
    require('packer').sync()
  end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return -1
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})
