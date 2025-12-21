return {
  'nvim-treesitter/nvim-treesitter-context',
  event = 'VeryLazy',
  config = function()
    require('treesitter-context').setup {
      max_lines = 6, -- How many lines the context window can span
      multiline_threshold = 20,
      mode = 'cursor', -- Show context based on cursor position
      separator = nil, -- You can add a line separator if you want
    }
  end,
}
