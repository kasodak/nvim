local fn = vim.fn
local api = vim.api

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap = false


-- Install Packer if it is not installed yet
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    api.nvim_command("packadd packer.nvim")
else
    -- Run PackerCompile if there are changes in this file
--    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
end

-- Packer init with settings
local packer = require("packer")
packer.init {
    profile = {
        enable = true,
        threshold = 0, -- The amount in ms that a plugins load time must be over for it to be included in the profile
    },
    display = {
        open_fn = require('packer.util').float,
    }
}


-- Little local helper function to load configs from config folder
local function get_config(name)
    return string.format('require("config/%s")', name)
end

-- Plugins in function by "category"
local function appearence(use)

    -- 󰴈 
    -- 󰹢 
    use 'rcarriga/nvim-notify'

    use "rebelot/kanagawa.nvim"
    -- use {
    --     "MunifTanjim/nui.nvim",
    --     config = function ()
    --         require('nui')
    --     end
    -- }

    -- Forest colors, tasty theme
    use {
        'sainnhe/everforest',
        config = function()
            vim.g.everforest_background = "hard"
            vim.g.everforest_better_performance = 1
            vim.o.background = 'dark'
            vim.cmd "colorscheme everforest"
        end,
    }
    -- Cool themes
    use {
        'EdenEast/nightfox.nvim'
    }

    -- Registers popup menu
    use {
        'tversteeg/registers.nvim',
        config = function()
            require('registers').setup()
        end,
    }

    -- Indent blankline (neat to have tree-sitter with it)
    use{
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('ibl').setup({
            })
        end,
    }

    -- Bufferline and better tab view
    use {
        'akinsho/bufferline.nvim',
        config = function()
            require("bufferline").setup {
                options = {
                    numbers = "none",
                    diagnostics = "nvim_lsp",
                    separator_style = "thick", show_tab_indicators = true,
                    show_buffer_close_icons = false,
                    show_close_icon = false,
                },
            }
        end,
    }
    -- Lua based status line
    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require("config.lualine")
        end,
    }

    -- Dashboard screen upon opening
    use {
        "goolord/alpha-nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("config.alpha")
            require("nvim-web-devicons").set_icon {
                ps1 = {
                    icon = "",
                    color = "#5c8cf2",
                    cterm_color = "65",
                    name = "Powershell"
                },
                psm1 = {
                    icon = "",
                    color = "#5c8cf2",
                    cterm_color = "65",
                    name = "Powershell"
              }
            }
        end,
    }

    use {
        'nvim-tree/nvim-web-devicons',
        config = function ()
            require('nvim-web-devicons').setup()
        end
    }

end

local function helpers(use)

    -- File tree
    use {
        'kyazdani42/nvim-tree.lua',
        config = function ()
            require('nvim-tree').setup({
                view = {
                    number = true,
                    width = {},
                    -- float = {
                    --     enable = true
                    -- }
                },
                renderer = {
                    indent_markers = {
                        enable = true
                    },
                    icons = {
                        glyphs = {
                            folder = {
                                arrow_closed = "",
                                arrow_open = "",
                                -- default = "",
                                -- open = "",
                                empty = "󱏽 ",
                                empty_open = "󰹣 ",
                                symlink = "",
                                default = "󰹢 ",
                                open = " "
                            }
                        }
                    }
                }
            })
        end
    }

    use {
        "tiagovla/scope.nvim",
        config = function()
            require('scope').setup()
        end
    }

    -- Cool Git plugins
    use('tpope/vim-fugitive')

    use {
        'lewis6991/gitsigns.nvim',
        config = get_config('git'),
    }

    -- Which Key for mappings
    use {
        'folke/which-key.nvim',
        event = "VimEnter",
        config = function()
            require('config.which-key')
        end,
    }

    -- Todo highlights
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
                -- keywords = {
                --     QUESTION = { icon = "", color = "question",}
                -- },
                -- colors = {
                --     question = {"DiagnosticQuestion", "7EED9B" }
                -- },
            }
        end
    }

    -- LSP diagnostics better toggling
    use {
        'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
        config = function()
            require('toggle_lsp_diagnostics').init()
        end,
    }


    -- Vim visual multi cursor
    use {
        'mg979/vim-visual-multi',
        enable = false
    }

    -- Auto pairs
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end
    }

    -- Better buffer delete
    use { "famiu/bufdelete.nvim" }

    -- Aligning everything
    use {
        "junegunn/vim-easy-align",
    }

    -- More targets to operate on
    use('wellle/targets.vim')

    -- Vim sandwich
    use('machakann/vim-sandwich')

    -- Easy commenting
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end,
    }

end

local function navigation(use)
    -- FZF
    use { "junegunn/fzf", run = "./install --bin", event = "VimEnter" }
    -- Lua FZF
    use {
        "ibhagwan/fzf-lua",
        event = "BufEnter",
        config = function()
            require('config.fzf-lua')
        end,
    }

end

local function syntax(use)
    use { 'pprovost/vim-ps1' }

    -- Treesitter: syntax, auto-indent and more!
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("config.tree-sitter")
        end,
    }
    use { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" }
    -- use { "RRethy/nvim-treesitter-textsubjects", after = "nvim-treesitter"}
    use { "andymass/vim-matchup", after = "nvim-treesitter"}

end

local function lsp(use)

    -- LSP --
    use { "neovim/nvim-lspconfig", config = get_config("lsp.lsp") }

    use {
        "williamboman/mason.nvim",
        cmd = "Mason*",
        module = "mason-tool-installer",
        requires = { "williamboman/mason-lspconfig.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim" },
        config = get_config("lsp.mason"),
    }

    use { 'fatih/vim-go' }

    -- Context in the header :p
    use {
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig"
    }

    -- Completion
    use {
        "hrsh7th/nvim-cmp",
        config = function()
            require("config.cmp")
        end,
        wants = { "LuaSnip" },
        requires = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "ray-x/cmp-treesitter",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            {
                "L3MON4D3/LuaSnip",
                wants = { "friendly-snippets" },
                config = function()
                    require("config.snip")
                end,
            },
            "rafamadriz/friendly-snippets",
        },
    }
    
end

-- Installing plugins
packer.startup(function(use)

    use("wbthomason/packer.nvim")

    -- Usual Lua dependency stuff
    use { 'nvim-lua/popup.nvim' }
    use { 'nvim-lua/plenary.nvim' }

    appearence(use)
    helpers(use)
    navigation(use)
    syntax(use)
    lsp(use)


    if packer_bootstrap then
        packer.sync()
    end

end)
