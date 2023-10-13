-- disable netrw at the very start of your init.lua (for nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("ekaj2.packer")

-- set before remap so that leader key is already set
require("ekaj2.set")

-- call before remap so remap can setup hotkeys
require("ekaj2.gpt_notes")

require("ekaj2.remap")
