-- mini.ai: расширенные текстовые объекты
require('mini.ai').setup {
  n_lines = 500,
}

-- mini.surround: работа с окружением (скобки, кавычки, теги)
require('mini.surround').setup {
  mappings = {
    add = 'sa',
    delete = 'sd',
    find = 'sf',
    find_left = 'sF',
    highlight = 'sh',
    replace = 'sr',
    update_n_lines = 'sn',
  },
}

-- mini.move: перемещение строк/выделений
require('mini.move').setup {
  mappings = {
    -- Visual mode
    left = '<M-h>',
    right = '<M-l>',
    down = '<M-j>',
    up = '<M-k>',
    -- Normal mode (текущая строка)
    -- line_left = '<M-h>',
    -- line_right = '<M-l>',
    -- line_down = '<M-j>',
    -- line_up = '<M-k>',
  },
}

-- mini.splitjoin: разбивка/объединение аргументов, списков, таблиц
require('mini.splitjoin').setup {
  mappings = {
    toggle = 'gS',
    split = '',
    join = '',
  },
}

-- mini.map: миникарта буфера
local map = require 'mini.map'
map.setup {
  integrations = {
    map.gen_integration.builtin_search(),
    ---   local diagnostic_integration = map.gen_integration.diagnostic({
    ---     error = 'DiagnosticFloatingError',
    ---     warn  = 'DiagnosticFloatingWarn',
    ---     info  = 'DiagnosticFloatingInfo',
    ---     hint  = 'DiagnosticFloatingHint',
    ---   })
    map.gen_integration.diagnostic {
      error = 'DiagnosticFloatingError',
      warn = 'DiagnosticFloatingWarn',
    },
    -- map.gen_integration.gitsigns(),
  },
  symbols = {
    encode = map.gen_encode_symbols.block '4x2',
    scroll_line = '█',
    scroll_view = '┃',
  },
  window = {
    side = 'right',
    width = 10,
    winblend = 15,
    show_integration_count = false,
  },
}

vim.keymap.set('n', '<Leader>mo', map.open, { desc = 'Map open' })
vim.keymap.set('n', '<Leader>mc', map.close, { desc = 'Map close' })
vim.keymap.set('n', '<Leader>mt', map.toggle, { desc = 'Map toggle' })
vim.keymap.set('n', '<Leader>mf', map.toggle_focus, { desc = 'Map toggle focus' })
vim.keymap.set('n', '<Leader>mr', map.refresh, { desc = 'Map refresh' })
