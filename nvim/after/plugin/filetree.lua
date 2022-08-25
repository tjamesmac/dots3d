if not pcall(require, "nvim-tree") then
	return
end

require("nvim-tree").setup({
	view = {
		adaptive_size = true,
		side = "right",
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
})
