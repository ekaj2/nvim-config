vim.api.nvim_exec([[
  augroup fmt
    autocmd!
    autocmd VimEnter * autocmd BufWritePre * Neoformat
  augroup END
]], false)
