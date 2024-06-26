require("core")

local devPluginName = nil
-- local devPluginName = "myeyeshurt"

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

---@return string | nil
local function get_root_dir()
  local cwd = vim.loop.cwd()
  local root = vim.fn.system("git rev-parse --show-toplevel")
  if vim.v.shell_error == 0 and root ~= nil then
    local path = string.gsub(root, "\n", "")
    return path
  end
  return cwd
end

require("lazy").setup({
  {
    'github/copilot.vim',
    config = function()
      if vim.loop.os_uname().sysname == "Darwin" then
        print("Disabling Copiot")
        vim.cmd("Copilot disable")
      end
    end
  },
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  {
    "L3MON4D3/LuaSnip",
    lazy = false
  },
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
  {
    "theprimeagen/harpoon",
    commit = 'a38be6e0dd4c6db66997deab71fc4453ace97f9c',
    branch = "harpoon2",
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      settings = {
        save_on_toggle = false,
        sync_on_ui_close = false,
        key = function()
          return get_root_dir()
        end,
      },
    },
  },
  {
    "wildfunctions/marlinspike",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "wildfunctions/myeyeshurt",
    -- branch = "fix-session-tracking",
    opts = {
      -- minutesUntilRest = 2
    },
  },
  'tpope/vim-commentary',
  'tpope/vim-fugitive',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim'
})

if vim.fn.executable('win32yank.exe') == 1 then
  if devPluginName then
    vim.opt.rtp:prepend("/mnt/c/Users/britt/dev/" .. devPluginName)
  end

  vim.opt.clipboard = 'unnamedplus'
  vim.g.clipboard = {
    name = 'win32yank',
    copy = {
      ['+'] = 'win32yank.exe -i --crlf',
      ['*'] = 'win32yank.exe -i --crlf',
    },
    paste = {
      ['+'] = 'win32yank.exe -o --lf',
      ['*'] = 'win32yank.exe -o --lf',
    },
    cache_enabled = 0,
  }
end

if vim.loop.os_uname().sysname == "Darwin" then
  if devPluginName then
    vim.opt.rtp:prepend("~/dev/" .. devPluginName)
  end

  vim.opt.clipboard = 'unnamedplus'
  vim.g.clipboard = {
    name = 'pbcopy',
    copy = {
      ['+'] = 'pbcopy',
      ['*'] = 'pbcopy',
    },
    paste = {
      ['+'] = 'pbpaste',
      ['*'] = 'pbpaste',
    },
    cache_enabled = 1,
  }
end

if vim.loop.os_uname().sysname == "Linux" then
  --sudo apt install xclip
  if devPluginName then
    vim.opt.rtp:prepend("~/dev/" .. devPluginName)
  end

  vim.opt.clipboard = 'unnamedplus'
  vim.g.clipboard = {
    name = 'xclip',
    copy = {
      ['+'] = 'xclip -selection clipboard -in',
      ['*'] = 'xclip -selection primary -in',
    },
    paste = {
      ['+'] = 'xclip -selection clipboard -out',
      ['*'] = 'xclip -selection primary -out',
    },
    cache_enabled = 0,
  }
end
