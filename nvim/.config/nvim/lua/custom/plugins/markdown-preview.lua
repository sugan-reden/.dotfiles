-- Config for iamcco/markdown-preview.nvim
-- Attempt: Install with yarn or npm. Attempt failed.
--[[ return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  build = 'cd app && yarn install',
  init = function()
    vim.g.mkdp_filetypes = { 'markdown' }
  end,
  ft = { 'markdown' },
} ]]

-- Attempt 2: Install without yarn or npm.
return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreview', 'MarkdownPreviewToggle', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  build = function()
    require('lazy').load { plugins = { 'markdown-preview.nvim' } }
    vim.fn['mkdp#util#install']()
  end,
  keys = {
    {
      '<leader>cp',
      ft = 'markdown',
      '<cmd>MarkdownPreviewToggle<cr>',
      desc = 'MarkdownPreview',
    },
  },
  config = function()
    vim.cmd [[do Filetype]]
  end,
}
