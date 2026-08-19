require('tokyonight').setup {
  ---@diagnostic disable-next-line: missing-fields
  styles = {
    comments = { italic = false },
    keywords = { italic = false },
  },
}

vim.cmd.colorscheme 'tokyonight-storm'
