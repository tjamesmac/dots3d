-- 'github-theme'
if not pcall(require, "tokyonight") then
	return
end

-- if not pcall(require, "indent_blankline") then
-- 	return
-- end



-- ColorScheme
-- require("kanagawa").setup({ globalStatus = true })
-- vim.cmd("colorscheme kanagawa")

require("tokyonight").setup({
  on_highlights = function(hl, c)
    local prompt = "#2d3149"
    hl.TelescopeNormal = {
      bg = c.bg_dark,
      fg = c.fg_dark,
    }
    hl.TelescopeBorder = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopePromptNormal = {
      bg = prompt,
    }
    hl.TelescopePromptBorder = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePromptTitle = {
      bg = prompt,
      fg = prompt,
    }
    hl.TelescopePreviewTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
    hl.TelescopeResultsTitle = {
      bg = c.bg_dark,
      fg = c.bg_dark,
    }
  end,
})

vim.cmd("colorscheme tokyonight-night")

-- require("indent_blankline").setup({
-- 	show_end_of_line = true,
-- 	space_char_blankline = " ",
-- })


-- require("github-theme").setup({
-- 	theme_style = "dark", -- "dark" | "dark_default" | "dimmed" | dark_colorblind
-- 	function_style = "NONE",
-- 	dark_sidebar = false,
-- 	sidebars = { "vista_kind", "packer" },
-- 	transparent = false, -- change this to true for opacity
-- 	-- Change the "hint" color to the "orange" color, and make the "error" color bright red
-- 	colors = { hint = "orange", error = "#ff0000" },
-- })

-- Opacity
-- vim.cmd([[hi Normal guibg=NONE ctermbg=NONE]])
