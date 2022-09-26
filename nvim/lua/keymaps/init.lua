local api = vim.api

local cwd_input = function()
	vim.ui.input({ prompt = "Cwd for Telescope: " }, function(input)
		require("telescope.builtin").find_files({ cwd = input })
	end)
end

api.nvim_set_keymap("i", "jk", "<ESC>", { noremap = true, silent = true })
api.nvim_set_keymap("i", "kj", "<ESC>", { noremap = true, silent = true })
api.nvim_set_keymap("t", "jk", "<C-\\><C-n>", { noremap = true, silent = true })
api.nvim_set_keymap("n", "<Leader>w", "<C-w>", { noremap = true, silent = true })
api.nvim_set_keymap("n", "<Leader>o", [[<Cmd>NvimTreeFindFileToggle<CR>]], { noremap = true, silent = true })
api.nvim_set_keymap("n", "<Leader>`", [[<Cmd>e#<CR>]], { noremap = true, silent = true })
api.nvim_set_keymap("n", "<leader><leader>s", "<cmd>Save<CR>", { noremap = true, silent = true })
-- -- Telescope
api.nvim_set_keymap(
	"n",
	"<Leader>ff",
	[[<Cmd>lua require('telescope.builtin').find_files()<CR>]],
	{ noremap = true, silent = true }
)

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
api.nvim_set_keymap("n", "<leader>qa", [[<Cmd>lua require('test').save_quit()<CR>]], { noremap = true, silent = true })

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
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
	{}
)
api.nvim_set_keymap(
	"",
	"F",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
	{}
)
api.nvim_set_keymap(
	"",
	"t",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>",
	{}
)
api.nvim_set_keymap(
	"",
	"T",
	"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>",
	{}
)

-- Copilot
-- api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
-- luasnip
api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})
api.nvim_set_keymap("s", "<C-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", {})
api.nvim_set_keymap("i", "<C-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", {})
api.nvim_set_keymap("s", "<C-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", {})
api.nvim_set_keymap("i", "<C-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", {})
