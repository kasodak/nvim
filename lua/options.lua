local o          = vim.opt
local fn         = vim.fn

o.hlsearch       = true -- Set highlight on search
o.number         = true -- Make line numbers default
o.relativenumber = true -- Make relative number default

o.tabstop        = 4
o.shiftwidth     = 4
o.expandtab      = true -- Tabs to spaces

o.dir            = fn.stdpath("data") .. "/swp" -- swap file directory
o.signcolumn     = "auto:4"
-- o.lazyredraw     = true -- Do not redraw screen while running macros / interferes with noice.nvim
o.completeopt    = { "menu", "menuone", "noselect", "noinsert" } -- A comma separated list of options for Insert mode completion
o.fileencoding   = "utf-8" -- the encoding written to a file
o.updatetime     = 300 -- faster completion
o.splitbelow     = true -- force all horizontal splits to go below current window
o.splitright     = true -- force all vertical splits to go to the right of current window
o.mouse          = "" -- Disable mouse in all modes

o.cursorline     = true

o.termguicolors  = true -- Enable colors in terminal (partly for everforest)

o.foldmethod     = "expr"
o.foldexpr       = "nvim_treesitter#foldexpr()"
