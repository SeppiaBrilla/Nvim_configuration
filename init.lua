local lsp = require 'lsp'
local bar = require 'bar'
local settings_setup = require 'settings'
local extras = require 'extra'
local cmp = require 'cmp_config'
local telescope_setup = require 'telescope_config'
local tree = require 'tree'
local mappings = require 'mappings'

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local o = vim.o

o.expandtab = true
o.smartindent = true
o.tabstop = 4
o.shiftwidth = 4

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  bar(),
  cmp['init'](),
  lsp['config'](),
  extras(),
  telescope_setup['setup'](),
  tree['setup'](),
  {
    'rebelot/kanagawa.nvim',
  },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
            })
        end
    },
}, {})
settings_setup()
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
telescope_setup['create']()
tree['startup']()
-- Setup neovim lua configuration
require('neodev').setup()
lsp['servers']()
cmp['setup']()
mappings()
require('kanagawa').setup()
require("kanagawa").load("wave")
