-- Disable built-in plugins
vim.g.loaded_osc52 = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Disable Provider
-- Stop Neovim from checking your system for Python/Node/Ruby/Perl on startup.
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

--
require("config.lazy")

vim.cmd.colorscheme("roseprime")
require("oil").setup()
require("treesitter-context").setup()
require("plugins.vim-fugitive")
-- require("el").setup({})

require("mini.statusline")
