local dap = require("dap")

-- -- see this helpful article: https://miguelcrespo.co/posts/debugging-javascript-applications-with-neovim
-- -- from: https://github.com/mxsdev/nvim-dap-vscode-js?tab=readme-ov-file#setup
-- require("dap-vscode-js").setup({
-- 	-- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
-- 	-- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
-- 	-- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
-- 	adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost", "chrome" }, -- which adapters to register in nvim-dap
-- 	-- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
-- 	-- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
-- 	-- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
-- })
-- for _, language in ipairs({ "typescript", "javascript" }) do
-- 	require("dap").configurations[language] = {
-- 		{
-- 			type = "pwa-node",
-- 			request = "launch",
-- 			name = "Launch file",
-- 			program = "${file}",
-- 			cwd = "${workspaceFolder}",
-- 		},
-- 		{
-- 			type = "pwa-node",
-- 			request = "attach",
-- 			name = "Attach",
-- 			processId = require("dap.utils").pick_process,
-- 			cwd = "${workspaceFolder}",
-- 		},
-- 		{
-- 			type = "pwa-chrome",
-- 			request = "attach",
-- 			name = 'Attach to Chrome with "localhost"',
-- 			url = "http://localhost:9222",
-- 			webRoot = "${workspaceFolder}",
-- 			userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
-- 		},
-- 	}
-- end

local dapui = require("dapui")
dapui.setup({})

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", numhl = "DapBreakpoint" })
vim.fn.sign_define("DapBreakpointCondition", { text = "ﳁ", texthl = "DapBreakpoint", numhl = "DapBreakpoint" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpoint", numhl = "DapBreakpoint" })
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint", numhl = "DapLogPoint" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", numhl = "DapStopped" })

-- TODO: find out if I need to specify a setup directory like:
-- https://github.com/mfussenegger/nvim-dap-python#usage
local dap_python = require("dap-python")
dap_python.setup()

-- Note that you'll have to add debugpy as a dev dependency like:
-- poetry add --group dev debugpy
function Get_poetry_python_path()
	local handle = vim.fn.system("poetry run which python")
	local poetry_python_path = string.match(handle, "^%s*(.-)%s*$") -- Trim whitespace
	print("poetry_python_path: " .. poetry_python_path)
	return poetry_python_path
end

vim.g.python3_host_prog = "/Users/eagle/Library/Caches/pypoetry/virtualenvs/nvim-q2Inv08s-py3.11/bin/python"

-- uncomment this to use poetry python!
-- dap_python.resolve_python = function()
-- 	return Get_poetry_python_path()
-- end

-- MUST INSTALL debugpy INTO VIRTUAL ENVIRONMENT!

-- TODO: map these to neovim hotkeys
vim.keymap.set("n", "<Leader>dui", function()
	dapui.toggle()
end)

-- TODO: read through :h dap-mapping for samples and other ideas

-- db to toggle breakpoint?
vim.keymap.set("n", "<Leader>db", function()
	dap.toggle_breakpoint()
end)

-- dc to continue
vim.keymap.set("n", "<Leader>dc", function()
	dap.continue()
end)

-- ds to step over
vim.keymap.set("n", "<Leader>do", function()
	dap.step_over()
end)

-- di to step into
vim.keymap.set("n", "<Leader>di", function()
	dap.step_into()
end)

vim.keymap.set("n", "<Leader>dr", function()
	dapui.open({ reset = true })
end)

vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
	require("dap.ui.widgets").hover()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
	require("dap.ui.widgets").preview()
end)

-- Doesn't close easily, need to figure that out
-- vim.keymap.set("n", "<Leader>df", function()
-- 	local widgets = require("dap.ui.widgets")
-- 	widgets.centered_float(widgets.frames)
-- end)
-- vim.keymap.set("n", "<Leader>ds", function()
-- 	local widgets = require("dap.ui.widgets")
-- 	widgets.centered_float(widgets.scopes)
-- end)

-- TODO: look into dap-widgets

require("nvim-dap-virtual-text").setup({
	enabled = true, -- enable this plugin (the default)
	enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
	highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
	highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
	show_stop_reason = true, -- show stop reason when stopped for exceptions
	commented = false, -- prefix virtual text with comment string
	only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
	all_references = false, -- show virtual text on all all references of the variable (not only definitions)
	clear_on_continue = false, -- clear virtual text on "continue" (might cause flickering when stepping)
	--- A callback that determines how a variable is displayed or whether it should be omitted
	--- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
	--- @param buf number
	--- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
	--- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
	--- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
	--- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
	display_callback = function(variable, buf, stackframe, node, options)
		if options.virt_text_pos == "inline" then
			return " = " .. variable.value
		else
			return variable.name .. " = " .. variable.value
		end
	end,
	-- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
	virt_text_pos = vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",

	-- experimental features:
	all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
	virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
	virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
	-- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
})
