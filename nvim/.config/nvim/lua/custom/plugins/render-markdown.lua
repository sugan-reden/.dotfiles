-- Config for MeanderingProgrammer/render-markdown.nvim

return {
  'MeanderingProgrammer/render-markdown.nvim',
  -- cmd = { 'RenderMarkdown' },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
    'echasnovski/mini.nvim',
    'echasnovski/mini.icons',
  },
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {},
  config = function()
    require('render-markdown').setup({
      enabled = false,
    })
  end,
  -- config = function()
  --   require('obsidian').get_client().opts.ui.enable = false
  --   vim.api.nvim_buf_clear_namespace(0, vim.api.nvim_get_namespace()['ObsidianUI'], 0, -1)
  --   require('render-markdown').setup {}
  -- end,
}
