-- All settings that were not introduced by basic init.lua
-- and may be specified separately

-- Tab setting
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'lua' },
  callback = function()
    vim.bo.tabstop = 2 -- visible tab width
    vim.bo.shiftwidth = 2 -- indent width
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true -- use spaces, not tabs
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'go' },
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
    vim.bo.expandtab = true
  end,
})
