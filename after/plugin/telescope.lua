-- Borrowed from ThePrimeagen: https://youtu.be/w7i4amO_zaE?t=355
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fa', function()
    builtin.find_files({
        hidden = true,
    })
end)
vim.keymap.set('n', '<leader>ff', builtin.git_files, {})

-- this doesn't work, maybe come back later
-- UPDATE: had to install ripgrep
vim.keymap.set('n', '<leader>ss', function()
	builtin.grep_string({
        search = vim.fn.input("String search: "),
        use_regex = false,
    });
end)

vim.keymap.set('n', '<leader>sr', function()
	builtin.grep_string({
        search = vim.fn.input("Regex search: "),
        use_regex = true,
    });
end)

