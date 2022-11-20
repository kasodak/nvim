local present, nvim_lsp = pcall(require, "lspconfig")

if not present then
	return
end

local utils = require("config.lsp.utils")
local opts = require("config.lsp.opts")

local capabilities = vim.lsp.protocol.make_client_capabilities()
-- enable autoclompletion via nvim-cmp
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
-- enable folding capabilities for nvim-ufo
-- capabilities.textDocument.foldingRange = {
--     dynamicRegistration = false,
--     lineFoldingOnly = true,
-- }

local servers = {
    "gopls",
    "ansiblels",
    "bashls",
    "dockerls",
    "jsonls",
    "yamlls",
    "sumneko_lua",
    "terraformls",
}

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup({
        on_attach = function(client, bufnr)
            utils.custom_lsp_attach(client, bufnr)
        end,
        capabilities = capabilities,
        flags = { debounce_text_changes = 150 },
        settings = {
            Lua = opts.lua,
            -- yaml = opts.yaml,
        },
    })
end
