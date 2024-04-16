vim.g.mapleader = " "
vim.g.globalstatus = true

require("options")

if vim.g.vscode then
  vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true })
  vim.keymap.set("i", "kj", "<ESC>", { noremap = true, silent = true })
  vim.keymap.set("t", "jk", "<C-\\><C-n>", { noremap = true, silent = true })
  vim.keymap.set("n", "<Leader>w", "<C-w>", { noremap = true, silent = true })
  vim.keymap.set("n", "<Leader>`", function()
    vim.cmd('e#')
  end, { noremap = true, silent = true })

  -- Move stuff
  vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
  vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
  vim.keymap.set("x", "<leader>p", [["_dP]])
  vim.keymap.set("n", "<C-d>", "<C-d>zz")
  vim.keymap.set("n", "<C-u>", "<C-u>zz")
  vim.keymap.set("n", "n", "nzzzv")
  vim.keymap.set("n", "N", "Nzzzv")
  vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
  vim.keymap.set("n", "<leader>qa", "ZZ")
else
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



  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function(args)
      require("conform").format({ bufnr = args.buf })
    end,
  })
end
