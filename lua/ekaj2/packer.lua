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

	-- to toggle dotfiles and gitignore, type "HI" in the nvim tree
	-- to see all hotkeys, type "g?"
	use({
		"nvim-tree/nvim-tree.lua",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-tree").setup({
				sort_by = "case_sensitive",
				view = {
					width = 30,
				},
				renderer = {
					group_empty = false,
				},
				filters = {
					dotfiles = false,
					git_ignored = false,
				},
			})
			-- make :Lex do :NvimTreeToggle
			vim.cmd("command! Lex NvimTreeToggle")
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
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
	--
	-- UPDATE: still not working as of 10/15/2023...come back later...
	-- use({
	-- 	"rcarriga/nvim-notify",
	-- 	config = function()
	-- 		require("notify").setup({
	-- 			background_colour = "#77GG44",
	-- 		})
	-- 	end,
	-- })

	use({
		"ekaj2/ChatGPT.nvim",
		--"jackMort/ChatGPT.nvim",
		--commit = "d4aa4d9", -- https://github.com/jackMort/ChatGPT.nvim/issues/303
		--"~/projects/jackmort-chatgpt",
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

	-- use({
	-- 	"glepnir/dashboard-nvim",
	-- 	event = "VimEnter",
	-- 	config = function()
	-- 		require("dashboard").setup({
	-- 			-- config
	-- 			config = {
	-- 				week_header = {
	-- 					enable = true,
	-- 				},
	-- 				shortcut = {
	-- 					{
	-- 						icon = " ",
	-- 						icon_hl = "@variable",
	-- 						desc = "Files",
	-- 						group = "Label",
	-- 						action = "Telescope find_files",
	-- 						key = "f",
	-- 					},
	-- 					{
	-- 						desc = " Neovim Config",
	-- 						group = "Number",
	-- 						action = ":e ~/.config/nvim/",
	-- 						key = "c",
	-- 					},
	-- 				},
	-- 				project = { enable = false },
	-- 				footer = {
	-- 					"It's a good day to code. ☔️",
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- 	requires = { "nvim-tree/nvim-web-devicons" },
	-- })

	use("mfussenegger/nvim-dap")
	use("mfussenegger/nvim-dap-python")
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use("theHamsta/nvim-dap-virtual-text")

	use({
		"folke/neodev.nvim",
		config = function()
			require("neodev").setup({
				library = { plugins = { "nvim-dap-ui" }, types = true },
			})
		end,
	})

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

	-- NOTE: Find more icons here: https://www.nerdfonts.com/cheat-sheet
	use({
		"folke/todo-comments.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			local opts = {
				keywords = {
					FIX = {
						icon = "", -- icon used for the sign, and in search results
						color = "error", -- can be a hex color, or a named color (see below)
						alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
						-- signs = false, -- configure signs for some keywords individually
					},
					TODO = { icon = "", color = "info" },
					HACK = { icon = "", color = "warning" },
					WARN = { icon = "", color = "warning", alt = { "WARNING", "XXX" } },
					PERF = { icon = "", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
					NOTE = { icon = "", color = "hint", alt = { "INFO" } },
					TEST = { icon = "󰙨", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
				},
			}
			require("todo-comments").setup(opts)
		end,
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

	-- use({
	-- 	"nvim-telescope/telescope-frecency.nvim",
	-- 	config = function()
	-- 		require("telescope").load_extension("frecency")
	-- 	end,
	-- })

	-- doesn't work rn, but maybe someday:
	-- https://github.com/pwntester/octo.nvim#-features
	-- use({
	-- 	"pwntester/octo.nvim",
	-- 	requires = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-telescope/telescope.nvim",
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- 	config = function()
	-- 		require("octo").setup({
	-- 			timeout = 20000, -- timeout for requests between the remote server
	-- 		})
	-- 	end,
	-- })

	-- https://github.com/dhruvmanila/browser-bookmarks.nvim#supported-browsers

	-- doesn't seem to work with netrw disabled
	-- and I hate netrw since it messes up which folder I add files into
	-- use({
	-- 	"axieax/urlview.nvim",
	-- 	config = function()
	-- 		require("urlview").setup()
	-- 	end,
	-- })

	use({
		"lalitmee/browse.nvim",
		requires = { "nvim-telescope/telescope.nvim" },
	})

	-- m: toggle mode
	-- tr: TroubleToggle
	use({
		"folke/trouble.nvim",
		requires = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("trouble").setup()
		end,
	})

	-- Doesn't seem to work?
	-- use({
	-- 	"roobert/action-hints.nvim",
	-- 	config = function()
	-- 		require("action-hints").setup()
	-- 	end,
	-- })

	use({
		"j-hui/fidget.nvim",
		tag = "legacy",
		config = function()
			require("fidget").setup({
				-- options
			})
		end,
	})

	-- "": open menu
	use("gennaro-tedesco/nvim-peekup")

	use({
		"chentoast/marks.nvim",
		config = function()
			require("marks").setup({})
		end,
	})

	-- use({
	-- 	"Bekaboo/deadcolumn.nvim",
	-- 	config = function()
	-- 		local opts = {
	-- 			scope = "line",
	-- 			blending = {
	-- 				threshold = 0.75,
	-- 				colorcode = "#120f17",
	-- 			},
	-- 			warning = {
	-- 				alpha = 0.2,
	-- 				colorcode = "#bb0000",
	-- 			},
	-- 		}
	-- 		require("deadcolumn").setup(opts)
	-- 	end,
	-- })

	-- TODO: Needs 0.10. Come back later and see about swapping for scrollview
	--
	-- use({
	-- 	"lewis6991/satellite.nvim",
	-- 	config = function()
	-- 		require("satellite").setup()
	-- 	end,
	-- })

	use({
		"dstein64/nvim-scrollview",
		config = function()
			require("scrollview").setup({
				scrollview_excluded_filetypes = { "NvimTree" },
				scrollview_line_limit = 5000, -- default is 20k which is high
			})
		end,
	})

	-- Doesn't seem to work on neovim :(
	-- use({
	-- 	"tpope/vim-commentary",
	-- 	config = function()
	-- 		require("commentary").setup()
	-- 	end,
	-- })

	use({
		"terrortylor/nvim-comment",
		config = function()
			require("nvim_comment").setup()
		end,
	})

	use({
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			require("refactoring").setup()
		end,
	})

	-- Really not that much more useful than Neovim default
	-- use({
	-- 	"nvim-lualine/lualine.nvim",
	-- 	requires = { "nvim-tree/nvim-web-devicons", opt = true },
	-- })

	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "IblIndent", { fg = "#393552" })
				-- vim.api.nvim_set_hl(0, "IblIndent", { fg = "#ea9a97" })
			end)

			require("ibl").setup({
				indent = {
					char = "▏",
				},
				exclude = {
					filetypes = { "dashboard" }, -- to find one do :lua print(vim.bo.filetype)
					buftypes = { "terminal" },
				},
				scope = {
					show_start = false,
					show_end = false,
				},
			})
		end,
	})

	use({
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup({
				window = {
					backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
					-- height and width can be:
					-- * an absolute number of cells when > 1
					-- * a percentage of the width / height of the editor when <= 1
					-- * a function that returns the width or the height
					width = 80, -- width of the Zen window
					height = 1, -- height of the Zen window
					-- by default, no options are changed for the Zen window
					-- uncomment any of the options below, or add other vim.wo options you want to apply
					options = {
						-- signcolumn = "no", -- disable signcolumn
						number = false, -- disable number column
						relativenumber = false, -- disable relative numbers
						-- cursorline = false, -- disable cursorline
						-- cursorcolumn = false, -- disable cursor column
						-- foldcolumn = "0", -- disable fold column
						-- list = false, -- disable whitespace characters
					},
				},
				plugins = {
					-- disable some global vim options (vim.o...)
					-- comment the lines to not apply the options
					options = {
						enabled = true,
						ruler = false, -- disables the ruler text in the cmd line area
						showcmd = false, -- disables the command in the last line of the screen
						-- you may turn on/off statusline in zen mode by setting 'laststatus'
						-- statusline will be shown only if 'laststatus' == 3
						laststatus = 0, -- turn off the statusline in zen mode
					},
					twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
					gitsigns = { enabled = false }, -- disables git signs
					tmux = { enabled = false }, -- disables the tmux statusline
				},
				-- callback where you can add custom code when the Zen window opens
				on_open = function(win)
					-- enable wrap
					vim.opt.wrap = true
				end,
				-- callback where you can add custom code when the Zen window closes
				on_close = function() end,
			})
		end,
	})

	use({
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup({
				dimming = {
					alpha = 0.75, -- amount of dimming

					-- we try to get the foreground from the highlight groups or fallback color
					color = { "Normal", "#aabbff" },
				},

				treesitter = false,
				context = 1,
				expand = {
					-- "function",
					-- "method",
					-- "table",
					-- "if_statement",
				},
			})
		end,
	})

	use({
		"catppuccin/nvim",
		as = "catppuccin",

		config = function()
			require("catppuccin").setup({
				flavour = "latte", -- latte, frappe, macchiato, mocha
				background = { -- :h background
					light = "latte",
					dark = "mocha",
				},
			})
		end,
	})

	use("madox2/vim-ai")

	-- use({
	-- 	"TrevorS/uuid-nvim",
	-- 	config = function()
	-- 		require("uuid-nvim").setup({
	-- 			case = "lower",
	-- 			quotes = "none",
	-- 		})
	-- 	end,
	-- })
	use({
		"~/projects/uuid-nvim",
		config = function()
			require("uuid-nvim").setup({
				case = "lower",
				quotes = "none",
				insert = "before",
			})
		end,
	})

	use({
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	})

	use({
		"nvim-neotest/neotest-python",
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-python"),
				},
			})
		end,
	})
end)
