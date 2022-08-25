if not pcall(require, "github-theme") then
	return
end

-- ColorScheme
-- require("kanagawa").setup({ globalStatus = true })
-- vim.cmd("colorscheme kanagawa")

require("github-theme").setup({
	theme_style = "dark", -- "dark" | "dark_default" | "dimmed" | dark_colorblind
	function_style = "NONE",
	dark_sidebar = false,
	sidebars = { "vista_kind", "packer" },
	transparent = false, -- change this to true for opacity
	-- Change the "hint" color to the "orange" color, and make the "error" color bright red
	colors = { hint = "orange", error = "#ff0000" },
	-- overrides = function(c)
	-- 	return {
	-- 		IndentBlanklineChar = { fg = "red" },
	-- 		IndentBlanklineSpaceChar = { fg = "red" },
	-- 		IndentBlanklineSpaceCharBlankline = { fg = "red" },
	-- 		IndentBlanklineContextChar = { fg = "red" },
	-- 		IndentBlanklineContextStart = { sp = "red", underline = true },
	-- 	}
	-- end,
})

-- Opacity
-- vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
