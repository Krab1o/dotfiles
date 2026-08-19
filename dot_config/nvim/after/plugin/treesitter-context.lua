require('treesitter-context').setup {
  max_lines = 6, -- не давать контексту съедать больше 6 строк экрана
}

vim.keymap.set('n', '[c', function()
  require('treesitter-context').go_to_context(vim.v.count1)
end, { silent = true, desc = 'Jump to enclosing [c]ontext' })
