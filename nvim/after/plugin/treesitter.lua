if not pcall(require, "nvim-treesitter") then
	return
end

local wanted_parsers = {
	"bash",
	"css",
	"html",
	"javascript",
	"json",
	"rust",
	"tsx",
	"typescript",
	"yaml",
	"lua",
	"go",
  "astro"
}

require("nvim-treesitter.configs").setup({
	ensure_installed = wanted_parsers,
	sync_install = false,
	ignore_install = {},
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	indent = {
		-- enable = true, -- this was causing issues
	},
	textsubjects = {
		enable = true,
		prev_selection = ",",
		keymaps = {
			["."] = "textsubjects-smart",
			[";"] = "textsubjects-container-outer",
			["i;"] = "textsubjects-container-inner",
		},
	},
})
