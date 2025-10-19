-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
-- Add indentation guides even on blank lines

return {
  'lukas-reineke/indent-blankline.nvim',
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help ibl`

  main = 'ibl',
  opts = {
    scope = { enabled = true },
  },
}
