local fn = vim.fn
local api = vim.api
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

local function get_config(name)
    return string.format('require("config/%s")', name)
end

-- Install Packer if it is not installed yet
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    api.nvim_command("packadd packer.nvim")
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

-- Installing plugins
packer.startup(function(use)
    use("wbthomason/packer.nvim")

    -- Usual Lua dependency stuff
    use('nvim-lua/popup.nvim')
    use('nvim-lua/plenary.nvim')

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
    -- Registers popup menu
    use {
        'tversteeg/registers.nvim',
        config = function()
            require('registers').setup()
        end,
    }
    use {
        "Pocco81/true-zen.nvim",
        config = function()
            require("true-zen").setup()
        end,
    }

    -- Dashboard screen upon opening
    use {
        "goolord/alpha-nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("config.alpha")
        end,
    }

    -- Indent blankline (neat to have tree-sitter with it)
    use{
        'lukas-reineke/indent-blankline.nvim',
        event = "BufReadPre",
        config = function()
            require('indent_blankline').setup({
                space_char_blankline = " ",
                show_current_context = true,

            })
        end,
    }

    -- Lua based status line
    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup {
                options = {
                    component_separators = { left = '', right = ''},
                    section_separators = { left = '', right = ''},
                    disabled_filetypes = {
                        "packer", "NvimTree", "alpha"
                    }
                }
            }
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
    use {
        "tiagovla/scope.nvim",
        config = function()
            require('scope').setup()
        end
    }

    -- Treesitter: syntax, auto-indent and more!
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("config.tree-sitter")
        end,
    }
    use { "nvim-treesitter/tree-sitter-query", after = "nvim-treesitter" }
    use { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" }
    use { "RRethy/nvim-treesitter-textsubjects", after = "nvim-treesitter", disable = true}

    -- TODO COMMENTS
    -- Maybe

    -- FZF
    use { "junegunn/fzf", run = "./install --bin", event = "VimEnter" }

    -- Lua FZF
    use {
        "ibhagwan/fzf-lua",
        event = "BufEnter"
    }

    -- Auto pairs
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end
    }
    use { "famiu/bufdelete.nvim" }


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

    -- File tree
    use {
        'kyazdani42/nvim-tree.lua',
        config = function ()
            require('nvim-tree').setup {

            }
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

    -- LSP --
    use { "neovim/nvim-lspconfig", config = get_config("lsp.lsp") }
    use {
        "williamboman/mason.nvim",
        cmd = "Mason*",
        module = "mason-tool-installer",
        requires = { "williamboman/mason-lspconfig.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim" },
        config = get_config("lsp.mason"),
    }

end)