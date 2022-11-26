if not pcall(require, "telescope") then
	return
end

if not pcall(require, "trouble") then
	return
end

local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

require("telescope").setup({
	defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
		file_ignore_patterns = {
			"node_modules",
			"yarn.lock",
		},
		layout_strategy = "vertical",
		layout_config = {
			-- horizontal = { width = 0.9 },
		},
	},
})

require("telescope").load_extension("harpoon")
require("telescope").load_extension("live_grep_args")
require("telescope").load_extension("fzf")
