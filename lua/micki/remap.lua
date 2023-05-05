-- leader is space
-- syntax is 1st: mode, 2nd: what is pressed, 3rd: execute this
-- example: while in normal mode, I press <leader>pv then execute vim.cmd.Ex
vim.keymap.set("n", "<C-x>", vim.cmd.Ex)

--vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
--vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--
--vim.keymap.set("n", "J", "mzJ`z")
--vim.keymap.set("n", "<C-d>", "<C-d>zz")
--vim.keymap.set("n", "<C-u>", "<C-u>zz")
--vim.keymap.set("n", "n", "nzzzv")
--vim.keymap.set("n", "N", "Nzzzv")

--vim.keymap.set("n", "<leader>y", "\"+y")
--vim.keymap.set("v", "<leader>y", "\"+y")
--vim.keymap.set("v", "<C-y>", "\"+y")
--vim.keymap.set("n", "<leader>Y", "\"+Y")
--vim.keymap.set("n", "Y", "yy")
--
--vim.keymap.set("n", "<leader>d", "\"_d")
--vim.keymap.set("v", "<leader>d", "\"_d")

--vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<C-h>", ":tabprevious<CR>")
vim.keymap.set("n", "<C-l>", ":tabnext<CR>")


-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
