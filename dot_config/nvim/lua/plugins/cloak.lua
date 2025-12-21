-- hiding important information (.env file creds or smth)
--
return {
  'laytan/cloak.nvim',
  event = 'BufReadPre',
  opts = {
    enabled = true,
    cloak_character = '*',
    highlight_group = 'Comment', -- Or use "Conceal"
    patterns = {
      {
        file_pattern = '.env*',
        cloak_pattern = '=.+', -- hides everything after =
        replace = nil, -- or e.g. "******"
      },
    },
  },
}
