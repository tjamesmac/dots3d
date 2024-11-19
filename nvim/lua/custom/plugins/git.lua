return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require('neogit').setup()
  end,
  cmd = "Neogit",
  keys = {
    { '<leader>g', '<cmd>Neogit<cr>', desc = "Neogit" },
  },
}
