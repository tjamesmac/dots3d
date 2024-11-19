return {

  { "nvim-lua/plenary.nvim" },
  { "ThePrimeagen/harpoon",   dependencies = "nvim-lua/plenary.nvim", keys = { { '<leader>ha' }, { '<leader>ha' } } },
  { "stevearc/dressing.nvim", event = "BufReadPost", },
  { "windwp/nvim-autopairs",  opts = {},                              event = "BufReadPost", },
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
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {},
    event = "BufReadPost"
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
}
