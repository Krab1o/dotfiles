vim.g.undotree_SetFocusWhenToggle = 1
vim.g.undotree_WindowLayout = 3

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- vim.api.nvim_create_autocmd("CursorMoved", {
--   callback = function()
--     local bufname = vim.api.nvim_buf_get_name(0)
--     if bufname:match("undotree_") then
--       vim.fn["undotree#UndotreeAction"]("enter")
--     end
--   end,
-- })
