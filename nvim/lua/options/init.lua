-- disable builtin
vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1

vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1

vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.g.loaded_netrwSettings = 1

-- Options
vim.opt.tgc = true
vim.opt.hidden = true -- hides files when swapping between them instead of forcing a save
vim.opt.ic = true
vim.o.nosmd = true
-- Tabs & spaces
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
-- Gutter
vim.opt.number = true -- displays line numbers
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"
vim.opt.laststatus = 3
vim.o.breakindent = true
vim.o.termguicolors = true
vim.o.swapfile = false
vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")
-- vim.wo.fillchars = "eob: "

-- Undo
vim.opt.undodir = os.getenv('HOME') .. "/.config/undodir"
vim.opt.undofile = true

vim.opt.fillchars:append({
    horiz = '━',
    horizup = '┻',
    horizdown = '┳',
    vert = '┃',
    vertleft = '┨',
    vertright = '┣',
    verthoriz = '╋',
})
-- Theme
vim.opt.showmatch = true -- doesn't work
vim.opt.incsearch = true
vim.opt.inccommand = "nosplit"
vim.opt.completeopt = "menuone,noinsert,noselect"

-- Copilot
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

-- Autocommand
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})
vim.api.nvim_create_augroup("Terminal", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", { command = "set nonu", group = "Terminal", pattern = "*" })
