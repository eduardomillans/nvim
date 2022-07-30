local map = vim.keymap.set

-- Set keymaps
map("n", "<M-k>", "<CMD>resize -2<CR>", { silent = true })
map("n", "<M-j>", "<CMD>resize +2<CR>", { silent = true })
map("n", "<M-h>", "<CMD>vertical resize -2<CR>", { silent = true })
map("n", "<M-l>", "<CMD>vertical resize +2<CR>", { silent = true })

map("n", "gn", "<CMD>bnext<CR>", { silent = true })
map("n", "gp", "<CMD>bprevious<CR>", { silent = true })

map("n", "<", "<<", { noremap = true })
map("n", ">", ">>", { noremap = true })
map("v", "<", "<gv", { noremap = true })
map("v", ">", ">gv", { noremap = true })

map("n", "yae", "ggyG", { noremap = true })
map("n", "cae", "ggcG", { noremap = true })
map("n", "dae", "ggdG", { noremap = true })
map("n", "vae", "ggVG", { noremap = true })

map("n", ",,h", "<CMD>set hlsearch!<CR>", { silent = true })
map("n", ",,c", "<CMD>ColorizerToggle<CR>", { silent = true })

map("t", "<C-\\><Esc>", "<C-\\><C-n>", { noremap = true })
