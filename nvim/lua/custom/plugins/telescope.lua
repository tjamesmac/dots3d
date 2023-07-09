return {
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope.actions")
      local trouble = require("trouble.providers.telescope")
      require('telescope').setup({
        defaults = {
          mappings = {
            i = { ["<c-t>"] = trouble.open_with_trouble },
            n = { ["<c-t>"] = trouble.open_with_trouble },
          },
          file_ignore_patterns = {
            "node_modules",
            "yarn.lock",
            "deno.lock",
          },
          layout_strategy = "bottom_pane",
          -- layout_config = {
          --   horizontal = { width = 0.9 },
          -- },
        },
      })
      require("telescope").load_extension("harpoon")
      require("telescope").load_extension("live_grep_args")
      require("telescope").load_extension("fzf")
    end,
    tag = '0.1.1',
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-live-grep-args.nvim" },
      { "ThePrimeagen/harpoon",                        dependencies = "nvim-lua/plenary.nvim" },
    },
    event = 'VeryLazy'
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim', build = 'make', event = 'VeryLazy'
  },
}
