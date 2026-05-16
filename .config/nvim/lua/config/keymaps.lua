local opts = { silent = true }
local set = vim.keymap.set

-- rename keymap
set("n", "<leader>rn", ":IncRename ")
set("v", "<C-a>", "ggVG", { desc = "Select [a]ll" })
-- jump between buffers
set("n", "<c-j>", "<c-w><c-j>")
set("n", "<c-l>", "<c-w><c-l>")
set("n", "<c-h>", "<c-w><c-h>")
set("n", "<c-k>", "<c-w><c-k>")
set("n", "<Esc>h", "<c-w><c-h>", { silent = true })
set("n", "<Esc>l", "<c-w><c-l>", { silent = true })

-- jump to next diagnostics
set("n", "<leader>dn", require("snacks.picker").diagnostics, { desc = "Jump to [n]ext [d]iagnostics" })

-- keymap for cmd mode
set("c", "<C-h>", "<BS>")
set("c", "<C-f>", "<right>")
set("c", "<C-b>", "<left>")
set("c", "<C-a>", "<home>")
set("c", "<C-e>", "<end>")

-- resize splits
set("n", "<A-.>", "<c-w>5<")
set("n", "<A-,>", "<c-w>5>")
-- set("n", "<A-t>", "<C-W>+")
-- set("n", "<A-s>", "<C-W>-")

set({ "n", "i" }, "<A-s>", "<esc>:w<CR>")

-- for terminal mode
vim.api.nvim_set_keymap("t", "<esc>", "<C-\\><C-n>", { noremap = true })
set("n", "<leader>nt", ":vertical terminal<CR>", { silent = true, desc = "[n]ew vertical [t]erminal" })

set("n", "Y", "y$")
set("n", "dbw", "vbd")
set("n", "O", "O<esc>", opts)
set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

set("n", "<S-h>", "<C-^>", { desc = "MRU (Most Recently Used)" })
set("n", "<S-l>", ":bnext<CR>", { desc = "Switch to next buffer" })

set({ "i", "c", "t", "x" }, "<A-w>", "<C-w>")
set({ "n", "v" }, "<A-u>", "<C-u>")
set({ "n", "v" }, "<A-d>", "<C-d>")
set("n", "<A-o>", "<C-o>", { silent = true })

set("c", "<A-y>", "<CR>", { silent = true })
set({ "n", "i", "v", "c" }, "<A-n>", "<C-n>", { silent = true })
set({ "n", "i", "v", "c" }, "<A-p>", "<C-p>", { silent = true })
set({ "n", "i", "v", "c" }, "<A-y>", "<C-y>", { silent = true })
set("n", "K", ':lua vim.lsp.buf.hover({ border = "rounded" })<CR>', { silent = true })

-- go to definition
set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
-- go to references
set("n", "gD", vim.lsp.buf.references, { desc = "Go to references" })

-- delete buffer
set("n", "<S-x>", ":bd<CR>", {})
set("n", "<leader><space>", ":lua Snacks.picker.files()<CR>", { silent = true })

set("x", "p", "P", { noremap = true })
set({ "i", "n", "x" }, "<C-c>", "<esc>")
set({ "i", "n", "x" }, "<A-f>", "<esc>")
