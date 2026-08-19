local smart_splits = require('smart-splits')

smart_splits.setup {
  resize_mode = {
    quit_key = '<ESC>',
    resize_keys = { 'h', 'j', 'k', 'l' },
    silent = false,
  },
}

-- Navigation between splits and tmux panes
vim.keymap.set('n', '<C-h>', smart_splits.move_cursor_left,  { desc = 'Move to left split' })
vim.keymap.set('n', '<C-j>', smart_splits.move_cursor_down,  { desc = 'Move to lower split' })
vim.keymap.set('n', '<C-k>', smart_splits.move_cursor_up,    { desc = 'Move to upper split' })
vim.keymap.set('n', '<C-l>', smart_splits.move_cursor_right, { desc = 'Move to right split' })

-- Resize splits
vim.keymap.set('n', '<A-h>', smart_splits.resize_left,  { desc = 'Resize split left' })
vim.keymap.set('n', '<A-j>', smart_splits.resize_down,  { desc = 'Resize split down' })
vim.keymap.set('n', '<A-k>', smart_splits.resize_up,    { desc = 'Resize split up' })
vim.keymap.set('n', '<A-l>', smart_splits.resize_right, { desc = 'Resize split right' })

-- Swap buffers between splits
vim.keymap.set('n', '<leader><leader>h', smart_splits.swap_buf_left,  { desc = 'Swap buffer left' })
vim.keymap.set('n', '<leader><leader>j', smart_splits.swap_buf_down,  { desc = 'Swap buffer down' })
vim.keymap.set('n', '<leader><leader>k', smart_splits.swap_buf_up,    { desc = 'Swap buffer up' })
vim.keymap.set('n', '<leader><leader>l', smart_splits.swap_buf_right, { desc = 'Swap buffer right' })
