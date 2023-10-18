return {

  { "nvim-lua/plenary.nvim" },
  { "mbbill/undotree",            cmd = 'UndotreeToggle' },
  { "sbdchd/neoformat",           cmd = "Neoformat" },
  { "ThePrimeagen/harpoon",       dependencies = "nvim-lua/plenary.nvim", keys = { { '<leader>ha' }, { '<leader>ha' } } },
  { 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle' },
  {
    "stevearc/dressing.nvim",
    -- lazy = true,
    event = "BufReadPost",
  },
  {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
      require('conform').setup({
        javascript = { { "prettierd", "prettier" } }
      })
    end,
  },
  {
    "windwp/nvim-autopairs",
    opts = {},
    -- lazy = true,
    event = "BufReadPost",
  },
  {
    "NeogitOrg/neogit",
    opts = {
      disable_commit_confirmation = true,
      disable_insert_on_commit = false,
    },
    dependencies = "nvim-lua/plenary.nvim",
    -- lazy = true,
    cmd = 'Neogit'
  },
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {},
    cmd = 'TroubleToggle'
  },
  {
    -- move between tmux and nvim easily
    "numToStr/Navigator.nvim",
    config = function()
      require('Navigator').setup()
    end,
    keys = {
      { "<C-j>" },
      { "<C-k>" },
      { "<C-h>" },
      { "<C-l>" },
    }
  },
  {
    'stevearc/oil.nvim',
    opts = {
      view_options = {
        show_hidden = true
      }
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = 'Oil'
  },
  {
    'lewis6991/gitsigns.nvim',
    -- lazy = true,
    cmd = 'Gitsigns'
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
    event = "BufReadPost"
  }
}
