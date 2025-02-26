local lsp_zero = require("lsp-zero")

lsp_zero.preset("recommended")

-- List of servers:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
lsp_zero.ensure_installed({
	-- TODO
	"ts_ls",
	"html",
	"python",
	"pyright",
	"ruff",
	"eslint",
	-- "gopls",
	-- "rust_analyzer",
	"tailwindcss", -- npm install -g @tailwindcss/language-server
	"ansiblels", -- npm install -g @tailwindcss/language-server
})

-- see :help lsp-zero-keybindings
-- to learn the available actions

-- (Optional) Configure lua language server for neovim
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())

-- Using rustaceanvim instead
-- lspconfig.rust_analyzer.setup {
--   settings = {
--     ['rust-analyzer'] = {},
--   },
-- }

lsp_zero.set_sign_icons({
	error = "✘",
	warn = "▲",
	hint = "⚑",
	info = "»",
})

lsp_zero.setup()

-- See :h lsp-zero.use
-- For when you want full control of the servers you want to use in a
-- particular project. It is meant to be called in project local config.
--
-- Ideally, you would setup some default values for your servers
-- in your neovim config using |lsp-zero.configure()|.
-- lsp_zero.use("pyright", {
-- 	settings = {
-- 		python = {
-- 			--analysis = {
-- 			--	extraPaths = { "/path/to/my/dependencies" },
-- 			--},
-- 		},
-- 	},
-- })
