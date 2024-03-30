local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>ha", function()
	harpoon:list():append()
end)
vim.keymap.set("n", "<leader>hm", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader>q", function()
	harpoon:list():select(1)
end)
vim.keymap.set("n", "<leader>w", function()
	harpoon:list():select(2)
end)
vim.keymap.set("n", "<leader>e", function()
	harpoon:list():select(3)
end)
vim.keymap.set("n", "<leader>r", function()
	harpoon:list():select(4)
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<leader>hp", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<leader>hn", function()
	harpoon:list():next()
end)

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
	local file_paths = {}
	for _, item in ipairs(harpoon_files.items) do
		table.insert(file_paths, item.value)
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Harpoon",
			finder = require("telescope.finders").new_table({
				results = file_paths,
			}),
			previewer = conf.file_previewer({}),
			sorter = conf.generic_sorter({}),
		})
		:find()
end

vim.keymap.set("n", "<leader>ht", function()
	toggle_telescope(harpoon:list())
end, { desc = "Open harpoon window" })

-- region OLD harpoon config:

-- local mark = require("harpoon.mark")
-- local ui = require("harpoon.ui")
--
-- vim.keymap.set("n", "<leader>ha", mark.add_file)
-- vim.keymap.set("n", "<leader>hm", ui.toggle_quick_menu)
--
-- vim.keymap.set("n", "<leader>q", function()
-- 	ui.nav_file(1)
-- end)
-- vim.keymap.set("n", "<leader>w", function()
-- 	ui.nav_file(2)
-- end)
-- vim.keymap.set("n", "<leader>e", function()
-- 	ui.nav_file(3)
-- end)
-- vim.keymap.set("n", "<leader>r", function()
-- 	ui.nav_file(4)
-- end)

-- endregion
