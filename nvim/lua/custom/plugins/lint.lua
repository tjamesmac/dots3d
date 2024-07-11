local uv = vim.uv or vim.loop
return {
  "mfussenegger/nvim-lint",
  ft = {
    "javascript",
    "javascript.jsx",
    "javascriptreact",
    "typescript",
    "typescript.tsx",
    "typescriptreact",
    "lua",
    "yaml",
  },
  opts = {
    linters_by_ft = {
      svelte = { "eslint_d" },
      javascript = { "eslint_d" },
      ["javascript.jsx"] = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescript = { "eslint_d" },
      ["typescript.tsx"] = { "eslint_d" },
      -- modify this one when you want to use biomejs
      typescriptreact = { "eslint_d" },
      lua = { "luacheck" },
      -- typescript = { "deno" },
      yaml = { "yamllint" },
    },
    linters = {},
  },
  config = function(_, opts)
    local lint = require("lint")
    lint.linters_by_ft = opts.linters_by_ft
    for k, v in pairs(opts.linters) do
      lint.linters[k] = v
      local test = vim.fs.dirname(vim.fs.find({ 'deno.json' }, { upward = true })[1])
      -- if test ~= nil and k == 'typescript' then
      if k == 'typescript' then
        print('found deno.json')
        lint.linters[k] = { 'deno' }
      else
        print('no deno.json')
      end
    end
    local timer = assert(uv.new_timer())
    local DEBOUNCE_MS = 500
    local aug = vim.api.nvim_create_augroup("Lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufWritePost", "TextChanged", "InsertLeave" }, {
      group = aug,
      callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        timer:stop()
        timer:start(
          DEBOUNCE_MS,
          0,
          vim.schedule_wrap(function()
            if vim.api.nvim_buf_is_valid(bufnr) then
              vim.api.nvim_buf_call(bufnr, function()
                lint.try_lint(nil, { ignore_errors = true })
              end)
            end
          end)
        )
      end,
    })

    local deno_project = vim.fs.dirname(vim.fs.find({ 'deno.json' }, { upward = true })[1])
    if deno_project ~= nil then
      lint.try_lint('deno')
    end
  end,
}
