local lsp_zero = require("lsp-zero")

lsp_zero.preset("recommended")

lsp_zero.ensure_installed({
	-- TODO
})

--lsp.on_attach(function(client, bufnr)
--local opts = { buffer = bufnr, remap = false }

-- see :help lsp-zero-keybindings
-- to learn the available actions
--lsp.default_keymaps({
--buffer = bufnr,
--omit = { "<tab>" },
--})

-- pretty sure this is part of default keymaps:
--vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
-- ...

-- github copilot
-- I can't seem to get the tab overridden correctly :(
--vim.api.nvim_set_keymap('i', '<C-Space>', [[copilot#Accept("\<CR>")]], {silent = true, expr = true, noremap = true})
--vim.g.copilot_no_tab_map = true
--end)

-- (Optional) Configure lua language server for neovim
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())

--lspconfig.pyright.setup(lsp.pyright())
lsp_zero.use("pyright", {
	settings = {
		python = {
			--analysis = {
			--	extraPaths = { "/path/to/my/dependencies" },
			--},
		},
	},
})

lsp_zero.set_sign_icons({
	error = "✘",
	warn = "▲",
	hint = "⚑",
	info = "»",
})

lsp_zero.setup()
