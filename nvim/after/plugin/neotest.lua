if not pcall(require, "neotest") then
  return
end

require('neotest').setup({
  adapters = {
    require('neotest-jest')({
      -- remove this in the future
      jestCommand = "brazil-build test:unit",
      -- jestConfigFile = "custom.jest.config.ts",
      -- env = { CI = true },
      -- cwd = function()
      --   return vim.fn.getcwd()
      -- end,
    }),
  }
})
