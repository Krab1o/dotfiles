-- Colorscheme
vim.pack.add { { src = 'https://github.com/folke/tokyonight.nvim' } }

vim.pack.add { { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' } }

-- Mason + LSP toolchain
vim.pack.add {
  { src = 'https://github.com/mason-org/mason.nvim' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
  { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/j-hui/fidget.nvim' },
}

-- Treesitter: только как менеджер парсеров для nvim-treesitter-context.
-- vim.treesitter.start() нигде не вызывается — подсветка остаётся прежней
-- (regex-syntax + LSP semantic tokens от gopls и др.), треситтер её не подменяет.
vim.pack.add {
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter-context' },
}

-- Neotree
vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim' },
  -- Deps
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' }, -- not strictly required, but recommended
  { src = 'https://github.com/MunifTanjim/nui.nvim' },
}

-- Autopairs
vim.pack.add {
  { src = 'https://github.com/windwp/nvim-autopairs' },
}

-- TODO Comments
vim.pack.add {
  { src = 'https://github.com/folke/todo-comments.nvim' },
  -- Deps
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
}

-- Blink.cmp
vim.pack.add {
  {
    src = 'https://github.com/saghen/blink.cmp',
    version = 'v1.10.2',
  },
  -- Deps
  {
    src = 'https://github.com/L3MON4D3/LuaSnip',
    version = 'v2.5.0',
  },
  { src = 'https://github.com/folke/lazydev.nvim' },
}

-- Cloak
vim.pack.add {
  { src = 'https://github.com/laytan/cloak.nvim' },
}

-- Conform
vim.pack.add {
  {
    src = 'https://github.com/stevearc/conform.nvim',
  },
}

-- Gitsigns
vim.pack.add {
  { src = 'https://github.com/lewis6991/gitsigns.nvim' },
}

-- Telescope
vim.pack.add {
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },

  -- Deps
  { src = 'https://github.com/nvim-lua/plenary.nvim' },

  { src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim' },

  { src = 'https://github.com/nvim-telescope/telescope-ui-select.nvim' },

  {
    src = 'https://github.com/nvim-tree/nvim-web-devicons',
  },
}

-- Indentation
vim.pack.add {
  { src = 'https://github.com/lukas-reineke/indent-blankline.nvim' },
}

-- Lualine
vim.pack.add {
  { src = 'https://github.com/nvim-lualine/lualine.nvim' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
}

-- Tmux (replaced by smart-splits)
-- vim.pack.add {
--   { src = 'https://github.com/christoomey/vim-tmux-navigator' },
-- }

-- Which-key
vim.pack.add {
  { src = 'https://github.com/folke/which-key.nvim' },
}

-- Copilot (disabled in after/plugin/copilot.lua)
vim.pack.add {
  { src = 'https://github.com/zbirenbaum/copilot.lua' },
}

-- Vim-Be-Better (Tutorial)
vim.pack.add {
  { src = 'https://github.com/szymonwilczek/vim-be-better' },
}

-- Mini
vim.pack.add {
  { src = 'https://github.com/nvim-mini/mini.nvim' },

  { src = 'https://github.com/nvim-mini/mini.ai' },
  { src = 'https://github.com/nvim-mini/mini.surround' },
  { src = 'https://github.com/nvim-mini/mini.move' },
  { src = 'https://github.com/nvim-mini/mini.splitjoin' },
  { src = 'https://github.com/nvim-mini/mini.map' },
}

-- Undotree
vim.pack.add {
  { src = 'https://github.com/mbbill/undotree' },
}

-- Smart-splits
vim.pack.add {
  { src = 'https://github.com/mrjones2014/smart-splits.nvim' },
}

-- Fugitive
vim.pack.add {
  { src = 'https://github.com/tpope/vim-fugitive' },
}

--
-- TODO: try oil.nvim (instead of neo-tree)
--

-- Harpoon2: установлен вручную через `git clone --branch harpoon2`
-- vim.pack не поддерживает клонирование по ветке, только по тегу
