M = {}

DIAGNOSTICS_ACTIVE = true -- must be global since the toggle function is called in which.lua
-- toggle diagnostics line
M.toggle_diagnostics = function()
    DIAGNOSTICS_ACTIVE = not DIAGNOSTICS_ACTIVE
    if DIAGNOSTICS_ACTIVE then
        vim.diagnostic.show()
    else
        vim.diagnostic.hide()
    end
end

AUTOFORMAT_ACTIVE = true
-- toggle null-ls's autoformatting
M.toggle_autoformat = function()
    require("utils").notify("Toggling autoformatting", "info", "functions.lua")
    AUTOFORMAT_ACTIVE = not AUTOFORMAT_ACTIVE
end

function M.custom_lsp_attach(client, bufnr)
    -- disable formatting for LSP clients as this is handled by null-ls
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    local wk = require("which-key")
    local default_options = { silent = true }
    wk.register({
        g = {
            name = "LSP",
            D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration" },
            i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Show implementations" },
            R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
            a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
            d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition" },
            e = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
            -- f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
            k = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Commands" },
            l = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },
            n = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
            p = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
            q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix Diagnostics" },
            r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
            s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
            t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
        },
    }, { prefix = "<leader>", mode = "n", default_options })
end

return M
