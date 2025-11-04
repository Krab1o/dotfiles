-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    -- close_if_last_window = true,
    filesystem = {
      follow_current_file = { enable = true },
      use_libuv_file_watcher = true,
      filtered_items = {
        visible = true,
        show_hidden_count = true,
        hide_dotfiles = false, -- 👈 show dotfiles like .git, .env, etc.
        hide_gitignored = false, -- optional: show gitignored files too
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
}
