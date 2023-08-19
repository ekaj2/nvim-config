-- Borrowed from ThePrimeagen: https://youtu.be/w7i4amO_zaE?t=355
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fa', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.git_files, {})

-- this doesn't work, maybe come back later
-- UPDATE: had to install ripgrep
vim.keymap.set('n', '<leader>gr', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ")});
end)

