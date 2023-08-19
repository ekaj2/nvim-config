vim.opt.guicursor = "" -- fat cursor even in insert mode
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.foldmethod = "marker"
vim.opt.foldmarker = "region,endregion"
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
--vim.opt.autochdir = true

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true


vim.opt.hlsearch = false  -- dont keep search highlighted
vim.opt.incsearch = true  -- live search

vim.opt.wrap = false

vim.opt.scrolloff = 8
vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

