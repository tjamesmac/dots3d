-- vim.keymap.set(
--   "n",
--   "<Leader>tt",
--   vim.cmd.Telescope,
--   { noremap = true, silent = true }
-- )
--
-- vim.keymap.set(
--   "n",
--   "<Leader>ff",
--   function()
--     vim.cmd.Telescope('find_files')
--   end,
--   { noremap = true, silent = true }
-- )
--
-- vim.keymap.set("n", "<leader>fF", function()
--   cwd_input()
-- end, { desc = "Input cwd for telescope" })
--
-- vim.keymap.set(
--   "n",
--   "<Leader>fg",
--   [[<Cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]],
--   { noremap = true, silent = true }
-- )
--
-- vim.keymap.set(
--   "n",
--   "<Leader>fd",
--   [[<Cmd>lua require('telescope.builtin').grep_string()<CR>]],
--   { noremap = true, silent = true }
-- )
-- vim.keymap.set(
--   "n",
--   "<Leader>fb",
--   [[<Cmd>lua require('telescope.builtin').buffers()<CR>]],
--   { noremap = true, silent = true }
-- )
-- vim.keymap.set(
--   "n",
--   "<Leader>fq",
--   [[<Cmd>lua require('telescope.builtin').quickfix()<CR>]],
--   { noremap = true, silent = true }
-- )
-- vim.keymap.set("n", "<Leader>fh", [[<Cmd>Telescope harpoon marks<CR>]], { noremap = true, silent = true })
-- vim.keymap.set("n", "<Leader>fb", [[<Cmd>lua require('telescope.builtin').git_branches()<CR>]],
--   { noremap = true, silent = true })


return {
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope.actions")
      -- local trouble = require("trouble.providers.telescope")
      require('telescope').setup({
        defaults = {
          -- mappings = {
          --   i = { ["<c-t>"] = trouble.open_with_trouble },
          --   n = { ["<c-t>"] = trouble.open_with_trouble },
          -- },
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
      { 'nvim-telescope/telescope-fzf-native.nvim',    build = 'make', },
      { "ThePrimeagen/harpoon",                        dependencies = "nvim-lua/plenary.nvim" },
    },
    cmd = "Telescope",
    keys = {
      { '<leader>.', '<cmd>Telescope find_files<cr>' },
      { '<leader>/', "<Cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>" }
    },
  },
  {
  },
}
