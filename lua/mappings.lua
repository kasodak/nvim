local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Setting <leader> to <space>
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.mapleader = " "

-- Quits and writes
keymap("n", "<leader>q", ":quit!<cr>", opts)
keymap("n", "<leader>Q", ":quitall!<cr>", opts)
keymap("n", "<leader>w", ":update<cr>", opts)
keymap("n", "<leader>W", ":wall<cr>", opts)

-- Buffers
keymap("n", "<leader>N", ":enew<cr>", opts) -- New empty buffer
-- keymap("n", "<leader>c", ":bd!<cr>", opts)
-- keymap("n", "<TAB>", ":bnext<cr>", opts)
-- keymap("n", "<S-TAB>", ":bprevious<cr>", opts)

-- Tabs
keymap("n", "<leader>T", ":tabnew<cr>", opts)
keymap("n", "<leader><tab>", ":tabnext<cr>", opts)
keymap("n", "<leader><s-tab>", ":tabprevious<cr>", opts)

-- No highlight search
keymap("n", "<leader>,", ":nohlsearch<cr>", opts)

-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)

-- Better page down and page up
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Better next and previous match 
keymap("n", "N", "Nzz", opts)
keymap("n", "n", "nzz", opts)

---
-- EasyAlign

