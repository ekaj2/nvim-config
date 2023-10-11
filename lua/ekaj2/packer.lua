-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"rose-pine/neovim",
		as = "rose-pine",
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		{ run = ":TSUpdate" },
	})

	use("theprimeagen/harpoon")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	})

	--use("github/copilot.vim")

	use({
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		module = "copilot",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	})

	use({
		"zbirenbaum/copilot-cmp",
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	})

	use({
		"xiyaowong/transparent.nvim",
	})

	---- TODO: come back to this to see how I can use it better?
	--use('rcarriga/nvim-notify')

	use({
		"jackMort/ChatGPT.nvim",
		--config = function()
		--    require("chatgpt").setup()
		--end,
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	})

	-- Not working rn:
	-- https://github.com/folke/noice.nvim
	-- use {
	--     "folke/noice.nvim",
	--     event = "VeryLazy",
	--     requires = {
	--         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	--         "MunifTanjim/nui.nvim",
	--         -- OPTIONAL:
	--         --   `nvim-notify` is only needed, if you want to use the notification view.
	--         --   If not available, we use `mini` as the fallback
	--         "rcarriga/nvim-notify",
	--     }
	-- }

	-- use {
	--     "eoh-bse/minintro.nvim",
	--     config = function() require("minintro").setup({ color = "#009900" }) end
	--     --config = function() require("minintro").setup({ color = "#98c379" }) end
	-- }

	use({
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				-- config
				config = {
					week_header = {
						enable = true,
					},
					shortcut = {
						{
							icon = " ",
							icon_hl = "@variable",
							desc = "Files",
							group = "Label",
							action = "Telescope find_files",
							key = "f",
						},
						{
							desc = " Neovim Config",
							group = "Number",
							action = ":e ~/.config/nvim/",
							key = "c",
						},
					},
					project = { enable = false },
					footer = {
						"It's a good day to code. ☔️",
					},
				},
			})
		end,
		requires = { "nvim-tree/nvim-web-devicons" },
	})

	use("mfussenegger/nvim-dap")
	use("mfussenegger/nvim-dap-python")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use("theHamsta/nvim-dap-virtual-text")

	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})

	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})

	-- use({
	-- 	"ziontee113/color-picker.nvim",
	-- 	config = function()
	-- 		require("color-picker").setup()
	-- 	end,
	-- })

	use({
		"sbdchd/neoformat",
	})

	-- use({
	-- 	"Wansmer/symbol-usage.nvim",
	-- 	event = "BufReadPre",
	-- 	config = function()
	-- 		require("symbol-usage").setup()
	-- 	end,
	-- })

	-- install without yarn or npm
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	use({
		"folke/todo-comments.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup()
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	})

	use({ "dcampos/nvim-snippy" })

	use({ "dcampos/cmp-snippy" })

	use({ "honza/vim-snippets" })

	-- https://github.com/hrsh7th/nvim-cmp
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				mapping = {
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = function(fallback)
						if cmp.visible() then
							cmp.confirm({ select = true })
						else
							cmp.complete()
						end
					end,
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					["<C-y>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				},
				--			snippet = {
				--				-- REQUIRED - you must specify a snippet engine
				--				expand = function(args)
				--					-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
				--					-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
				--					require("snippy").expand_snippet(args.body) -- For `snippy` users.
				--					-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
				--				end,
				--			},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "copilot" },
					-- { name = "vsnip" }, -- For vsnip users.
					-- { name = 'luasnip' }, -- For luasnip users.
					-- { name = 'ultisnips' }, -- For ultisnips users.
					{ name = "snippy" }, -- For snippy users.
				}), --,{
				--				{ name = "buffer" },
				--			}),
			})

			--		-- Set configuration for specific filetype.
			--		cmp.setup.filetype("gitcommit", {
			--			sources = cmp.config.sources({
			--				{ name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
			--			}, {
			--				{ name = "buffer" },
			--			}),
			--		})

			--		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
			--		cmp.setup.cmdline({ "/", "?" }, {
			--			mapping = cmp.mapping.preset.cmdline(),
			--			sources = {
			--				{ name = "buffer" },
			--			},
			--		})

			--		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			--		cmp.setup.cmdline(":", {
			--			mapping = cmp.mapping.preset.cmdline(),
			--			sources = cmp.config.sources({
			--				{ name = "path" },
			--			}, {
			--				{ name = "cmdline" },
			--			}),
			--		})

			--		-- Set up lspconfig.
			--		local capabilities = require("cmp_nvim_lsp").default_capabilities()
			--		-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
			--		require("lspconfig")["<YOUR_LSP_SERVER>"].setup({
			--			capabilities = capabilities,
			--		})
		end,
	})

	use({
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require("telescope").load_extension("frecency")
		end,
	})

	-- someday:
	-- https://github.com/pwntester/octo.nvim#-features
	-- https://github.com/dhruvmanila/browser-bookmarks.nvim#supported-browsers
end)
