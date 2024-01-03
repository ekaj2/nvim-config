local lsp_zero = require("lsp-zero")

lsp_zero.preset("recommended")

lsp_zero.ensure_installed({
	-- TODO
	"tsserver",
	"html",
	"eslint",
	"gopls",
})

-- see :help lsp-zero-keybindings
-- to learn the available actions

-- (Optional) Configure lua language server for neovim
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())

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
