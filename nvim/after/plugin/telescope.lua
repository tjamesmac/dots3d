if not pcall(require, "telescope") then
	return
end

require("telescope").setup({
	defaults = {
		file_ignore_patterns = {
			"node_modules",
			"yarn.lock",
		},
		layout_strategy = "vertical",
		layout_config = {
			vertical = { width = 0.5 },
		},
	},
})

require("telescope").load_extension("harpoon")
require("telescope").load_extension("live_grep_args")
