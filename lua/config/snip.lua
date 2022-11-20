local snippets_folder = vim.fn.stdpath "config" .. "/snippets/"
local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = false,

    store_selection_keys = "<C-q>",
}

-- Lazy load snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- Load custom snippets
-- require("luasnip.loaders.from_lua").lazy_load { paths = snippets_folder }
-- e.g.: require("luasnip.loaders.from_vscode").lazy_load { paths = { "./snippets/typescript" } }

ls.filetype_extend("all", { "_" })


