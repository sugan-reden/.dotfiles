print('hello world')

vim.opt.clipboard = 'unnamedplus'

require('reden')
require('config.lazy')

-- source current file
vim.keymap.set('n', '<space><space>x', '<cmd>source %<CR>')
-- source current line
vim.keymap.set('n', '<space>x', ':.lua<CR>')
-- source current selection
vim.keymap.set('v', '<space>x', ':lua<CR>')

-- `:lua =vim` command shows integrated neovim functions
-- `:lua =vim.api command shows integraed neovim api functions
-- knowing this, if you did `:lua =vim.api.nvim_create_autocmd` you would be calling a function
-- if needed, more info is available in the help using the following `:help some_function()`
-- e.g. `:help nvim_create_autocmd()`

-- highlight selection (with v) for a split second after yank, for clarity
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
