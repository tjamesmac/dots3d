local save = function()
	vim.api.nvim_command("w")
end

local custom_save = function()
	if vim.bo.filetype == "lua" then
		vim.api.nvim_command("luafile %")
		save()
	else
		save()
	end
end

vim.api.nvim_create_user_command("Save", custom_save, {
	nargs = 0,
})
