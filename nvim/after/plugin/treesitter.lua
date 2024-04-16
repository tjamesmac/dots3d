if not pcall(require, "nvim-treesitter") then
  return
end

require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "astro",
    "bash",
    "css",
    "go",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "prisma",
    "regex",
    "rust",
    "svelte",
    "terraform",
    "tsx",
    "typescript",
    "vim",
    "yaml",
    "zig"
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  sync_install = false,
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
})
