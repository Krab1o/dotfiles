-- TABSETTINGS

-- spaces with 2 length
vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'javascript',
    'typescript',
    'javascriptreact',
    'typescriptreact',
    'lua',
    'just',
    'json',
  },
  callback = function()
    vim.bo.tabstop = 2 -- visible tab width
    vim.bo.shiftwidth = 2 -- indent width
    vim.bo.softtabstop = 2
    vim.bo.expandtab = true -- use spaces, not tabs
  end,
})

-- spaces with 4 length
vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'hyprlang',
    'rasi',
    'jsonc',
    'css',
    'scss',
    'xml',
    'cpp',
    'c',
    'sql',
  },
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
    vim.bo.expandtab = true
  end,
})

-- tabs with 4 length
vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'go',
    'sh',
    'python',
  },
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
  end,
})
