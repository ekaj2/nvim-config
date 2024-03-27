-- Borrowed from ThePrimeagen: https://youtu.be/w7i4amO_zaE?t=355
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>fa", function()
	builtin.find_files({
		hidden = true,
	})
end)
vim.keymap.set("n", "<leader>ff", builtin.git_files, {})

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
vim.keymap.set("n", "<leader>ss", function()
	builtin.live_grep({
		path_display = {
			-- "tail",
			-- shorten = 4,
		}, -- see :h telescope.defaults.path_display
		wrap_results = false,
	})
end)

-- this doesn't work, maybe come back later
-- UPDATE: had to install ripgrep
vim.keymap.set("n", "<leader>sv", function()
	builtin.grep_string({
		path_display = {
			-- "tail",
			-- shorten = 4,
		}, -- see :h telescope.defaults.path_display
		wrap_results = true,
	})
end)

-- for django url name matching to jump to the spot in urls.py
vim.keymap.set("n", "<leader>gu", function()
	builtin.grep_string({
		-- search = 'your_search_term', -- Replace with your search term
		use_regex = true, -- Allows for using regex
		additional_args = function(opts)
			return { "-g", "urls.py" }
		end,
	})
end)
-- for django templates
vim.keymap.set("n", "<leader>gf", function()
	-- Yank the text within the nearest quotes
	vim.cmd('normal! "vyiW')

	-- Get the yanked text
	local filename = vim.fn.getreg("v")
	-- remove all non-alphanumeric characters
	filename = filename:gsub("[^%w]", "")

	-- for debugging
	-- vim.api.nvim_echo({ { filename, "White" } }, true, {})
	-- vim.cmd("sleep 2000m") -- wait for 2 seconds
	-- vim.cmd("echohl None")
	-- vim.cmd('echon ""')

	if filename ~= "" then
		require("telescope.builtin").find_files({
			-- hidden = true,
			default_text = filename,
		})
	else
		-- Fallback to generic file search if no text yanked
		require("telescope.builtin").find_files({
			hidden = true,
		})
	end
end)

-- st for "structure"
vim.keymap.set("n", "<leader>st", function()
	builtin.lsp_document_symbols({
		ignore_symbols = {
			"Variable",
		},
		prompt_title = "Search File Structure",
		preview_title = "Preview",
	})
end)

-- Taken from: https://gitlab.com/sultanahamer/dotfiles/-/blob/master/nvim/lua/telescope_setup/init.lua
-- From this answer: https://www.reddit.com/r/neovim/comments/tpnt3c/comment/i2chddu/
-- Potentially better solution for down the road: https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/telescope/custom/multi_rg.lua
local live_grep_in_glob = function(glob_pattern)
	require("telescope.builtin").live_grep({
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--glob=" .. (glob_pattern or ""),
		},
	})
end

vim.keymap.set("n", "<leader>se", function()
	vim.ui.input({ prompt = "File Glob: ", completion = "file", default = "**/*." }, live_grep_in_glob)
end)

vim.keymap.set("n", "<leader>b", function()
	builtin.buffers({
		path_display = {
			"tail",
			-- shorten = 4,
		}, -- see :h telescope.defaults.path_display
		ignore_current_buffer = true,
		-- prompt_title = "Find Buffer",
		previewer = false,
		preview_title = "Preview",
		sort_mru = true,
		-- layout_strategy = "horizontal",
		layout_config = {
			width = 50,
			height = 20,
		},
	})
end)

-- more performance improvements for telescope:
-- https://github.com/nvim-telescope/telescope.nvim/issues/623#issuecomment-792233601
-- THIS WORKS WONDERFULLY
local previewers = require("telescope.previewers")

local new_maker = function(filepath, bufnr, opts)
	opts = opts or {}

	filepath = vim.fn.expand(filepath)
	vim.loop.fs_stat(filepath, function(_, stat)
		if not stat then
			return
		end
		if stat.size > 100000 then
			return
		else
			previewers.buffer_previewer_maker(filepath, bufnr, opts)
		end
	end)
end

require("telescope").setup({
	defaults = {
		buffer_previewer_maker = new_maker,
		-- see: https://github.com/nvim-telescope/telescope.nvim/issues/1379#issuecomment-996590765
		preview = {
			treesitter = false,
		},
		log_level = "debug",
		mappings = {
			i = {
				["<C-c>"] = require("telescope.actions").close,
			},
			n = {
				["<C-c>"] = require("telescope.actions").close,
			},
		},
	},
	extensions = {
		frecency = {
			show_scores = true,
			show_unindexed = true,
			ignore_patterns = { "*.git/*", "*/tmp/*" },
			disable_devicons = false,
			default_workspace = "CWD",
			hide_current_buffer = true,
			db_safe_mode = true,
			workspaces = {
				["reddy"] = "/Users/eagle/reddy",
			},
		},
	},
})
