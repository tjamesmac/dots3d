return {
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope.actions")
      require('telescope').setup({
        defaults = {
          file_ignore_patterns = {
            "node_modules",
            "yarn.lock",
            "deno.lock",
          },
          layout_strategy = "bottom_pane",
        },
      })
      require("telescope").load_extension("harpoon")
      require("telescope").load_extension("live_grep_args")
      require("telescope").load_extension("fzf")
    end,
    tag = '0.1.4',
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-live-grep-args.nvim" },
      { 'nvim-telescope/telescope-fzf-native.nvim',    build = 'make', },
      { "ThePrimeagen/harpoon",                        dependencies = "nvim-lua/plenary.nvim" },
    },
    cmd = "Telescope",
    keys = {
      { '<leader>.', '<cmd>Telescope find_files<cr>' },
      { '<leader>/', "<Cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>" }
    },
  },
}
