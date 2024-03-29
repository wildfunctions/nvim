require("core")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    'github/copilot.vim',
    config = function()
      vim.cmd("Copilot disable")
    end
  },
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/nvim-cmp',
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  },
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  'theprimeagen/harpoon',
  'tpope/vim-fugitive',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim'
})
