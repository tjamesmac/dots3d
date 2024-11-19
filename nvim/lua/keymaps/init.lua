vim.keymap.set('n', "<Leader>u", "<cmd>UndotreeToggle<CR>", { noremap = true, silent = true })

vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("i", "kj", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("t", "jk", "<C-\\><C-n>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>w", "<C-w>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>`", function()
  vim.cmd('e#')
end, { noremap = true, silent = true })


-- vim.keymap.set("n", "<leader>f", function()
--   if vim.bo.filetype ~= 'go' and vim.bo.filetype ~= 'lua' and vim.bo.filetype ~= 'rust' then
--     print('Prettier')
--     return vim.cmd.Neoformat('prettier')
--   end
-- end, { desc = "Format files" })

-- Lint
vim.keymap.set("n", "<leader>s", function()
  if vim.bo.filetype ~= 'go' and vim.bo.filetype ~= 'lua' and vim.bo.filetype ~= 'rust' then
    print('EslintFixAll')
    return vim.cmd.EslintFixAll()
  else
    print('LspZeroFormat')
    return vim.cmd.LspZeroFormat()
  end
end, { desc = "Format files" })

-- Telescope
vim.keymap.set(
  "n",
  "<Leader>t",
  vim.cmd.Telescope,
  { noremap = true, silent = true }
)

vim.keymap.set(
  "n",
  "<Leader>.",
  function()
    vim.cmd.Telescope('find_files')
  end,
  { noremap = true, silent = true }
)

vim.keymap.set(
  "n",
  "<Leader>/",
  [[<Cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]],
  { noremap = true, silent = true }
)

vim.keymap.set(
  "n",
  "<Leader>fd",
  [[<Cmd>lua require('telescope.builtin').grep_string()<CR>]],
  { noremap = true, silent = true }
)

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
-- vim.keymap.set("n", "gr", "<cmd>TroubleToggle lsp_references<CR>", { noremap = true, silent = true })
-- vim.keymap.set('n', 'gr', function() require('telescope.builtin').lsp_references(), { noremap = true, silent = true })
vim.keymap.set(
  "n",
  "gr",
  function()
    vim.cmd.Telescope('lsp_references')
  end,
  { noremap = true, silent = true }
)
-- Git
vim.keymap.set("n", "<leader>g", "<cmd>Neogit<CR>", { noremap = true, silent = true })


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

vim.keymap.set({ 'n', 't' }, '<C-h>', '<cmd>NavigatorLeft<CR>')
vim.keymap.set({ 'n', 't' }, '<C-l>', '<cmd>NavigatorRight<CR>')
vim.keymap.set({ 'n', 't' }, '<C-k>', '<cmd>NavigatorUp<CR>')
vim.keymap.set({ 'n', 't' }, '<C-j>', '<cmd>NavigatorDown<CR>')

-- Oil
vim.keymap.set("n", "-", vim.cmd.Oil, { desc = "Open parent directory" })

vim.keymap.set("n", "<S-Down>", "<nop>", { desc = "Open parent directory" })
vim.keymap.set("n", "q:", ":", { desc = "Open parent directory" })

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
