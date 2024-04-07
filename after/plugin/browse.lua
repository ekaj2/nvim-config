local public_bookmarks = {
	["openai"] = "https://chat.openai.com",
}
local ok, private_bookmarks = pcall(require, "private.private_bookmarks")
if not ok then
	private_bookmarks = {}
end
local bookmarks = vim.tbl_extend("force", public_bookmarks, private_bookmarks)

-- default values for the setup
require("browse").setup({
	-- search provider you want to use
	provider = "kagi", -- duckduckgo, bing

	-- either pass it here or just pass the table to the functions
	-- see below for more
	bookmarks = bookmarks,
})
