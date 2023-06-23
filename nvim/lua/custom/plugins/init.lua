return {
  { "nvim-lua/plenary.nvim" },
  { "tpope/vim-surround" },
  { "mbbill/undotree" },
  { "MunifTanjim/prettier.nvim" },
  { "norcalli/nvim-colorizer.lua" },
  { "ray-x/go.nvim" },
  { "ThePrimeagen/harpoon",       dependencies = "nvim-lua/plenary.nvim" },
  { "stevearc/dressing.nvim" },
  {
    "windwp/nvim-autopairs",
    opts = {}
  },
  {
    "TimUntersberger/neogit",
    opts = {
      disable_commit_confirmation = true,
      disable_insert_on_commit = false,
    },
    dependencies = "nvim-lua/plenary.nvim"
  },
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      position = 'right'
    }
  },
  {
    -- move between tmux and nvim easily
    "numToStr/Navigator.nvim",
    config = function()
      require('Navigator').setup()
    end
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {}
  },
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  { 'lewis6991/gitsigns.nvim' },
}
