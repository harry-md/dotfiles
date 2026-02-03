-- 1. Disable built-in plugins
vim.g.loaded_osc52 = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 2. Disable "Provider" checks (The Fix)
-- This stops Neovim from checking your system for Python/Node/Ruby/Perl on startup.
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- 3. Force Clipboard (Optimization)
-- Since you have wl-clipboard, we hardcode it to stop Neovim from probing the system.
vim.g.clipboard = {
  name = "WlClipboard",
  copy = {
    ["+"] = "wl-copy",
    ["*"] = "wl-copy",
  },
  paste = {
    ["+"] = "wl-paste --no-newline",
    ["*"] = "wl-paste --no-newline",
  },
  cache_enabled = 1,
}

--
require("config.lazy")

vim.cmd.colorscheme("roseprime")
require("oil").setup()
require("treesitter-context").setup()
require("plugins.vim-fugitive")
-- require("el").setup({})

require("mini.statusline")
