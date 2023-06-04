local api = vim.api

local terraformGrp = api.nvim_create_augroup("Syntax highlight", { clear = true })
api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = { "*.tf" },
    command = "set sw=2 tl=2 ts=2",
    group = terraformGrp
})
-- api.nvim_create_autocmd({"BufWritePost"}, {
--     pattern = { "*.tf" },
--     command = "%!terraform fmt",
--     group = terraformGrp
-- })
