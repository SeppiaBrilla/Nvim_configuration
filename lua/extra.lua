function Extra_plugins()

return {-- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },
  -- {
  --   -- Theme inspired by Atom
  --   'navarasu/onedark.nvim',
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme 'onedark'
  --   end,
  -- },
  'tpope/vim-fugitive', 'tpope/vim-rhubarb',
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
     main = "ibl", opts = {},
  },
  {'akinsho/toggleterm.nvim', version = "*", config = true},
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} }}

end

return Extra_plugins
