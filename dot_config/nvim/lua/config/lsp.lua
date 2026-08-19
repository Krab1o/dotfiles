require('mason').setup {}
require('fidget').setup {}

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
    map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
    map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')
    map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')
    map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

    local client = vim.lsp.get_client_by_id(event.data.client_id)

    -- ruff не умеет в hover — уступаем это pyright
    if client and client.name == 'ruff' then
      client.server_capabilities.hoverProvider = false
    end

    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
      local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })
      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
        end,
      })
    end

    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
      map('<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
      end, '[T]oggle Inlay [H]ints')
    end
  end,
})

vim.diagnostic.config {
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  } or {},
  virtual_text = {
    source = 'if_many',
    spacing = 2,
    format = function(diagnostic)
      return diagnostic.message
    end,
  },
}

-- Показывать диагностику всплывающим окном при наведении/задержке курсора
-- vim.api.nvim_create_autocmd('CursorHold', {
--   desc = 'Show diagnostics in a floating window on cursor hold',
--   group = vim.api.nvim_create_augroup('diagnostic-float-on-hover', { clear = true }),
--   callback = function()
--     vim.diagnostic.open_float(nil, { focusable = false })
--   end,
-- })

vim.keymap.set('n', '<leader>q', function()
  vim.diagnostic.open_float(nil, { focusable = true })
end, { desc = 'Show line [D]ia[g]nostics' })

local capabilities = require('blink.cmp').get_lsp_capabilities()

local servers = {
  bashls = {},
  clangd = {},
  -- csharp_ls = {},
  css_variables = {},
  cssls = {},
  diagnosticls = {},
  docker_compose_language_service = {},
  dockerls = {},
  eslint = {},
  ts_ls = {},
  gitlab_ci_ls = {},
  gopls = {},
  html = {},
  -- java_language_server = {},
  jsonls = {},
  marksman = {},
  protols = {},
  -- pyright: type checking + hover. Импорты и диагностику отдаём ruff.
  pyright = {
    settings = {
      pyright = { disableOrganizeImports = true },
      python = { analysis = { ignore = { '*' } } },
    },
  },
  -- ruff: линтинг, форматирование, импорты. hover отключён в LspAttach выше.
  ruff = {
    init_options = {
      settings = {
        args = {},
      },
    },
  },
  rust_analyzer = {},
  -- typst_lsp = {},
  zls = {},
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
      },
    },
  },
}

local ensure_installed = vim.tbl_keys(servers)
vim.list_extend(ensure_installed, { 'stylua', 'clang-format', 'prettier', 'delve' })
require('mason-tool-installer').setup { ensure_installed = ensure_installed }

require('mason-lspconfig').setup {
  ensure_installed = {},
  automatic_installation = false,
  handlers = {
    function(server_name)
      local server = servers[server_name] or {}
      server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
      require('lspconfig')[server_name].setup(server)
    end,
  },
}

-- Hyprlang LSP config
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { '*.hl', 'hypr*.conf' },
  callback = function(event)
    vim.lsp.start {
      name = 'hyprlang',
      cmd = { 'hyprls' },
      root_dir = vim.fn.getcwd(),
      settings = {
        hyprls = {
          preferIgnoreFile = true, -- set to false to prefer `hyprls.ignore`
          ignore = { 'hyprlock.conf', 'hypridle.conf' },
        },
      },
    }
  end,
})

vim.lsp.config.hyprlang = {
  cmd = { 'hyprls' },
  filetypes = { 'hyprlang' },
  root_dir = function()
    return vim.fn.expand '~/.config/hypr'
  end,
  settings = {
    hyprls = {
      preferIgnoreFile = false,
      ignore = { 'hyprlock.conf', 'hypridle.conf' },
    },
  },
}
vim.lsp.enable 'hyprlang'
