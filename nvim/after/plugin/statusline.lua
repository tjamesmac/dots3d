if not pcall(require, "feline.providers.lsp") then
	return
end
if not pcall(require, "feline.providers.vi_mode") then
	return
end
if not pcall(require, "feline") then
	return
end

local lsp = require("feline.providers.lsp")
local vi_mode_utils = require("feline.providers.vi_mode")

local force_inactive = {
	filetypes = {},
	buftypes = {},
	bufnames = {},
}

local components = {
	active = { {}, {}, {} },
	inactive = { {}, {}, {} },
}

local colors = {
	-- bg = "#1F1F28",
	bg = "#24292e", -- github dark theme
	black = "#282828",
	yellow = "#d8a657",
	cyan = "#89b482",
	oceanblue = "#45707a",
	green = "#a9b665",
	orange = "#e78a4e",
	violet = "#d3869b",
	magenta = "#c14a4a",
	white = "#a89984",
	fg = "#282828",
	skyblue = "#7daea3",
	red = "#ea6962",
}

local vi_mode_colors = {
	NORMAL = "red",
	OP = "green",
	INSERT = "red",
	CONFIRM = "red",
	VISUAL = "skyblue",
	LINES = "skyblue",
	BLOCK = "skyblue",
	REPLACE = "violet",
	["V-REPLACE"] = "violet",
	ENTER = "cyan",
	MORE = "cyan",
	SELECT = "orange",
	COMMAND = "green",
	SHELL = "green",
	TERM = "green",
	NONE = "yellow",
}

local vi_mode_text = {
	NORMAL = "<|",
	OP = "<|",
	INSERT = "|>",
	VISUAL = "<>",
	LINES = "<>",
	BLOCK = "<>",
	REPLACE = "<>",
	["V-REPLACE"] = "<>",
	ENTER = "<>",
	MORE = "<>",
	SELECT = "<>",
	COMMAND = "<|",
	SHELL = "<|",
	TERM = "<|",
	NONE = "<>",
	CONFIRM = "|>",
}

force_inactive.filetypes = {
	"NvimTree",
	"dbui",
	"packer",
	"startify",
	"fugitive",
	"fugitiveblame",
}

force_inactive.buftypes = {
	"terminal",
}

-- LEFT

-- vi-mode
components.active[1][1] = {
	provider = " NVIM ",
	hl = function()
		local val = {}

		val.bg = vi_mode_utils.get_mode_color()
		val.fg = "black"
		val.style = "bold"

		return val
	end,
	right_sep = " ",
}
-- git branch
components.active[1][2] = {
	provider = "git_branch",
	hl = {
		fg = "yellow",
		bg = "bg",
		style = "bold",
	},
	right_sep = {
		str = " | ",
		hl = {
			fg = "yellow",
			bg = "bg",
			style = "bold",
		},
	},
}
-- filename
components.active[1][3] = {
	provider = function()
		return vim.fn.expand("%:F")
	end,
	hl = {
		fg = "white",
		bg = "bg",
		style = "bold",
	},
	right_sep = " ",
	-- right_sep = {
	-- 	str = " > ",
	-- 	hl = {
	-- 		fg = "white",
	-- 		bg = "bg",
	-- 		style = "bold",
	-- 	},
	-- },
}

components.active[1][4] = {
	provider = function()
		return "%m"
	end,
	hl = {
		fg = "white",
		bg = "bg",
		style = "bold",
	},
}

-- MID
-- gitBranch
components.active[2][1] = {
	provider = "git_branch",
	hl = {
		fg = "yellow",
		bg = "bg",
		style = "bold",
	},
}
-- diagnosticErrors
components.active[2][1] = {
	provider = "diagnostic_errors",
	enabled = function()
		return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR)
	end,
	hl = {
		fg = "red",
		style = "bold",
	},
}
-- diagnosticWarn
components.active[2][2] = {
	provider = "diagnostic_warnings",
	enabled = function()
		return lsp.diagnostics_exist(vim.diagnostic.severity.WARN)
	end,
	hl = {
		fg = "yellow",
		style = "bold",
	},
}
-- diagnosticHint
components.active[2][3] = {
	provider = "diagnostic_hints",
	enabled = function()
		return lsp.diagnostics_exist(vim.diagnostic.severity.HINT)
	end,
	hl = {
		fg = "cyan",
		style = "bold",
	},
}
-- diagnosticInfo
components.active[2][4] = {
	provider = "diagnostic_info",
	enabled = function()
		return lsp.diagnostics_exist(vim.diagnostic.severity.INFO)
	end,
	hl = {
		fg = "skyblue",
		style = "bold",
	},
}

-- RIGHT
-- LspName
components.active[3][1] = {
	provider = "lsp_client_names",
	hl = {
		fg = "yellow",
		bg = "bg",
		style = "bold",
	},
	right_sep = " ",
}
-- fileIcon
components.active[3][2] = {
	provider = function()
		local filename = vim.fn.expand("%:t")
		local extension = vim.fn.expand("%:e")
		local icon = require("nvim-web-devicons").get_icon(filename, extension)
		if icon == nil then
			icon = ""
		end
		return icon
	end,
	hl = function()
		local val = {}
		local filename = vim.fn.expand("%:t")
		local extension = vim.fn.expand("%:e")
		local icon, name = require("nvim-web-devicons").get_icon(filename, extension)
		if icon ~= nil then
			val.fg = vim.fn.synIDattr(vim.fn.hlID(name), "fg")
		else
			val.fg = "white"
		end
		val.bg = "bg"
		val.style = "bold"
		return val
	end,
	right_sep = " ",
}
-- fileType
components.active[3][3] = {
	provider = "file_type",
	hl = function()
		local val = {}
		local filename = vim.fn.expand("%:t")
		local extension = vim.fn.expand("%:e")
		local icon, name = require("nvim-web-devicons").get_icon(filename, extension)
		if icon ~= nil then
			val.fg = vim.fn.synIDattr(vim.fn.hlID(name), "fg")
		else
			val.fg = "white"
		end
		val.bg = "bg"
		val.style = "bold"
		return val
	end,
	right_sep = " ",
}
-- fileSize
components.active[3][4] = {
	provider = "file_size",
	enabled = function()
		return vim.fn.getfsize(vim.fn.expand("%:t")) > 0
	end,
	hl = {
		fg = "skyblue",
		bg = "bg",
		style = "bold",
	},
	right_sep = " ",
}
-- lineInfo
components.active[3][6] = {
	provider = "position",
	hl = {
		fg = "white",
		bg = "bg",
		style = "bold",
	},
	right_sep = " ",
}
-- linePercent
components.active[3][7] = {
	provider = "line_percentage",
	hl = {
		fg = "white",
		bg = "bg",
		style = "bold",
	},
	right_sep = " ",
}
-- scrollBar
components.active[3][8] = {
	provider = "scroll_bar",
	hl = {
		fg = "yellow",
		bg = "bg",
	},
}

-- fileType
components.inactive[1][1] = {
	provider = "file_type",
	hl = {
		fg = "black",
		bg = "cyan",
		style = "bold",
	},
	left_sep = {
		str = " ",
		hl = {
			fg = "NONE",
			bg = "cyan",
		},
	},
	right_sep = {
		{
			str = " ",
			hl = {
				fg = "NONE",
				bg = "cyan",
			},
		},
		" ",
	},
}

require("feline").setup({
	theme = colors,
	default_bg = colors.yellow,
	default_fg = colors.yellow,
	vi_mode_colors = vi_mode_colors,
	components = components,
	force_inactive = force_inactive,
})
