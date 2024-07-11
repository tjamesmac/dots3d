-- local prettier = { "biome" }
local prettier = { "prettierd", "prettier" }

local slow_format_filetypes = {}

return {
  "stevearc/conform.nvim",
  event = { "BufReadPost" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "=",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      javascript = { prettier },
      typescript = { prettier },
      javascriptreact = { prettier },
      typescriptreact = { prettier },
      css = { prettier },
      html = { prettier },
      svelte = { prettier },
      json = { prettier },
      jsonc = { prettier },
      -- yaml = { prettier },
      markdown = { prettier },
      graphql = { prettier },
      -- lua = { "stylua" },
      -- go = { "goimports", "gofmt" },
      -- sh = { "shfmt" },
      -- python = { "isort", "black" },
      -- zig = { "zigfmt" },
      ["_"] = { "trim_whitespace", "trim_newlines" },
    },
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
  config = function(_, opts)
    vim.list_extend(require("conform.formatters.shfmt").args, { "-i", "2" })
    opts.format_on_save = false
    opts.format_after_save = false
    require("conform").setup(opts)
  end,
}
