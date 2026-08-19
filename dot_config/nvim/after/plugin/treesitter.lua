-- Парсеры нужны только для nvim-treesitter-context (see treesitter-context.lua).
-- Подсветку через vim.treesitter.start() мы намеренно не включаем: она остаётся
-- на regex-syntax + LSP semantic tokens.
--
-- install() компилирует парсер через tree-sitter-cli асинхронно; при отсутствии
-- tree-sitter-cli в PATH ошибка компиляции придёт отдельным vim.notify из job'а,
-- а не синхронным исключением, так что оборачивать вызов в pcall смысла нет.
local parsers = { 'go', 'gomod', 'gosum', 'gowork' }

require('nvim-treesitter').install(parsers)
