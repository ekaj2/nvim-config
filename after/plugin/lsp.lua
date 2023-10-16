local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
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
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

--lspconfig.pyright.setup(lsp.pyright())
lsp.use("pyright", {
	settings = {
		python = {
			--analysis = {
			--	extraPaths = { "/path/to/my/dependencies" },
			--},
		},
	},
})

lsp.setup()
