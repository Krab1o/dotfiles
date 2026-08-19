-- Configs
require 'config.autocmd'
require 'config.options'
require 'config.keymap'
require 'config.tabs'

-- Plugins
require 'plugins'

-- LSP (after plugins so all dependencies are on the runtimepath)
require 'config.lsp'
