-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('BufReadPost', {
  desc = 'Set cursor on a line where buffer was closed last time',
  group = vim.api.nvim_create_augroup('setting-cursor', { clear = true }),
  pattern = '*',
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

-- always open help in vertical split
-- vim.cmd [[autocmd! FileType help wincmd L]]

vim.api.nvim_create_autocmd('FileType', {
  desc = 'Open help in vertical split',
  group = vim.api.nvim_create_augroup('open-vertical-help', { clear = true }),
  pattern = 'help',
  callback = function()
    vim.cmd 'wincmd L'
  end,
})

vim.o.autoread = true
vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'CursorHoldI', 'FocusGained' }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { '*' },
})
-- vim.api.nvim_create_autocmd('FocusGained', {
--   callback = function()
--     local manager_avail, neotree = pcall(require, 'neo-tree.sources.manager')
--     if manager_avail then
--       neotree.refresh(require('neo-tree.utils').get_current_node().source)
--     end
--   end,
-- })
