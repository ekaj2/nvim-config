-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    use({
        'nvim-treesitter/nvim-treesitter',
        { run = ':TSUpdate' }
    })

    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }

    use('github/copilot.vim')

    use({
        'xiyaowong/transparent.nvim'
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
            "nvim-telescope/telescope.nvim"
        }
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

    use {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                -- config
                config = {
                    week_header = {
                        enable = true,
                    },
                    shortcut = {
                        {
                            icon = ' ',
                            icon_hl = '@variable',
                            desc = 'Files',
                            group = 'Label',
                            action = 'Telescope find_files',
                            key = 'f',
                        },
                        {
                            desc = ' Neovim Config',
                            group = 'Number',
                            action = ':e ~/.config/nvim/',
                            key = 'c',
                        },
                    },
                    project = { enable = false },
                    footer = { 
                        "It's a good day to code. ☔️"
                    },
                }
            }
        end,
        requires = {'nvim-tree/nvim-web-devicons'}
    }

    -- use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

end)
