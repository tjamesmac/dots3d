if not pcall(require, "neogit") then
	return
end

require("neogit").setup({
	disable_commit_confirmation = true,
	disable_insert_on_commit = false,
})
