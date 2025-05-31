-- from: https://lsp-zero.netlify.app/blog/lsp-config-overview.html

return {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", ".git" },
	settings = {},
}
