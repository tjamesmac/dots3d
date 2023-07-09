return {

  { "nvim-lua/plenary.nvim" },
  { "mbbill/undotree" },
  { "MunifTanjim/prettier.nvim" },
  { "norcalli/nvim-colorizer.lua" },
  { "ThePrimeagen/harpoon",       dependencies = "nvim-lua/plenary.nvim" },
  {
    "stevearc/dressing.nvim",
    event = "BufReadPre",
  },
  {
    "windwp/nvim-autopairs",
    opts = {}
  },
  {
    "NeogitOrg/neogit",
    opts = {
      disable_commit_confirmation = true,
      disable_insert_on_commit = false,
    },
    dependencies = "nvim-lua/plenary.nvim",
    event = "VeryLazy"
  },
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      position = 'right'
    },
    event = 'VeryLazy'
  },
  {
    -- move between tmux and nvim easily
    "numToStr/Navigator.nvim",
    config = function()
      require('Navigator').setup()
    end,
    event = 'VeryLazy'
  },
  {
    "folke/persistence.nvim",
    opts = {},
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = 'VeryLazy'
  },
  {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy'
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
  }
}
