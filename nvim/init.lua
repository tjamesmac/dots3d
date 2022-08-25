-- Opacity
-- vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
-- vim.cmd("hi SpecialKey ctermfg=white ctermbg=white guifg=white guibg=white")
vim.g.gui_font_size = 40
vim.g.mapleader = " "
vim.g.globalstatus = true
require("plugins")
require("keymaps")
require("options")
require("modules")
