-- autocmd BufRead,BufEnter *.astro set filetype=astro
vim.api.nvim_create_autocmd("BufRead", {
	pattern = "*.astro",
  command = "set filetype=astro"
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.astro",
  command = "set filetype=astro"
})

