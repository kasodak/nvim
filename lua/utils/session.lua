local M = {}

vim.g.session_dir = vim.fn.stdpath "config" .. "/sessions"

if vim.fn.isdirectory(vim.g.session_dir) == 0 then
    vim.fn.mkdir(vim.g.session_dir, "p")
end

local function get_session_name()
    if vim.fn.trim(vim.fn.system "git rev-parse --is-inside-work-tree") == "true" then
        return vim.fn.trim(vim.fn.system "basename `git rev-parse --show-toplevel`")
    else
        return "Session.vim"
    end
end

local default_session_name = get_session_name()
local path = require "fzf-lua.path"

local function make_session(session_name)
    local cmd = "mks! " .. session_name
    vim.cmd(cmd)
end

function M.save()
    vim.ui.input({ prompt = "Input session name: ", default = default_session_name }, function(session_name)
        if session_name then
            session_name = vim.g.session_dir .. "/" .. session_name
            make_session(session_name)
        end
    end)
end

local function restore_session(selected, opts)
    local entry = path.entry_to_file(selected[1], opts, opts.force_uri)
    vim.cmd("source " .. vim.fn.fnameescape(entry.path))
end

function M.list()
    local opts = {
        winopts = {
            height = 0.25,
            width = 0.30,
            row = 0.35, -- window row position (0=top, 1=bottom)
            col = 0.50, -- window col position (0=left, 1=right)
        },
        prompt = "Sessions❯ ",
        cwd = vim.g.session_dir,
        show_cwd_header = false,
        previewer = false,
        actions = {
            ['default'] = function(selected, opts) -- Opts required for fzf-lua.path
                restore_session(selected, opts)
            end,
        },
    }

    require('fzf-lua').files(opts)

end

return M

