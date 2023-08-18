local lsp = require('lsp-zero')

lsp.preset("recommended")

lsp.ensure_installed({
	-- TODO
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  -- ...

end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
