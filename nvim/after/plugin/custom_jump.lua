local cmd = vim.cmd

local function go_to_root()
	cmd("cd")
end

local function go_to_directory(cd)
	go_to_root()
	cmd("cd " .. cd)
end

local function go_to_octan()
	go_to_directory("./repo/octan")
end

local function go_to_service(opts)
	local service = opts.args
	if service ~= nil then
		go_to_directory("./repo/octan/services/service-" .. service)
	else
		go_to_directory("./repo/octan/services")
	end
end

local function scandir(directory, filter)
	local i, t, popen = 0, {}, io.popen
	local pfile = popen("ls " .. directory)
	for filename in pfile:lines() do
		-- This needs to be conditional
		if string.find(filename, filter) then
			local service = string.sub(filename, 9)
			i = i + 1
			t[i] = service
		end
	end
	pfile:close()
	return t
end

vim.api.nvim_create_user_command("Service", go_to_service, {
	nargs = 1,
	complete = function()
		return scandir("~/repo/octan/services", "service")
	end,
})

-- create command called Packages
vim.api.nvim_create_user_command("OctanPackages", go_to_directory, {
	nargs = 1,
	complete = function()
		return scandir("~/repo/octan/packages", "feature")
	end,
})

vim.api.nvim_create_user_command("Oct", go_to_octan, {
	nargs = 0,
})

-- TODO: move this to somewhere else
local function get_cwd(opts)
	local path = opts.args
	return cmd("lua require('telescope.builtin').find_files({ cwd = '" .. path .. "' })")
end

vim.api.nvim_create_user_command("TelescopeFindFiles", get_cwd, {
	nargs = 1,
})
