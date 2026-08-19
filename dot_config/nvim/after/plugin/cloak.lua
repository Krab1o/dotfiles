require('cloak').setup {
  enabled = true,
  cloak_character = '*',
  highlight_group = 'Comment', -- Or use "Conceal"
  patterns = {
    {
      file_pattern = '.env*',
      cloak_pattern = '=.+', -- hides everything after =
      replace = nil, -- or e.g. "******"
    },
  },
}

vim.keymap.set('n', '<leader>tc', function()
  require('cloak').toggle()
end, { desc = 'Toggle Cloak' })
