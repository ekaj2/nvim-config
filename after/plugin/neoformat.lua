vim.api.nvim_exec(
	[[
  augroup fmt
    autocmd!
    autocmd VimEnter * autocmd BufWritePre * silent Neoformat
  augroup END
]],
	false
)
