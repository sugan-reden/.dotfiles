return {
  'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
  config = function()
    require('lsp_lines').setup()
    vim.diagnostic.config {
      virtual_text = true, -- toggles the regular virtual text diagnostics to avoid duplication
      -- virtual_lines = true, -- toggles the lines themselves
      virtual_lines = { only_current_line = true }, -- toggles the virtual lines for the current line only.
    }
    vim.keymap.set('', '<Leader>l', require('lsp_lines').toggle, { desc = 'Toggle lsp_lines' })
  end,
}
