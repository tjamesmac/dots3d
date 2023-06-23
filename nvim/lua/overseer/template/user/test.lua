return {
  name = "npm prettier",
  builder = function()
    -- Full path to current file (see :help expand())
    return {
      cmd = { "npm" },
      args = { 'check-prettier' },
      components = { { "on_output_quickfix", open = true }, "default" },
    }
  end,
  condition = {
    dir = "~/dir/to/code/goes/here"
  },
}
