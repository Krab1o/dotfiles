if false then
  return {
    'github/copilot.vim',
    enabled = true,
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      vim.g.copilot_auto_trigger = true
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap('i', '<C-f>', 'copilot#Accept("<CR>")', { expr = true, silent = true, noremap = true })
    end,
  }
else
  return {}
end
