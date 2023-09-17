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

-- vim.g.neoformat_html_djlint = {
-- 	exe = "djlint",
-- 	args = {
-- 		"-", -- read from stdin
-- 		"--reformat",
-- 		"--format-css",
-- 		"--format-js",
-- 		"--indent=2",
-- 	},
-- 	valid_exit_codes = { 0, 1, 130 },
-- 	stdin = true,
-- }
vim.g.neoformat_enabled_python = { "autopep8" }

vim.api.nvim_exec(
	[[
  augroup fmt
    autocmd!
    autocmd VimEnter * autocmd BufWritePre * silent Neoformat
  augroup END
]],
	false
)
