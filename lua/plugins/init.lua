-- This file contains all plugins migrated from packer.lua to lazy.nvim format

return {
  -- Package manager (self)
  { "folke/lazy.nvim" },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
  },

  -- Colorscheme
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
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
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- Harpoon for quick file navigation
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Undo history visualizer
  { "mbbill/undotree" },

  -- Git integration
  { "tpope/vim-fugitive" },

  -- LSP and completion
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
      -- { "L3MON4D3/LuaSnip" },
    },
  },

  -- Required for some plugins
  { "nvim-neotest/nvim-nio" },

  -- Transparent background
  { "xiyaowong/transparent.nvim" },

  -- Debugging
  { "mfussenegger/nvim-dap" },
  { "mfussenegger/nvim-dap-python" },
  { 
    "rcarriga/nvim-dap-ui", 
    dependencies = { "mfussenegger/nvim-dap" } 
  },
  { "theHamsta/nvim-dap-virtual-text" },

  -- Text manipulation
  {
    "kylechui/nvim-surround",
    version = "*",
    config = function()
      require("nvim-surround").setup({})
    end,
  },

  -- Formatting
  { "sbdchd/neoformat" },

  -- Markdown preview
--   {
--     "iamcco/markdown-preview.nvim",
--     build = function()
--       vim.fn["mkdp#util#install"]()
--     end,
--   },

  -- Todo comments
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local opts = {
        keywords = {
          FIX = {
            icon = "", -- icon used for the sign, and in search results
            color = "error", -- can be a hex color, or a named color (see below)
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
          },
          TODO = { icon = "", color = "info" },
          HACK = { icon = "", color = "warning" },
          WARN = { icon = "", color = "warning", alt = { "WARNING", "XXX" } },
          PERF = { icon = "", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          NOTE = { icon = "", color = "hint", alt = { "INFO" } },
          TEST = { icon = "󰙨", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        },
      }
      require("todo-comments").setup(opts)
    end,
  },

  -- Snippets
  { "dcampos/nvim-snippy" },
  { "dcampos/cmp-snippy" },

  -- Additional completion sources
  { "hrsh7th/cmp-calc" },
  { "hrsh7th/cmp-emoji" },
  { "hrsh7th/cmp-path" },

  -- Completion engine
  {
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
        sorting = {
          priority_weight = 2,
          comparators = {
            cmp.config.compare.offset,
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
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "snippy" },
          { name = "calc" },
          { name = "path" },
          { name = "emoji" },
        }),
      })
    end,
  },

  -- Register viewer
  { "gennaro-tedesco/nvim-peekup" },

  -- Comments
  {
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup()
    end,
  },

  -- Refactoring
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
  },

  -- Testing
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  { "nvim-neotest/neotest-python" },

  -- File transfer
  {
    "coffebar/transfer.nvim",
    cmd = {
      "TransferInit",
      "DiffRemote",
      "TransferUpload",
      "TransferDownload",
      "TransferDirDiff",
      "TransferRepeat",
    },
    config = function()
      require("transfer").setup()
    end,
  },

  -- Rust development
  {
    "mrcjkb/rustaceanvim",
    version = "4.*",
  },

  -- GPT integration
  {
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
            system_prompt = "You are an experienced engineer.\n\n"
              .. "- Additional context is provided below.\n"
              .. "- Use tailwind classes over css.\n"
              .. "- Use vanilla JS at all times, ideally with inline <script> tags.\n"
              .. "- Simplicity is fundamental.\n",
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
            model = { model = "gpt-4-1106-preview", temperature = 1.1, top_p = 1 },
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
            model = { model = "gpt-4-1106-preview", temperature = 0.8, top_p = 1 },
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
  },
} 