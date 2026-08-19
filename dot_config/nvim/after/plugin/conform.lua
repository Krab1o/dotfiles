require('conform').setup {
  notify_on_error = true,
  notify_no_formatters = true,

  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },

  formatters_by_ft = {
    lua = { 'stylua' },

    c = { 'clang-format' },
    cpp = { 'clang-format' },

    go = {
      'gofmt',
      'gofumpt',
      'goimports',
      'goimports-reviser',
      'golines',
    },

    rust = { 'rustfmt', lsp_format = 'fallback' },

    python = { 'isort', 'black' },

    javascript = { 'prettier' },
    typescript = { 'prettier' },
    javascriptreact = { 'prettier' },
    typescriptreact = { 'prettier' },
    json = { 'prettier' },
    html = { 'prettier' },
    css = { 'prettier' },
    markdown = { 'prettier' },
  },

  formatters = {
    shfmt = {
      append_args = { '-i', '2' },
    },

    golines = {
      -- '-m' задаёт максимальную длину строки, после которой golines её разобьёт
      append_args = { '-m', '120' },
    },
  },
}

vim.keymap.set('', '<leader>f', function()
  require('conform').format {
    async = true,
    lsp_format = 'fallback',
  }
end, {
  desc = '[F]ormat buffer',
})

vim.api.nvim_create_user_command('ConformInfo', function()
  require('conform').info()
end, {})

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   callback = function(args)
--     require("conform").format({
--       bufnr = args.buf,
--       lsp_format = "fallback",
--     })
--   end,
-- })
