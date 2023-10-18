vim.keymap.set('n', "<Leader>u", "<cmd>UndotreeToggle<CR>", { noremap = true, silent = true })

vim.keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("i", "kj", "<ESC>", { noremap = true, silent = true })
vim.keymap.set("t", "jk", "<C-\\><C-n>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>w", "<C-w>", { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>`", function()
  vim.cmd('e#')
end, { noremap = true, silent = true })


vim.keymap.set("n", "<leader>f", function()
  if vim.bo.filetype ~= 'go' and vim.bo.filetype ~= 'lua' and vim.bo.filetype ~= 'rust' then
    print('Prettier')
    return vim.cmd.Neoformat('prettier')
  end
end, { desc = "Format files" })

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
-- vim.keymap.set(
--   "n",
--   "<Leader>fq",
--   [[<Cmd>lua require('telescope.builtin').quickfix()<CR>]],
--   { noremap = true, silent = true }
-- )

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
vim.keymap.set("n", "<leader>g", "<cmd>Neogit<CR>", { noremap = true, silent = true })


-- luasnip
-- vim.keymap.set("i", "<C-E>", "<Plug>luasnip-next-choice", {})
-- vim.keymap.set("s", "<C-E>", "<Plug>luasnip-next-choice", {})
-- vim.keymap.set("s", "<C-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", {})
-- vim.keymap.set("i", "<C-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", {})
-- vim.keymap.set("s", "<C-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", {})
-- vim.keymap.set("i", "<C-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", {})

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


-- restore the session for the current directory
vim.keymap.set("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]])

-- stop Persistence => session won't be saved on exit
vim.keymap.set("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]])

-- Oil
vim.keymap.set("n", "-", vim.cmd.Oil, { desc = "Open parent directory" })

vim.keymap.set("n", "<S-Down>", "<nop>", { desc = "Open parent directory" })
vim.keymap.set("n", "q:", ":", { desc = "Open parent directory" })

-- disable command history
-- vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
--
local double_quotes = vim.treesitter.query.parse(
  "javascript",
  [[((lexical_declaration) @id)]]
-- [[((string) @id)]]
)

local function get_root(bufnr)
  local parser = vim.treesitter.get_parser(0, 'javascript')
  local tree = parser.parse(parser)[1]
  vim.print(tree)
  return tree:root()
end


-- @todo need to handle new lines and... handle backticks?
-- @todo i guess that you can use the text of the whole node to check if it's appropriate
-- lexical_declaration, plus all the others and then check if they have ; at the end
local practice = function(bufnr)
  print "hello practice"
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  if vim.bo[bufnr].filetype ~= "javascript" then
    vim.notify "can only be used in javascript. should probably also be typescript"
    return
  end

  local root = get_root(bufnr)

  local changes = {}
  for id, node, metadata in double_quotes:iter_captures(root, bufnr, 0, -1) do
    local text = vim.treesitter.get_node_text(node, bufnr)
    vim.print(text)
    local range = { node:range() }
    local replaced = string.gsub(text, "'", "\"")
    table.insert(changes, 1,
      { row_start = range[1], row_end = range[3], col_start = range[2], col_end = range[4], replaced = replaced })
  end

  for _, change in ipairs(changes) do
    vim.api.nvim_buf_set_text(bufnr, change.row_start, change.col_start, change.row_end, change.col_end,
      { change.replaced })
  end
end


vim.keymap.set("n", "<leader>p", function()
  practice()
end, { desc = "Format files" })



-- local tree_thing = function()
--   local html_parser = vim.treesitter.get_string_parser(request.body, "javascript")
--   if not html_parser then
--     print "Must have html parser installed"
--     return
--   end
--
--   local tree = (html_parser:parse() or {})[1]
--   if not tree then
--     print "Failed to parse tree"
--     return
--   end
--
--   local query = vim.treesitter.query.parse(
--     "html",
--     [[
--       (
--        (element
--         (start_tag
--          (tag_name) @tag)
--         (text) @text
--        )
--
--        (#eq? @tag "title")
--       )
--     ]]
--   )
--
--   for id, node in query:iter_captures(tree:root(), request.body, 0, -1) do
--     local name = query.captures[id]
--     if name == "text" then
--       local title = vim.treesitter.get_node_text(node, request.body)
--       vim.api.nvim_input(string.format("a[%s](%s)", title, link))
--       return
--     end
--   end
-- end
