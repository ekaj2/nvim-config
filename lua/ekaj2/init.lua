-- disable netrw at the very start of your init.lua (for nvim-tree)
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- require("ekaj2.packer")

-- set before remap so that leader key is already set
require("ekaj2.set")

require("ekaj2.lazy")

-- not disabling netrw for vim-rhubarb!
require("nvim-tree").disable_netrw = false
require("nvim-tree").hijack_netrw = true

-- call before remap so remap can setup hotkeys
require("ekaj2.gpt_notes")

require("ekaj2.remap")

function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	-- 0 means the global thing so every window gets it
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939" })
	vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef" })
	vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379" })
end

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	desc = "prevent colorscheme clears self-defined DAP icon colors.",
	callback = function()
		ColorMyPencils()
	end,
})

ColorMyPencils()
