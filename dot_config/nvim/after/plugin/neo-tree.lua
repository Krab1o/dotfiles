require('neo-tree').setup {
  -- Если floating-окно ввода сливается по цвету — заменяет его на cmdline.
  -- use_popups_for_input = false,
  window = {
    mappings = {
      ['\\'] = 'close_window',
    },
  },
  filesystem = {
    follow_current_file = { enable = true },
    use_libuv_file_watcher = true,
    filtered_items = {
      visible = true,
      show_hidden_count = true,
      hide_dotfiles = false,
      hide_gitignored = false,
    },
  },
}

vim.keymap.set('n', '\\', '<Cmd>Neotree reveal<CR>', {
  desc = 'NeoTree reveal',
  silent = true,
})

vim.api.nvim_set_hl(0, 'NeoTreeInput', { bg = '#1e1e2e' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#1e1e2e' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = '#1e1e2e' })
