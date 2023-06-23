if not pcall(require, "github-theme") then
  return
end

require('github-theme').setup()

vim.cmd('colorscheme github_dark_high_contrast')
