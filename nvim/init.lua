vim.g.mapleader = " "
vim.g.globalstatus = true

require("options")

local lazypath = vim.fn.stdpath("data") .. "elazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup('custom.plugins')

require('keymaps')
