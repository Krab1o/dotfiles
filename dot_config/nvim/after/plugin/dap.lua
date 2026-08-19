local dap = require 'dap'
local dapui = require 'dapui'

require('dap-go').setup {
  delve = {
    detached = vim.fn.has 'win32' == 0,
  },
}

dapui.setup()
require('nvim-dap-virtual-text').setup()

-- dapui открывается на старте сессии и закрывается по её завершении
dap.listeners.after.event_initialized.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'DiagnosticSignError', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = '◆', texthl = 'DiagnosticSignWarn', linehl = '', numhl = '' })
vim.fn.sign_define('DapLogPoint', { text = '◆', texthl = 'DiagnosticSignInfo', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'DiagnosticSignWarn', linehl = 'Visual', numhl = '' })

vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'Debug: Step Over' })
vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'Debug: Step Into' })
vim.keymap.set('n', '<F12>', dap.step_out, { desc = 'Debug: Step Out' })

vim.keymap.set('n', '<leader>dc', dap.continue, { desc = '[D]ebug [C]ontinue' })
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = '[D]ebug Toggle [B]reakpoint' })
vim.keymap.set('n', '<leader>dB', function()
  dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, { desc = '[D]ebug Conditional [B]reakpoint' })
vim.keymap.set('n', '<leader>do', dap.step_over, { desc = '[D]ebug Step [O]ver' })
vim.keymap.set('n', '<leader>di', dap.step_into, { desc = '[D]ebug Step [I]nto' })
vim.keymap.set('n', '<leader>dO', dap.step_out, { desc = '[D]ebug Step [O]ut' })
vim.keymap.set('n', '<leader>dt', dap.terminate, { desc = '[D]ebug [T]erminate' })
vim.keymap.set('n', '<leader>dl', dap.run_last, { desc = '[D]ebug Run [L]ast' })
vim.keymap.set('n', '<leader>dr', dap.repl.open, { desc = '[D]ebug Open [R]epl' })
vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = '[D]ebug Toggle [U]I' })
vim.keymap.set({ 'n', 'v' }, '<leader>dh', require('dap.ui.widgets').hover, { desc = '[D]ebug [H]over' })

-- запуск отдельного теста/файла с тестами под курсором (go test -run ...)
vim.keymap.set('n', '<leader>dgt', function()
  require('dap-go').debug_test()
end, { desc = '[D]ebug [G]o [T]est' })
vim.keymap.set('n', '<leader>dgl', function()
  require('dap-go').debug_last_test()
end, { desc = '[D]ebug [G]o Last Test' })
