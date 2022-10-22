local present, whichkey = pcall(require, "which-key")

if not present then
    return
end

local conf = {
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 2, 4, 2, 4 }, -- extra window margin [top, right, bottom, left]
        padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
        winblend = 1
    },
    plugins = {
        registers = false
    }
}

local opts = {
    mode = "n", -- Normal mode
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
}

whichkey.setup(conf)

local default_mappings = { }

local ctrl_mappings = {
    g = {
        name = "Git stuff",
        n = { "<cmd>Gitsigns next_hunk<cr>", "Next hunk" },
        p = { "<cmd>Gitsigns prev_hunk<cr>", "Previous hunk" },
        s = { "<cmd>Gitsigns preview_hunk<cr>", "Preview hunk" },
        d = { "<cmd>Gvdiffsplit master<cr>", "Verticall diff split of master" },
        u = { "<cmd>Gitsigns reset_hunk<cr>", "Reset hunk" },
        b = { "<cmd>Gitsigns blame_line<cr>", "Blame line" }
    },
}

local leader_mappings = {
    ["<leader>"] = {
        e = {
            name = "Edit",
            s = { "<cmd>edit $MYVIMRC | :cd %:p:h <CR>", "Settings"},
        },

        b = {
            name = "Buffer",
            D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
        },

        c = { "<cmd>Bdelete!<cr>", "Buffer delete" },

        f = {
            name = "Find",
            f = { "<cmd>FzfLua files<cr>", "Files" },
            b = { "<cmd>FzfLua buffers<cr>", "Buffers" },
            o = { "<cmd>FzfLua oldfiles<cr>", "Old files" },
            G = { "<cmd>FzfLua live_grep<cr>", "Live grep" },
            g = { "<cmd>FzfLua grep<cr>", "Grep" },
            e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
        },

        z = {
            name = "Packer",
            c = { "<cmd>PackerCompile<cr>", "Compile" },
            i = { "<cmd>PackerInstall<cr>", "Install" },
            p = { "<cmd>PackerProfile<cr>", "Profile" },
            s = { "<cmd>PackerSync<cr>", "Sync" },
            S = { "<cmd>PackerStatus<cr>", "Status" },
            u = { "<cmd>PackerUpdate<cr>", "Update" },
        },

        l = {
            name = "LSP",
            S = { "<cmd>LspStart<cr>", "Start" },
            s = { "<cmd>LspStop<cr>", "Stop" },
            i = { "<cmd>LspInfo<cr>", "Info" },
        },

        s = {
            name = "Session",
            s = { "<cmd>lua require('utils.session').save()<cr>", "Save" },
            l = { "<cmd>lua require('utils.session').list()<cr>", "List" },
        }
    }
}

whichkey.register(leader_mappings, opts)
whichkey.register(ctrl_mappings, opts)