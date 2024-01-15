-- setup based on the folder I'm in. If reddy/dj-proj is in the path, then use runner=django and also set an environment variable of DJANGO_SETTINGS_MODULE="config.settings". Otherwise, use "pytest" as the runner and don't do anything else

local path = vim.fn.getcwd()

-- have to escape the dash in dj-proj!
if string.find(path, "reddy/dj%-proj") then
	require("neotest").setup({
		adapters = {
			require("neotest-python")({
				runner = "django",
			}),
		},
	})
	vim.fn.setenv("DJANGO_SETTINGS_MODULE", "config.settings")
else
	require("neotest").setup({
		adapters = {
			require("neotest-python")({
				runner = "pytest",
			}),
		},
	})
end
