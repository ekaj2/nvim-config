vim.api.nvim_set_keymap("n", "<leader>fe", ":Ex<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Prime likes these - I don't.
-- vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })

-- vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true, silent = true })

-- don't copy into the default register when pasting
vim.api.nvim_set_keymap("x", "<leader>p", '"_dP', { noremap = true, silent = true })

-- copy to system clipboard
vim.api.nvim_set_keymap("n", "<leader>y", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>Y", '"+Y', { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "Q", "<nop>", { noremap = true, silent = true })

-- MY NOTES / TODO
vim.api.nvim_set_keymap("n", "<leader>n", ":e ~/notes/notes.md<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>to", ":e ~/notes/todo.md<CR>", { noremap = true, silent = true })

-- call XCommit() with <leader>ic hotkey
vim.api.nvim_set_keymap("n", "<leader>ic", ":lua XCommit()<CR>", {})

-- TODO: figure out how to make this work without making me press enter all the time
-- vim.keymap.set("n", "<leader>ic", function()
--     vim.defer_fn(function()
--         require("ekaj2.gpt_notes")
--         XCommit()
--     end, 0)
-- end, { noremap = true, silent = false })

-- Automatic date insertion to my notes file
-- pneumonic: "add date"
vim.keymap.set("n", "<leader>ad", function()
	local current_date = os.date("%m/%d/%Y")
	local underline = string.rep("=", #current_date)

	local lines = {
		"--------------------------------------------------------------------------------",
		"",
		current_date,
		underline,
		"",
	}

	-- vim.api.nvim_out_write("Adding date header...\n")
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	vim.api.nvim_buf_set_lines(0, row, row, false, lines)
	vim.api.nvim_win_set_cursor(0, { row + 5, 0 })
end)

-- rename with lsp
-- can't use 'r' because I'm using that with qwer harpoon bindings
-- using 'i' for "interactive" to be the beginning of refactor keybindings
vim.keymap.set("n", "<leader>ir", function()
	vim.lsp.buf.rename()
end, { noremap = true, silent = true })

-- browsing plugin "arc search" "arc bookmarks"
vim.keymap.set("n", "<leader>as", function()
	require("browse").input_search()
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ab", function()
	require("browse").open_bookmarks()
end, { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>tr", "<cmd>TroubleToggle<CR>", { noremap = true, silent = true })

-- restart the lsp with lr
vim.api.nvim_set_keymap("n", "<leader>lr", "<cmd>LspRestart<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>lr", "<cmd>LspRestart<CR>", { noremap = true, silent = true })

-- for neotest https://github.com/nvim-neotest/neotest
local neotest = require("neotest")

-- "test panel"
vim.keymap.set("n", "<leader>tp", function()
	neotest.output_panel.toggle()
end, { noremap = true, silent = true })

-- "test panel"
vim.keymap.set("n", "<leader>tcp", function()
	neotest.output_panel.clear()
end, { noremap = true, silent = true })

-- "test window"
vim.keymap.set("n", "<leader>tw", function()
	neotest.output.open()
end, { noremap = true, silent = true })

-- "test this"
vim.keymap.set("n", "<leader>tt", function()
	neotest.run.run()
end, { noremap = true, silent = true })

-- "test debug this"
-- https://github.com/mfussenegger/nvim-dap/discussions/961
vim.keymap.set("n", "<leader>tdt", function()
	neotest.run.run({ strategy = "dap" })
end, { noremap = true, silent = true })

-- "test file"
vim.keymap.set("n", "<leader>tf", function()
	require("neotest").run.run(vim.fn.expand("%"))
end, { noremap = true, silent = true })

-- "test summary"
vim.keymap.set("n", "<leader>ts", function()
	neotest.summary.toggle()
end, { noremap = true, silent = true })

-- open the doc on a method (K), this is vim.lsp.buf.hover() and pressing it again will jump into the doc
-- https://github.com/neoclide/coc.nvim/issues/1405#issuecomment-1477886794
-- q exits the hover popup

-- -- View notifications
-- vim.keymap.set("n", "<leader>vn", function()
-- 	require("telescope").extensions.notify.notify()
-- end, { noremap = true, silent = true })

-- Music
vim.keymap.set("n", "<leader>mm", function()
	require("melody").music_search()
end, { noremap = true, silent = true })
