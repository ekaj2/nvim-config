-- have to set this before using vim-ai plugin since it requires python3 support
vim.g.python3_host_prog = "/Users/eagle/Library/Caches/pypoetry/virtualenvs/nvim-q2Inv08s-py3.11/bin/python"

--vim.opt.shortmess:append("I") -- Don't pass messages to |ins-completion-menu|.

vim.opt.guicursor = "" -- fat cursor even in insert mode
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number" -- or both to do the line too

vim.opt.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"

-- vim.opt.foldmethod = "marker"
vim.opt.foldmarker = "region,endregion"
vim.opt.foldlevelstart = 99
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
--vim.opt.autochdir = true

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.hlsearch = true -- dont keep search highlighted
vim.opt.incsearch = true -- live search

vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.linebreak = true -- word wrapping

vim.opt.scrolloff = 4
vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "

-- I'm not sure how this is actually used?
-- https://github.com/rcarriga/nvim-notify#Usage
-- vim.notify = require("notify")

-- set termguicolors
vim.opt.termguicolors = true

-- abbreviations
-- set iabbrev for RS Reddy Solutions
vim.api.nvim_exec(
	[[
  iabbrev RS Reddy Solutions
]],
	false
)

vim.g.netrw_silent = 1
