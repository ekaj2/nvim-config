-- Custom formatter for Django HTML
-- TODO: detect if in a Django project to split htmldjango from html
vim.g.neoformat_html_djlint = {
	exe = "djlint",
	args = {
		"--reformat",
		"--format-css",
		"--format-js",
		"--indent=2",
	},
	valid_exit_codes = { 0, 1, 130 },
	stdin = false,
	replace = true,
}
vim.g.neoformat_enabled_html = { "djlint" }
vim.g.neoformat_verbose = 1

vim.api.nvim_exec(
	[[
  augroup fmt
    autocmd!
    autocmd VimEnter * autocmd BufWritePre * silent Neoformat
  augroup END
]],
	false
)
