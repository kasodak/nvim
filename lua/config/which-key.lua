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

local default_opts = {
    mode = "n", -- Normal mode
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
}

whichkey.setup(conf)

local git_mappings = {
    g = {
        name = "Git stuff",
        d = {
            name = "Git diff",
            m = { "<cmd>Gvdiffsplit master<cr>", "Master" },
            h = { "<cmd>Gvdiffsplit HEAD~1<cr>", "HEAD ~ 1" },
            d = { "<cmd>Gitsigns preview_hunk_inline<cr>", "Preview hunk inline" },
        },
        S = { "<cmd>Gitsigns stage_hunk<cr>", "Stage hunk" },
        u = { "<cmd>Gitsigns reset_hunk<cr>", "Reset hunk" },
        b = { "<cmd>Gitsigns blame_line<cr>", "Blame line" },
        n = { "<cmd>Gitsigns next_hunk<cr>", "Next hunk" },
        g = { "<cmd>0G<cr>", "Fugitive UI" },
        c = {
            c = { "<cmd>Git commit<cr>", "Normal" },
            a = { "<cmd>Git commit --amend --no-edit<cr>", "Amend + no edit" },
        },
        a = { "<cmd>Git add %<cr>", "Git stage current file"},
        A = { "<cmd>Git add -A<cr>", "Git stage all"},
        p = {
            p = { "<cmd>Git push<cr>", "Git push to origin" },
            f = { "<cmd>Git push -f<cr>", "Git force push to origin" },
        },

        P = { "<cmd>Git pull<cr>", "Git pull" }

    },
}

local default_mappings = {
    ["<TAB>"] = { "<cmd>BufferLineCycleNext<cr>", "Bufferline cycle next" },
    ["<S-TAB>"] = { "<cmd>BufferLineCyclePrev<cr>", "Bufferline cycle prev" },

    -- ["["] = {
    --     c = {"<cmd>Gitsigns prev_hunk<cr>", "Previous hunk" },
    --     t = {"<cmd>lua require(\"todo-comments\").jump_prev()<cr>zz", "Prev TODO" },
    -- },
    -- ["]"] = {
    --     c = {"<cmd>Gitsigns next_hunk<cr>", "Next hunk" },
    --     t = {"<cmd>lua require(\"todo-comments\").jump_next()<cr>zz", "Next TODO" },
    -- },

    ["<leader>"] = {
        e = {
            name = "Edit",
            s = { "<cmd>edit $MYVIMRC | :cd %:p:h <CR>", "Settings"},
        },

        b = {
            name = "Buffer",
            D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
            p = { "<cmd>BufferLinePick<cr>", "Buffer line pick" },
            l = { "<cmd>BufferLineCloseLeft<cr>", "Buffer line close left" },
            r = { "<cmd>BufferLineCloseRight<cr>", "Buffer line close right" },
        },

        c = { "<cmd>Bdelete!<cr>", "Buffer delete" },

        f = {
            name = "Find",
            f = { "<cmd>FZF<cr>", "Files" },
            F = { "<cmd>FzfLua files<cr>", "Files" },
            b = { "<cmd>FzfLua buffers<cr>", "Buffers" },
            o = { "<cmd>FzfLua oldfiles<cr>", "Old files" },
            G = { "<cmd>FzfLua live_grep<cr>", "Live grep" },
            g = { "<cmd>FzfLua grep<cr>", "Grep" },
            e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
            E = { "<cmd>NvimTreeFindFileToggle<cr>", "Find file toggle" },
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

        s = {
            name = "Session",
            s = { "<cmd>lua require('utils.session').save()<cr>", "Save" },
            l = { "<cmd>lua require('utils.session').list()<cr>", "List" },
        },

        t = { "<cmd>lua require('utils.git-ascii').sth()<cr>", "List" },

    }
}

whichkey.register(default_mappings, default_opts)
whichkey.register(git_mappings, {prefix = "<leader>", default_opts})
