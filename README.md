## Dependencies

- npm
- node
- python3
- pip3
- wget
- curl
- gzip
- tar
- git

### Providers

- NodeJS provider: npm install -g neovim
- Python3 provider: pip3 -g install pynvim

### Other

- [fd](https://github.com/sharkdp/fd) - better `find` utility
- [rg](https://github.com/BurntSushi/ripgrep) - better `grep` utility
- [bat](https://github.com/sharkdp/bat) - syntax highlighted previews when
  using fzf's native previewer
- [delta](https://github.com/dandavison/delta) - syntax highlighted git pager
  for git status previews

## Plugins:

(Important ones)

- Core
  - [Packer](https://github.com/wbthomason/packer.nvim") : Manage Plugins
  - [Plenary](https://github.com/nvim-lua/plenary.nvim) : Dependence for other plugins
  - [Popup](https://github.com/nvim-lua/plenary.nvim) : Dependence for other plugins
- Appearance
  - [Everforest](https://github.com/sainnhe/everforest) : Pleasent looking green theme
  - [Web Devicons](https://github.com/kyazdani42/nvim-web-devicons) : Add icons to vim
  - [Alpha](https://github.com/goolord/alpha-nvim) : Dashboard
  - [Navic](https://github.com/SmiteshP/nvim-navic) : Show context on winbar (lualine for this case)
  - [Indent blankline](https://github.com/lukas-reineke/indent-blankline.nvim) : Indentation guides
  - [Registers](https://github.com/tversteeg/registers.nvim) : Nice registers overview
- Utils
  - [Whichkey](https://github.com/folke/which-key.nvim) : Keymap helper
  - [Comment](https://github.com/numToStr/Comment.nvim) : Comment stuff
  - [FZF](https://github.com/junegunn/fzf) : Rust fuzzy finder (FzfLua dependency)
  - [FzfLua](https://github.com/ibhagwan/fzf-lua) : Power tool to use FZF with Neovim and its plugins 
  - [Targets](https://github.com/wellle/targets.vim) : 'inner' movements on steroid
  - [Sandwich](https://github.com/machakann/vim-sandwich) : Create tasty sandwiches around words or anything
  - [Fugitive](https://github.com/tpope/vim-fugitive) : The all and might vim-fugitive for Git stuff
  - [Gitsigns](https://github.com/lewis6991/gitsigns.nvim) : Additional neat Git plugin
- Completion
  - [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) : Introducing completion to neovim
  - [LuaSnip](https://github.com/L3MON4D3/LuaSnip) :  Lua based snippet engine
  - [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) : Friendly snippets
- Misc
  - [Bufferline](https://github.com/akinsho/bufferline.nvim) : Show buffers in little tabs
  - [Scope](https://github.com/tiagovla/scope.nvim) : Focus on one tab when creating new ones
  - [Autopairs](https://github.com/windwp/nvim-autopairs) : Automatically create pairs for certain symbols
  - [Bufdelete](https://github.com/famiu/bufdelete.nvim) : Better buffer deletion (weird at first with splits)
- LSP
  - [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) : Configuring neovim LSP
  - [mason](https://github.com/williamboman/mason.nvim) : Managing LSP servers, DAP servers, linters and formatters
  - [mason-tool-installer](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) : Install or upgrade all of your third-party tools
