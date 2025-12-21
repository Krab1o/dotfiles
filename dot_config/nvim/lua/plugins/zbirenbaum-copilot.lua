if false then
  return {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = '<C-f>',
          next = '<M-]>', -- следующее
          prev = '<M-[>', -- предыдущее
          dismiss = '<C-]>', -- закрыть
        },
      },
      panel = { enabled = false },
    },
  }
else
  return {}
end
