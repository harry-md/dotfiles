require("config.lazy")

vim.cmd.colorscheme("vague")
require("oil").setup()
require("treesitter-context").setup()
require("plugins.vim-fugitive")
-- require("el").setup({})
require("mini.statusline")
