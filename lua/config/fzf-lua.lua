local present, fzf_lua = pcall(require, 'fzf-lua')

if not present then
    return
end

local actions = require('fzf-lua.actions')

fzf_lua.setup {
    actions = {
        files = {
            ["default"] = actions.file_edit,
        }
    }
}
