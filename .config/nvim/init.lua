require("config.lazy")

vim.cmd.colorscheme("vscode")
require("oil").setup()
require("treesitter-context").setup()
-- require("el").setup({})
require("mini.statusline")
require("diffview")
