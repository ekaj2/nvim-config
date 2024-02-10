-- Custom formatter for Django HTML
-- TODO: detect if in a Django project to split htmldjango from html
vim.g.neoformat_html_djlint = {
	exe = "djlint",
	args = {
		"-", -- read from stdin
		"--reformat",
		"--format-css",
		"--format-js",
		"--indent=2",
	},
	valid_exit_codes = { 0, 1, 130 },
	stdin = true,
}
vim.g.neoformat_enabled_html = { "djlint" }

vim.g.neoformat_json_fixjson = {
	exe = "fixjson",
	args = {
		"--write",
	},
	--valid_exit_codes = { 0, 1, 130 },
	stdin = true,
}
vim.g.neoformat_enabled_json = { "fixjson" }

vim.g.neoformat_enabled_python = { "autopep8" }

vim.g.neoformat_enabled_go = { "gofmt" }

vim.g.neoformat_go_gofmt = {
	exe = "goimports",
	stdin = true,
}

-- vim.g.neoformat_go_goimport = {
-- 	exe = "goimport",
-- 	stdin = true,
-- }

-- using this instead of `silent Neoformat`
-- autocmd VimEnter * autocmd BufWritePre * silent Neoformat
vim.g.neoformat_only_msg_on_error = 0

function _Conditional_neoformat()
	local file_path = vim.fn.expand("%:p")
	local disable_paths = {
		"reddy/lca-demo",
		"reddy/pca-demo",
	}

	for _, pattern in ipairs(disable_paths) do
		-- replace all - characters with %-
		pattern = pattern:gsub("-", "%%-")

		if file_path:match(pattern) then
			return
		end
	end

	local disable_format = vim.b.neoformat_disable or false
	if not disable_format then
		vim.cmd("Neoformat")
	end
end

vim.api.nvim_exec(
	[[
  command! -nargs=0 ConditionalNeoformat :lua _Conditional_neoformat()
]],
	false
)

vim.api.nvim_exec(
	[[
  augroup fmt
    autocmd!
    autocmd BufWritePre * ConditionalNeoformat
  augroup END
]],
	false
)
