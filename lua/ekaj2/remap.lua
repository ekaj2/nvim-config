vim.api.nvim_set_keymap("n", "<leader>fe", ":Ex<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Prime likes these - I don't.
-- vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true, silent = true })

-- don't copy into the default register when pasting
vim.api.nvim_set_keymap("x", "<leader>p", '"_dP', { noremap = true, silent = true })

-- copy to system clipboard
vim.api.nvim_set_keymap("n", "<leader>y", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>Y", '"+Y', { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "Q", "<nop>", { noremap = true, silent = true })

-- MY NOTES / TODO
vim.api.nvim_set_keymap("n", "<leader>n", ":e ~/notes/notes.md<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>t", ":e ~/notes/todo.md<CR>", { noremap = true, silent = true })

-- call XCommit() with <leader>ic hotkey
vim.api.nvim_set_keymap("n", "<leader>ic", ":lua XCommit()<CR>", {})

-- TODO: figure out how to make this work without making me press enter all the time
-- vim.keymap.set("n", "<leader>ic", function()
--     vim.defer_fn(function() 
--         require("ekaj2.gpt_notes")
--         XCommit()
--     end, 0)
-- end, { noremap = true, silent = false })
