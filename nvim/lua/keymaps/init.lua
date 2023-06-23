vim.keymap.set('n', "<Leader>u", "<cmd>UndotreeToggle<CR>", { noremap = true, silent = true })

vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("i", "kj", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("t", "jk", "<C-\\><C-n>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>w", "<C-w>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>`", function()
  vim.cmd('e#')
end, { noremap = true, silent = true })
-- -- Telescope
vim.keymap.set(
  "n",
  "<Leader>tt",
  vim.cmd.Telescope,
  { noremap = true, silent = true }
)

vim.keymap.set(
  "n",
  "<Leader>ff",
  function()
    vim.cmd.Telescope('find_files')
  end,
  { noremap = true, silent = true }
)

vim.keymap.set("n", "<leader>s", function()
  if vim.bo.filetype ~= 'go' and vim.bo.filetype ~= 'lua' and vim.bo.filetype ~= 'rust' then
    print('Prettier')
    return vim.cmd.Prettier()
  else
    print('LspZeroFormat')
    return vim.cmd.LspZeroFormat()
  end
end, { desc = "Format files" })

vim.keymap.set("n", "<leader>fF", function()
  cwd_input()
end, { desc = "Input cwd for telescope" })

vim.keymap.set(
  "n",
  "<Leader>fg",
  [[<Cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]],
  { noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<Leader>fd",
  [[<Cmd>lua require('telescope.builtin').grep_string()<CR>]],
  { noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<Leader>fb",
  [[<Cmd>lua require('telescope.builtin').buffers()<CR>]],
  { noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<Leader>fq",
  [[<Cmd>lua require('telescope.builtin').quickfix()<CR>]],
  { noremap = true, silent = true }
)
vim.keymap.set("n", "<Leader>fh", [[<Cmd>Telescope harpoon marks<CR>]], { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>fb", [[<Cmd>lua require('telescope.builtin').git_branches()<CR>]],
  { noremap = true, silent = true })

-- Harpoon
vim.keymap.set(
  "n",
  "<Leader>ha",
  [[<Cmd>lua require('harpoon.mark').add_file()<CR>]],
  { noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<Leader>hm",
  [[<Cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>]],
  { noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<Leader>1",
  [[<Cmd>lua require('harpoon.ui').nav_file(1)<CR>]],
  { noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<Leader>1",
  [[<Cmd>lua require('harpoon.ui').nav_file(1)<CR>]],
  { noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<Leader>2",
  [[<Cmd>lua require('harpoon.ui').nav_file(2)<CR>]],
  { noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<Leader>3",
  [[<Cmd>lua require('harpoon.ui').nav_file(3)<CR>]],
  { noremap = true, silent = true }
)
vim.keymap.set(
  "n",
  "<Leader>4",
  [[<Cmd>lua require('harpoon.ui').nav_file(4)<CR>]],
  { noremap = true, silent = true }
)
-- -- Custom plugins
-- Trouble
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<CR>", { noremap = true, silent = true })
vim.keymap.set(
  "n",
  "<leader>xw",
  "<cmd>TroubleToggle workspace_diagnostics<CR>",
  { noremap = true, silent = true }
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gr", "<cmd>TroubleToggle lsp_references<CR>", { noremap = true, silent = true })
-- Git
vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>", { noremap = true, silent = true })


-- luasnip
vim.keymap.set("i", "<C-E>", "<Plug>luasnip-next-choice", {})
vim.keymap.set("s", "<C-E>", "<Plug>luasnip-next-choice", {})
vim.keymap.set("s", "<C-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", {})
vim.keymap.set("i", "<C-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", {})
vim.keymap.set("s", "<C-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", {})
vim.keymap.set("i", "<C-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", {})

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

vim.keymap.set({ 'n', 't' }, '<C-h>', '<CMD>NavigatorLeft<CR>')
vim.keymap.set({ 'n', 't' }, '<C-l>', '<CMD>NavigatorRight<CR>')
vim.keymap.set({ 'n', 't' }, '<C-k>', '<CMD>NavigatorUp<CR>')
vim.keymap.set({ 'n', 't' }, '<C-j>', '<CMD>NavigatorDown<CR>')
-- vim.keymap.set({'n', 't'}, '<C-p>', '<CMD>NavigatorPrevious<CR>')


-- restore the session for the current directory
vim.keymap.set("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]])

-- stop Persistence => session won't be saved on exit
vim.keymap.set("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]])

-- Oil
vim.keymap.set("n", "-", vim.cmd.Oil, { desc = "Open parent directory" })

-- disable command history
-- vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
