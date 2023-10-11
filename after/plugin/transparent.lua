-- enable transparent background (for all windows)
vim.cmd("TransparentEnable")
--vim.cmd("intro |")

local colors = require("rose-pine.palette")

-- SETUP TELESCOPE COLORS
-- {
--   _experimental_nc = "#16141f",
--   base = "#191724",
--   foam = "#9ccfd8",
--   gold = "#f6c177",
--   highlight_high = "#524f67",
--   highlight_low = "#21202e",
--   highlight_med = "#403d52",
--   iris = "#c4a7e7",
--   love = "#eb6f92",
--   muted = "#6e6a86",
--   nc = "#16141f",
--   none = "NONE",
--   overlay = "#26233a",
--   pine = "#31748f",
--   rose = "#ebbcba",
--   subtle = "#908caa",
--   surface = "#1f1d2e",
--   text = "#e0def4"
-- }
local TelescopeColor = {
	TelescopeMatching = { fg = colors.foam },
	TelescopeSelection = { fg = colors.rose, bg = colors.highlight_med, bold = true },
	--TelescopePromptPrefix = { bg = colors.surface0 },
	--TelescopePromptNormal = { bg = colors.surface0 },
	--TelescopeResultsNormal = { bg = colors.text },
	--TelescopePreviewNormal = { bg = colors.text },
	TelescopePromptBorder = { fg = colors.pine },
	TelescopeResultsBorder = { fg = colors.pine },
	TelescopePreviewBorder = { fg = colors.pine },
	TelescopePromptTitle = { fg = colors.rose },
	TelescopeResultsTitle = { fg = colors.rose },
	TelescopePreviewTitle = { fg = colors.rose },
}
for hl, col in pairs(TelescopeColor) do
	vim.api.nvim_set_hl(0, hl, col)
end
