require("config.lazy")

vim.cmd.colorscheme("vague")
require("oil").setup()
require("treesitter-context").setup()
-- require("el").setup({})
require("mini.statusline")

if vim.g.neovide then
  vim.opt.winblend = 100
  vim.opt.pumblend = 100
  vim.g.neovide_floating_blur_amount_x = 30
  vim.g.neovide_floating_blur_amount_y = 30
end
