M = {}

M.lua = {
    cmd = { "lua-language-server" },
    format = {
        enable = false, -- let null-ls handle the formatting
    },
    filetypes = { "lua" },
    runtime = {
        version = "LuaJIT",
    },
    completion = { enable = true, callSnippet = "Both" },
    diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim", "describe", "it", "before_each", "after_each", "packer_plugins" },
    },
    workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        },
        maxPreload = 2000,
        preloadFileSize = 20000,
    },
    telemetry = { enable = false },
}

return M
