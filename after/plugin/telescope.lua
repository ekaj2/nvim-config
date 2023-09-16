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
-- vim.keymap.set('n', '<leader>ss', function()
-- 	builtin.grep_string({
--         search = vim.fn.input("String search: "),
--         use_regex = false,
--     });
-- end)

-- vim.keymap.set('n', '<leader>sr', function()
-- 	builtin.live_grep({
--        --search = vim.fn.input("Regex search: "),
--         use_regex = true,
--     });
-- end)

-- this doesn't work, maybe come back later
-- UPDATE: had to install ripgrep
vim.keymap.set('n', '<leader>ss', function()
    builtin.live_grep({
        path_display = {
            -- "tail",
            -- shorten = 4,
        }, -- see :h telescope.defaults.path_display
        wrap_results = true
    });
end)

-- st for "structure"
vim.keymap.set('n', '<leader>st', function()
	builtin.lsp_document_symbols({
        ignore_symbols = {
            "Variable",
        },
        prompt_title = "Search File Structure",
        preview_title = "Preview",
    });
end)

-- Taken from: https://gitlab.com/sultanahamer/dotfiles/-/blob/master/nvim/lua/telescope_setup/init.lua
-- From this answer: https://www.reddit.com/r/neovim/comments/tpnt3c/comment/i2chddu/
-- Potentially better solution for down the road: https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/telescope/custom/multi_rg.lua
local live_grep_in_glob = function(glob_pattern)
  require('telescope.builtin').live_grep({
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--glob=" .. (glob_pattern or ""),
    }
  })
end

vim.keymap.set('n', '<leader>se', function()
  vim.ui.input({ prompt = "File Glob: ", completion = "file", default = "**/*." }, live_grep_in_glob)
end)
