return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = {
    { 'echasnovski/mini.icons', opts = {} },
    { 'nvim-tree/nvim-web-devicons', opts = {} },
  },
  config = function()
    require('oil').setup {
      default_file_explorer = true,
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ['g?'] = 'actions.show_help',
        ['<CR>'] = 'actions.select',
        ['<C-s>'] = {
          'actions.select',
          opts = { vertical = true },
          desc = 'Open the entry in a vertical split',
        },
        ['<C-h>'] = {
          'actions.select',
          opts = { horizontal = true },
          desc = 'Open the entry in a horizontal split',
        },
        ['<C-t>'] = { 'actions.select', opts = { tab = true }, desc = 'Open the entry in a new tab' },
        ['<C-p>'] = 'actions.preview',
        ['q'] = 'actions.close',
        ['<C-l>'] = 'actions.refresh',
        ['-'] = 'actions.parent',
        ['`'] = 'actions.cd',
        ['~'] = { 'actions.cd', opts = { scope = 'tab' }, desc = ':tcd to the current oil directory' },
        ['gs'] = 'actions.change_sort',
        ['gx'] = 'actions.open_external',
        ['g.'] = 'actions.toggle_hidden',
        ['g\\'] = 'actions.toggle_trash',
      },
      float = {
        padding = 3,
        border = 'rounded',
      },
    }
  end,
}
