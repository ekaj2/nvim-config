local uuid = require("uuid-nvim")
vim.keymap.set("n", "<leader>tu", uuid.toggle_highlighting)
vim.keymap.set("i", "<C-u>", uuid.insert_v4)
