-- Need to sort out these key map things
local api = vim.api

local cwd_input = function()
  vim.ui.input({ prompt = "Cwd for Telescope: " }, function(input)
    require("telescope.builtin").find_files({ cwd = input })
  end)
end

local function branch_name()
  local branch = vim.fn.system("git branch --show-current 2> /dev/null | tr -d '\n'")
  if branch ~= "" then
    return branch
  else
    return ""
  end
end

api.nvim_set_keymap('n', "<Leader>u", "<cmd>UndotreeToggle<CR>", { noremap = true, silent = true })

api.nvim_set_keymap("i", "jk", "<ESC>", { noremap = true, silent = true })
api.nvim_set_keymap("i", "kj", "<ESC>", { noremap = true, silent = true })
api.nvim_set_keymap("t", "jk", "<C-\\><C-n>", { noremap = true, silent = true })
api.nvim_set_keymap("n", "<Leader>w", "<C-w>", { noremap = true, silent = true })
api.nvim_set_keymap("n", "<Leader>o", [[<Cmd>NvimTreeFindFileToggle<CR>]], { noremap = true, silent = true })
api.nvim_set_keymap("n", "<Leader>`", [[<Cmd>e#<CR>]], { noremap = true, silent = true })
-- -- Telescope
api.nvim_set_keymap(
  "n",
  "<Leader>ff",
  [[<Cmd>lua require('telescope.builtin').find_files()<CR>]],
  { noremap = true, silent = true }
)

vim.keymap.set("n", "<leader>fs", function()
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

api.nvim_set_keymap(
  "n",
  "<Leader>fg",
  [[<Cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>]],
  { noremap = true, silent = true }
)
api.nvim_set_keymap(
  "n",
  "<Leader>fd",
  [[<Cmd>lua require('telescope.builtin').grep_string()<CR>]],
  { noremap = true, silent = true }
)
api.nvim_set_keymap(
  "n",
  "<Leader>fb",
  [[<Cmd>lua require('telescope.builtin').buffers()<CR>]],
  { noremap = true, silent = true }
)
api.nvim_set_keymap(
  "n",
  "<Leader>fq",
  [[<Cmd>lua require('telescope.builtin').quickfix()<CR>]],
  { noremap = true, silent = true }
)
api.nvim_set_keymap("n", "<Leader>fh", [[<Cmd>Telescope harpoon marks<CR>]], { noremap = true, silent = true })
api.nvim_set_keymap("n", "<Leader>fb", [[<Cmd>lua require('telescope.builtin').git_branches()<CR>]], { noremap = true, silent = true })

-- Harpoon
api.nvim_set_keymap(
  "n",
  "<Leader>ha",
  [[<Cmd>lua require('harpoon.mark').add_file()<CR>]],
  { noremap = true, silent = true }
)
api.nvim_set_keymap(
  "n",
  "<Leader>hm",
  [[<Cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>]],
  { noremap = true, silent = true }
)
api.nvim_set_keymap(
  "n",
  "<Leader>1",
  [[<Cmd>lua require('harpoon.ui').nav_file(1)<CR>]],
  { noremap = true, silent = true }
)
api.nvim_set_keymap(
  "n",
  "<Leader>1",
  [[<Cmd>lua require('harpoon.ui').nav_file(1)<CR>]],
  { noremap = true, silent = true }
)
api.nvim_set_keymap(
  "n",
  "<Leader>2",
  [[<Cmd>lua require('harpoon.ui').nav_file(2)<CR>]],
  { noremap = true, silent = true }
)
api.nvim_set_keymap(
  "n",
  "<Leader>3",
  [[<Cmd>lua require('harpoon.ui').nav_file(3)<CR>]],
  { noremap = true, silent = true }
)
api.nvim_set_keymap(
  "n",
  "<Leader>4",
  [[<Cmd>lua require('harpoon.ui').nav_file(4)<CR>]],
  { noremap = true, silent = true }
)
-- -- Custom plugins
-- Trouble
api.nvim_set_keymap("n", "<leader>xx", "<cmd>TroubleToggle<CR>", { noremap = true, silent = true })
api.nvim_set_keymap(
  "n",
  "<leader>xw",
  "<cmd>TroubleToggle workspace_diagnostics<CR>",
  { noremap = true, silent = true }
)
api.nvim_set_keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", { noremap = true, silent = true })
api.nvim_set_keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<CR>", { noremap = true, silent = true })
api.nvim_set_keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", { noremap = true, silent = true })
api.nvim_set_keymap("n", "gR", "<cmd>TroubleToggle lsp_references<CR>", { noremap = true, silent = true })
-- Git
api.nvim_set_keymap("n", "<leader>gg", "<cmd>Neogit<CR>", { noremap = true, silent = true })
-- Alias
api.nvim_set_keymap(
  "n",
  "<leader>do",
  [[<Cmd>lua require('test').go_to_octan()<CR>]],
  { noremap = true, silent = true }
)
api.nvim_set_keymap(
  "n",
  "<leader>ds",
  [[<Cmd>lua require('test').go_to_service()<CR>]],
  { noremap = true, silent = true }
)

-- Hop
api.nvim_set_keymap(
  "",
  "f",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>"
  ,
  {}
)
api.nvim_set_keymap(
  "",
  "F",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>"
  ,
  {}
)
api.nvim_set_keymap(
  "",
  "t",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>"
  ,
  {}
)
api.nvim_set_keymap(
  "",
  "T",
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>"
  ,
  {}
)

-- luasnip
api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})
api.nvim_set_keymap("s", "<C-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", {})
api.nvim_set_keymap("i", "<C-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", {})
api.nvim_set_keymap("s", "<C-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", {})
api.nvim_set_keymap("i", "<C-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", {})

-- Move stuff
-- vim.keymap.set("n", "<Leader>fs", ":LspZeroFormat<CR>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>qa", "ZZ")

vim.keymap.set({'n', 't'}, '<C-h>', '<CMD>NavigatorLeft<CR>')
vim.keymap.set({'n', 't'}, '<C-l>', '<CMD>NavigatorRight<CR>')
vim.keymap.set({'n', 't'}, '<C-k>', '<CMD>NavigatorUp<CR>')
vim.keymap.set({'n', 't'}, '<C-j>', '<CMD>NavigatorDown<CR>')
-- vim.keymap.set({'n', 't'}, '<C-p>', '<CMD>NavigatorPrevious<CR>')
