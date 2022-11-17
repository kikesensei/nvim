local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- General plugins
  use "wbthomason/packer.nvim"         -- Have packer manage itself
  use "nvim-lua/popup.nvim"            -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"          -- Useful lua functions used ny lots of plugins
  use "ishan9299/nvim-solarized-lua"   -- Solarized dark theme for NeoVim
  use "nvim-telescope/telescope.nvim"  -- Fuzzy finder over lists
  use "nvim-lualine/lualine.nvim"      -- Status line plugin
  use "kyazdani42/nvim-tree.lua"       -- File tree plugin
  use "kyazdani42/nvim-web-devicons"   -- Icons for Neovim
  use "windwp/nvim-autopairs"          -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim"          -- Easily comment stuff
  use "lewis6991/gitsigns.nvim"        -- Add version control indicators
  use "akinsho/bufferline.nvim"        -- Add a bufferline for opened files

  -- Add a terminal inside nvim
  use { "akinsho/toggleterm.nvim", tag = "*" }

  -- Easymotion like plugin to jump anywhere in the file
  use { "phaazon/hop.nvim", branch = "v2"}

  -- Add indentation guides
  use "lukas-reineke/indent-blankline.nvim"

  -- CMP plugins
  use "hrsh7th/nvim-cmp"               -- The completion plugin
  use "hrsh7th/cmp-buffer"             -- buffer completions
  use "hrsh7th/cmp-path"               -- path completions
  use "hrsh7th/cmp-cmdline"            -- cmdline completions
  use "saadparwaiz1/cmp_luasnip"       -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"           -- LSP completions
  use "hrsh7th/cmp-nvim-lua"           -- Neovim's LUA runtime API
  use "p00f/nvim-ts-rainbow"           -- Rainbow brackets for Neovim using treesitter

  -- LSP
  use "neovim/nvim-lspconfig"           -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "jose-elias-alvarez/null-ls.nvim" -- enable formatters and linters

  -- Snippets
  use "L3MON4D3/LuaSnip"               -- snippet engine
  use "rafamadriz/friendly-snippets"   -- a bunch of snippets to use

  -- Treesitter (syntax highlighting)
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
  }

  -- Commentsting for embedded languages
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
