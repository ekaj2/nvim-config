vim.api.nvim_set_keymap("n", "<leader>fe", ":Ex<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>n", ":e ~/notes.md<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>t", ":e ~/todo.md<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true, silent = true })

-- don't copy into the default register when pasting
vim.api.nvim_set_keymap("x", "<leader>p", '"_dP', { noremap = true, silent = true })

-- copy to system clipboard
vim.api.nvim_set_keymap("n", "<leader>y", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>Y", '"+Y', { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "Q", "<nop>", { noremap = true, silent = true })

