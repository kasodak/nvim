M = {}

DIAGNOSTICS_ACTIVE = true -- must be global since the toggle function is called in which.lua
-- toggle diagnostics line
local function toggle_diagnostics()
    if DIAGNOSTICS_ACTIVE then
        vim.diagnostic.hide()
        DIAGNOSTICS_ACTIVE = false
    else
        vim.diagnostic.show()
        DIAGNOSTICS_ACTIVE = true
    end
end

AUTOFORMAT_ACTIVE = true
-- toggle null-ls's autoformatting
local function toggle_autoformat()
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
        l = {
            name = "LSP",
            D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go To Declaration" },
            d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go To Definition" },
            R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
            r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
            a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
            f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
            i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Show implementations" },
            k = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Commands" },
            l = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },
            n = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
            p = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
            q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix Diagnostics" },
            t = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Type Definition" },
            T = { toggle_diagnostics, "Toggle diagnostics" },
        },
    }, { prefix = "<leader>", mode = "n", default_options })
end

return M
