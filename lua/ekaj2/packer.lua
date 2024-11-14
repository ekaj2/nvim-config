-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		-- tag = "0.1.2",
		-- or                            , branch = '0.1.x',
		requires = {
			{ "nvim-lua/plenary.nvim", "nvim-telescope/telescope-live-grep-args.nvim" },
		},
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
					width = 35,
				},
				renderer = {
					group_empty = false,
				},
				filters = { -- HI to toggle both of these
					dotfiles = true,
					git_ignored = true,
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

	use({
		"theprimeagen/harpoon",
		branch = "harpoon2",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use("mbbill/undotree")

	use("tpope/vim-fugitive")
	-- use("tpope/vim-rhubarb") -- for GitHub...unfortunately needs netrw - see init.lua

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

	-- use({
	-- 	"zbirenbaum/copilot.lua",
	-- 	cmd = "Copilot",
	-- 	event = "InsertEnter",
	-- 	module = "copilot",
	-- 	config = function()
	-- 		require("copilot").setup({
	-- 			suggestion = { enabled = false },
	-- 			panel = { enabled = false },
	-- 		})
	-- 	end,
	-- })

	-- use({
	-- 	"zbirenbaum/copilot-cmp",
	-- 	after = { "copilot.lua" },
	-- 	config = function()
	-- 		require("copilot_cmp").setup()
	-- 	end,
	-- })

	use({ "nvim-neotest/nvim-nio" })

	use({
		"xiyaowong/transparent.nvim",
	})

	-- use({
	-- 	"rcarriga/nvim-notify",
	-- 	config = function()
	-- 		local notify = require("notify")
	-- 		notify.setup({
	-- 			background_colour = "#191724",
	-- 			render = "wrapped-compact",
	-- 		})
	-- 		vim.notify = notify
	-- 	end,
	-- })

	-- use({ "folke/noice.nvim", as = "noice" })

	-- use({
	-- 	"ekaj2/ChatGPT.nvim",
	-- 	--"jackMort/ChatGPT.nvim",
	-- 	--commit = "d4aa4d9", -- https://github.com/jackMort/ChatGPT.nvim/issues/303
	-- 	--"~/projects/jackmort-chatgpt",
	-- 	--config = function()
	-- 	--    require("chatgpt").setup()
	-- 	--end,
	-- 	requires = {
	-- 		"MunifTanjim/nui.nvim",
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-telescope/telescope.nvim",
	-- 	},
	-- })

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

	-- TODO: switch to lazydev: https://github.com/folke/neodev.nvim
	-- use({
	-- 	"folke/neodev.nvim",
	-- 	config = function()
	-- 		require("neodev").setup({
	-- 			library = { plugins = { "nvim-dap-ui" }, types = true },
	-- 		})
	-- 	end,
	-- })

	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})

	-- use({
	-- 	"norcalli/nvim-colorizer.lua",
	-- 	config = function()
	-- 		require("colorizer").setup()
	-- 	end,
	-- })

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

	-- use({
	-- 	"roobert/tailwindcss-colorizer-cmp.nvim",
	-- 	-- optionally, override the default options:
	-- 	config = function()
	-- 		require("tailwindcss-colorizer-cmp").setup({
	-- 			color_square_width = 2,
	-- 		})
	-- 	end,
	-- })

	use({ "dcampos/nvim-snippy" })
	use({ "dcampos/cmp-snippy" })
	-- use({ "honza/vim-snippets" })

	use({ "hrsh7th/cmp-calc" })
	use({ "hrsh7th/cmp-emoji" })

	use({ "hrsh7th/cmp-path" }) -- / or ./ to trigger

	-- https://github.com/hrsh7th/nvim-cmp
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			-- 7 * 4 =
			cmp.setup({
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				formatting = {
					-- this only half works :(
					-- format = require("tailwindcss-colorizer-cmp").formatter,
				},
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				sorting = {
					priority_weight = 2,
					comparators = {
						-- require("copilot_cmp.comparators").prioritize,

						-- Below is the default comparitor list and order for nvim-cmp
						cmp.config.compare.offset,
						-- cmp.config.compare.scopes, --this is commented in nvim-cmp too
						cmp.config.compare.exact,
						cmp.config.compare.score,
						cmp.config.compare.recently_used,
						cmp.config.compare.locality,
						cmp.config.compare.kind,
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
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
					-- { name = "copilot" },
					-- { name = "vsnip" }, -- For vsnip users.
					-- { name = 'luasnip' }, -- For luasnip users.
					-- { name = 'ultisnips' }, -- For ultisnips users.
					{ name = "snippy" }, -- For snippy users.
					-- { name = "vim-dadbod-completion" },
					{ name = "calc" },
					{ name = "path" },
					{ name = "emoji" },
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

	-- -- doesn't work rn, but maybe someday:
	-- -- https://github.com/pwntester/octo.nvim#-features
	-- use({
	-- 	"pwntester/octo.nvim",
	-- 	requires = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-telescope/telescope.nvim",
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- 	config = function()
	-- 		require("octo").setup({
	-- 			-- timeout = 20000, -- timeout for requests between the remote server
	-- 			suppress_missing_scope = {
	-- 				projects_v2 = true,
	-- 			},
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

	-- use({
	-- 	"lalitmee/browse.nvim",
	-- 	requires = { "nvim-telescope/telescope.nvim" },
	-- })

	-- -- m: toggle mode
	-- -- tr: TroubleToggle
	-- use({
	-- 	"folke/trouble.nvim",
	-- 	requires = {
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- 	config = function()
	-- 		require("trouble").setup()
	-- 	end,
	-- })

	-- Doesn't seem to work?
	-- use({
	-- 	"roobert/action-hints.nvim",
	-- 	config = function()
	-- 		require("action-hints").setup()
	-- 	end,
	-- })

	-- It's mega cool, but never really used this
	-- use({
	-- 	"j-hui/fidget.nvim",
	-- 	tag = "legacy",
	-- 	config = function()
	-- 		require("fidget").setup({
	-- 			-- options
	-- 		})
	-- 	end,
	-- })

	-- "": open menu
	use("gennaro-tedesco/nvim-peekup")

	-- TODO: when I have more time
	--
	-- use({
	-- 	"chentoast/marks.nvim",
	-- 	config = function()
	-- 		require("marks").setup({})
	-- 	end,
	-- })

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

	-- use({
	-- 	"dstein64/nvim-scrollview",
	-- 	config = function()
	-- 		require("scrollview").setup({
	-- 			scrollview_excluded_filetypes = { "NvimTree" },
	-- 			scrollview_line_limit = 5000, -- default is 20k which is high
	-- 		})
	-- 	end,
	-- })

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

	-- use({
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	config = function()
	-- 		local hooks = require("ibl.hooks")
	-- 		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	-- 			vim.api.nvim_set_hl(0, "IblIndent", { fg = "#393552" })
	-- 			-- vim.api.nvim_set_hl(0, "IblIndent", { fg = "#ea9a97" })
	-- 		end)
	--
	-- 		require("ibl").setup({
	-- 			indent = {
	-- 				char = "▏",
	-- 			},
	-- 			exclude = {
	-- 				filetypes = { "dashboard" }, -- to find one do :lua print(vim.bo.filetype)
	-- 				buftypes = { "terminal" },
	-- 			},
	-- 			scope = {
	-- 				show_start = false,
	-- 				show_end = false,
	-- 			},
	-- 		})
	-- 	end,
	-- })

	-- use({
	-- 	"folke/zen-mode.nvim",
	-- 	config = function()
	-- 		require("zen-mode").setup({
	-- 			window = {
	-- 				backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
	-- 				-- height and width can be:
	-- 				-- * an absolute number of cells when > 1
	-- 				-- * a percentage of the width / height of the editor when <= 1
	-- 				-- * a function that returns the width or the height
	-- 				width = 80, -- width of the Zen window
	-- 				height = 1, -- height of the Zen window
	-- 				-- by default, no options are changed for the Zen window
	-- 				-- uncomment any of the options below, or add other vim.wo options you want to apply
	-- 				options = {
	-- 					-- signcolumn = "no", -- disable signcolumn
	-- 					number = false, -- disable number column
	-- 					relativenumber = false, -- disable relative numbers
	-- 					-- cursorline = false, -- disable cursorline
	-- 					-- cursorcolumn = false, -- disable cursor column
	-- 					-- foldcolumn = "0", -- disable fold column
	-- 					-- list = false, -- disable whitespace characters
	-- 				},
	-- 			},
	-- 			plugins = {
	-- 				-- disable some global vim options (vim.o...)
	-- 				-- comment the lines to not apply the options
	-- 				options = {
	-- 					enabled = true,
	-- 					ruler = false, -- disables the ruler text in the cmd line area
	-- 					showcmd = false, -- disables the command in the last line of the screen
	-- 					-- you may turn on/off statusline in zen mode by setting 'laststatus'
	-- 					-- statusline will be shown only if 'laststatus' == 3
	-- 					laststatus = 0, -- turn off the statusline in zen mode
	-- 				},
	-- 				twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
	-- 				gitsigns = { enabled = false }, -- disables git signs
	-- 				tmux = { enabled = false }, -- disables the tmux statusline
	-- 			},
	-- 			-- callback where you can add custom code when the Zen window opens
	-- 			on_open = function(win)
	-- 				-- enable wrap
	-- 				vim.opt.wrap = true
	-- 			end,
	-- 			-- callback where you can add custom code when the Zen window closes
	-- 			on_close = function() end,
	-- 		})
	-- 	end,
	-- })

	-- use({
	-- 	"folke/twilight.nvim",
	-- 	config = function()
	-- 		require("twilight").setup({
	-- 			dimming = {
	-- 				alpha = 0.75, -- amount of dimming
	--
	-- 				-- we try to get the foreground from the highlight groups or fallback color
	-- 				color = { "Normal", "#aabbff" },
	-- 			},
	--
	-- 			treesitter = false,
	-- 			context = 1,
	-- 			expand = {
	-- 				-- "function",
	-- 				-- "method",
	-- 				-- "table",
	-- 				-- "if_statement",
	-- 			},
	-- 		})
	-- 	end,
	-- })

	-- use({
	-- 	"catppuccin/nvim",
	-- 	as = "catppuccin",
	--
	-- 	config = function()
	-- 		require("catppuccin").setup({
	-- 			flavour = "latte", -- latte, frappe, macchiato, mocha
	-- 			background = { -- :h background
	-- 				light = "latte",
	-- 				dark = "mocha",
	-- 			},
	-- 		})
	-- 	end,
	-- })

	-- use({
	-- 	"madox2/vim-ai",
	-- 	as = "vim-ai",
	-- 	config = function()
	-- 		local initial_prompt = [[
	--             Output only code. Do not include context.
	--
	--             ]]
	--
	-- 		local chat_engine_config = {
	-- 			engine = "chat",
	-- 			options = {
	-- 				model = "gpt-4-turbo-preview",
	-- 				endpoint_url = "https://api.openai.com/v1/chat/completions",
	-- 				max_tokens = 1000,
	-- 				temperature = 0.1,
	-- 				request_timeout = 20,
	-- 				selection_boundary = "",
	-- 				enable_auth = true,
	-- 				initial_prompt = initial_prompt, -- "Only output code. Do not use English, just provide code. Follow the instruction given.",
	-- 			},
	-- 			ui = {
	-- 				paste_mode = false,
	-- 			},
	-- 		}
	--
	-- 		vim.g.vim_ai_complete = chat_engine_config
	-- 		vim.g.vim_ai_edit = chat_engine_config
	-- 	end,
	-- })

	use({
		"robitx/gp.nvim",
		config = function()
			require("gp").setup({
				chat_topic_gen_model = "gpt-4-turbo-preview",
				providers = {
					openai = {
						endpoint = "https://api.openai.com/v1/chat/completions",
						secret = os.getenv("OPENAI_API_KEY"),
					},
					anthropic = {
						endpoint = "https://api.anthropic.com/v1/messages",
						secret = os.getenv("ANTHROPIC_API_KEY"),
					},
				},
				agents = {
					{
						name = "Sonnet3-5",
						chat = true,
						command = false,
						model = { model = "claude-3-5-sonnet-20240620" },
						system_prompt = "You are a general AI assistant.\n\n"
							.. "The user provided the additional info about how they would like you to respond:\n\n"
							.. "- If you're unsure don't guess and say you don't know instead.\n"
							.. "- Ask question if you need clarification to provide better answer.\n"
							.. "- Think deeply and carefully from first principles step by step.\n"
							.. "- Zoom out first to see the big picture and then zoom in to details.\n"
							.. "- Use Socratic method to improve your thinking and coding skills.\n"
							.. "- Don't elide any code from your output if the answer requires coding.\n"
							.. "- Take a deep breath; You've got this!\n",
					},
					{
						name = "CodeSonnet3-5",
						chat = false,
						command = true,
						model = { model = "claude-3-5-sonnet-20240620" },
						system_prompt = "You are an AI working as a code editor.\n\n"
							.. "Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n"
							.. "START AND END YOUR ANSWER WITH:\n\n```",
					},
					{
						name = "ChatGPT4",
						disable = true,
						chat = true,
						command = false,
						-- string with model name or table with model name and parameters
						model = { model = "gpt-4-1106-preview", temperature = 1.1, top_p = 1 },
						-- system prompt (use this to specify the persona/role of the AI)
						system_prompt = "You are a general AI assistant.\n\n"
							.. "The user provided the additional info about how they would like you to respond:\n\n"
							.. "- If you're unsure don't guess and say you don't know instead.\n"
							.. "- Ask question if you need clarification to provide better answer.\n"
							.. "- Think deeply and carefully from first principles step by step.\n"
							.. "- Zoom out first to see the big picture and then zoom in to details.\n"
							.. "- Use Socratic method to improve your thinking and coding skills.\n"
							.. "- Don't elide any code from your output if the answer requires coding.\n"
							.. "- Take a deep breath; You've got this!\n",
					},
					{
						name = "ChatGPT3-5",
						disable = true,
					},
					{
						name = "CodeGPT4",
						disable = true,
						chat = false,
						command = true,
						-- string with model name or table with model name and parameters
						model = { model = "gpt-4-1106-preview", temperature = 0.8, top_p = 1 },
						-- system prompt (use this to specify the persona/role of the AI)
						system_prompt = "You are an AI working as a code editor.\n\n"
							.. "Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n"
							.. "START AND END YOUR ANSWER WITH:\n\n```",
					},
					{
						name = "CodeGPT3-5",
						disable = true,
					},
				},
			})
			local function keymapOptions(desc)
				return {
					noremap = true,
					silent = true,
					nowait = true,
					desc = "GPT prompt " .. desc,
				}
			end

			-- or setup with your own config (see Install > Configuration in Readme)
			-- require("gp").setup(config)

			-- shortcuts might be setup here (see Usage > Shortcuts in Readme)
			vim.api.nvim_set_keymap("v", "<leader>gpn", ":<C-u>'<,'>GpChatNew vsplit<cr>", {})
			vim.api.nvim_set_keymap("n", "<leader>gpn", "<cmd>GpChatNew vsplit<cr>", {})
			vim.api.nvim_set_keymap("v", "<leader>gpp", ":<C-u>'<,'>GpChatPaste<cr>", {})
			vim.api.nvim_set_keymap("v", "<leader>gpi", ":<C-u>'<,'>GpImplement<cr>", {})
			vim.api.nvim_set_keymap("v", "<leader>gpw", ":<C-u>'<,'>GpWhisperRewrite<cr>", {})
			vim.api.nvim_set_keymap("n", "<leader>gpd", ":<C-u>'<,'>GpWhisper<cr>", {}) -- dictate
			vim.api.nvim_set_keymap("n", "<leader>c", "<cmd>GpChatNew<cr>", {}) -- to help me get over jackmort!
			vim.api.nvim_set_keymap("n", "<leader>gpt", "<cmd>GpChatToggle<cr>", {})
			vim.api.nvim_set_keymap("n", "<leader>gpf", "<cmd>GpChatFinder<cr>", {})
			vim.api.nvim_set_keymap("n", "<leader>k", "<cmd>GpRewrite<cr>", {})
			vim.api.nvim_set_keymap("v", "<leader>k", ":<C-u>'<,'>GpRewrite<cr>", {})

			local original_gp_rewrite = vim.fn["GpRewrite"]

			vim.fn["GpRewrite"] = function(...)
				local args = { ... }
				original_gp_rewrite(unpack(args))
				vim.schedule(function()
					vim.cmd("LspRestart")
				end)
			end
		end,
	})

	-- use({
	-- 	"TrevorS/uuid-nvim",
	-- 	config = function()
	-- 		require("uuid-nvim").setup({
	-- 			case = "lower",
	-- 			quotes = "none",
	-- 		})
	-- 	end,
	-- })

	-- use({
	-- 	"~/projects/uuid-nvim",
	-- 	config = function()
	-- 		require("uuid-nvim").setup({
	-- 			case = "lower",
	-- 			quotes = "none",
	-- 			insert = "before",
	-- 		})
	-- 	end,
	-- })

	-- use({ "antoinemadec/FixCursorHold.nvim" })

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
	})

	-- use({
	-- 	"NoahTheDuke/vim-just",
	-- })

	use({
		-- "coffebar/transfer.nvim",
		"~/projects/transfer.nvim",
		cmd = {
			"TransferInit",
			"DiffRemote",
			"TransferUpload",
			"TransferDownload",
			"TransferDirDiff",
			-- "TransferGitDiff",
			"TransferRepeat",
		},
		config = function()
			require("transfer").setup()
		end,
	})

	-- use({
	-- 	"OscarCreator/rsync.nvim",
	-- 	run = "make",
	-- 	requires = { "nvim-lua/plenary.nvim" },
	-- 	config = function()
	-- 		require("rsync").setup({
	-- 			-- triggers `RsyncUp` when fugitive thinks something might have changed in the repo.
	-- 			fugitive_sync = false,
	-- 			-- triggers `RsyncUp` when you save a file.
	-- 			sync_on_save = false,
	-- 			-- the path to the project configuration
	-- 			project_config_path = ".nvim/rsync.toml",
	-- 			-- called when the rsync command exits, provides the exit code and the used command
	-- 			on_exit = function(code, command) end,
	-- 			-- called when the rsync command prints to stderr, provides the data and the used command
	-- 			on_stderr = function(data, command) end,
	-- 		})
	-- 	end,
	-- })

	-- use({ "tpope/vim-dadbod" })
	-- use({ "kristijanhusak/vim-dadbod-completion" })
	-- use({
	-- 	"kristijanhusak/vim-dadbod-ui",
	-- 	requires = {
	-- 		{ "tpope/vim-dadbod" },
	-- 		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" } },
	-- 	},
	-- 	cmd = {
	-- 		"DBUI",
	-- 		"DBUIToggle",
	-- 		"DBUIAddConnection",
	-- 		"DBUIFindBuffer",
	-- 	},
	-- 	config = function()
	-- 		-- Your DBUI configuration
	-- 		vim.g.db_ui_use_nerd_fonts = 1
	-- 	end,
	-- })

	-- use({ "ThePrimeagen/vim-be-good" })

	-- use({
	-- 	"pteroctopus/faster.nvim",
	-- 	config = function()
	-- 		require("faster").setup({})
	-- 	end,
	-- })

	-- Gets detached buffer errors
	-- use({
	-- 	"LunarVim/bigfile.nvim",
	-- })

	-- -- requires Neovim 0.10.x
	-- use({
	-- 	"Bekaboo/dropbar.nvim",
	-- 	requires = {
	-- 		"nvim-telescope/telescope-fzf-native.nvim",
	-- 	},
	-- })

	-- use({
	-- 	"microsoft/vscode-js-debug",
	-- 	opt = true,
	-- 	run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
	-- })
	-- use({ "mxsdev/nvim-dap-vscode-js", requires = { "mfussenegger/nvim-dap" } })

	use({
		-- See: https://github.com/mrcjkb/rustaceanvim/discussions/396
		-- need to update my nightly build to fix
		"mrcjkb/rustaceanvim",
		-- "~/projects/rustaceanvim",
		tag = "4.*", -- Recommended
	})

	-- use({
	-- 	"whleucka/melody.nvim",
	-- 	requires = {
	-- 		"nvim-telescope/telescope.nvim",
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- 	config = function()
	-- 		require("melody").setup({
	-- 			music_dir = "/Users/eagle/Music/mymusic/",
	-- 		})
	-- 	end,
	-- })

	-- use("subnut/nvim-ghost.nvim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
