require("config.lazy")

vim.cmd.colorscheme("tokyonight-night")
require("oil").setup()
require("harpoon")
require("treesitter-context").setup()
require("el").setup({})
require("plugins.vim-fugitive")
