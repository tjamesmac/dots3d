local prettier = { "prettierd", "prettier" }

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "=",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  -- This will provide type hinting with LuaLS
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      javascript = prettier,
      typescript = { "prettierd", "prettier" },
      javascriptreact = prettier,
      typescriptreact = prettier,
      css = prettier,
      html = prettier,
      svelte = prettier,
      json = prettier,
      jsonc = prettier,
      -- yaml = { prettier },
      markdown = prettier,
      graphql = prettier,
      -- lua = { "stylua" },
      zig = { "zigfmt" },
      ["_"] = { "trim_whitespace", "trim_newlines" },
    },
    -- Set default options
    default_format_opts = {
      lsp_format = "fallback",
    },
    -- Set up format-on-save
    -- format_on_save = { timeout_ms = 500 },
    -- Customize formatters
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
    },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}


-- return {
--   "stevearc/conform.nvim",
--   event = { "BufReadPost" },
--   cmd = { "ConformInfo" },
--   keys = {
--     {
--       "=",
--       function()
--         -- require("conform").format({ async = true, lsp_fallback = true })
--         require("conform").format({ async = true })
--       end,
--       mode = "",
--       desc = "Format buffer",
--     },
--   },
--   opts = {
--     formatters_by_ft = {
--       javascript = prettier,
--       typescript = { "prettierd", "prettier" },
--       javascriptreact = prettier,
--       typescriptreact = prettier,
--       css = prettier,
--       html = prettier,
--       svelte = prettier,
--       json = prettier,
--       jsonc = prettier,
--       -- yaml = { prettier },
--       markdown = prettier,
--       graphql = prettier,
--       -- lua = { "stylua" },
--       zig = { "zigfmt" },
--       ["_"] = { "trim_whitespace", "trim_newlines" },
--     },
--   },
--   init = function()
--     -- If you want the formatexpr, here is the place to set it
--     vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
--   end,
--   config = function()
--     require("conform").setup({
--       log_level = vim.log.levels.DEBUG,
--       -- add your config here
--     })
--   end,
--   formatters = {
--     shfmt = {
--       prepend_args = { "-i", "2" },
--     },
--   },
-- }
