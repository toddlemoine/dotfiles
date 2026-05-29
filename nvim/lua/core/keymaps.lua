local keymap = vim.keymap.set

-- General
keymap("i", "jj", "<Esc>")
keymap("v", "v", "<Esc>")
keymap("n", "<leader>s", ":w<CR>")
keymap("n", "<Esc><Esc>", ":nohlsearch<CR>")

-- Better split navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- Buffer navigation
keymap("n", "<leader>l", ":bnext<CR>")
keymap("n", "<leader>h", ":bprevious<CR>")
keymap("n", "<leader>q", ":bp | bd #<CR>") -- Close buffer, keep split
keymap("n", "<leader>T", ":enew<CR>")

-- Keep your original move linewise
keymap("n", "j", "gj")
keymap("n", "k", "gk")

-- Replicate your dw -> daw preference
keymap("n", "dw", "daw")
