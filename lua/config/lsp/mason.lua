local m_present, m = pcall(require, "mason")
local mlsp_present, mlspc = pcall(require, "mason-lspconfig")
local mtinst_present, mtinst = pcall(require, "mason-tool-installer")

if not m_present and not mlsp_present and not mtinst_present then
	return
end


m.setup() -- Default settings

mlspc.setup() -- Default settings

mtinst.setup {
    ensure_installed = {
        -- LSP
        "bash-language-server",
        "dockerfile-language-server",
        "json-lsp",
        "lua-language-server",
        "terraform-ls",
        "yaml-language-server",
        -- "python-lsp-server",
        "gopls",
        -- Formatter
        "stylua",
        -- Linter
        "shellcheck",
        "tflint",
        -- DAP
        -- Nothing yet
    },

    -- if set to true this will check each tool for updates. If updates
    -- are available the tool will be updated. This setting does not
    -- affect :MasonToolsUpdate or :MasonToolsInstall.
    -- Default: false
    auto_update = false,

    -- automatically install / update on startup. If set to false nothing
    -- will happen on startup. You can use :MasonToolsInstall or
    -- :MasonToolsUpdate to install tools and check for updates.
    -- Default: true
    run_on_start = true,

    -- set a delay (in ms) before the installation starts. This is only
    -- effective if run_on_start is set to true.
    -- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
    -- Default: 0
    start_delay = 3000, -- 3 second delay
}

