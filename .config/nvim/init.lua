require("config.lazy")

vim.cmd.colorscheme("vague")
require("oil").setup()
require("treesitter-context").setup()
-- require("el").setup({})
require("mini.statusline")

local glance = require("glance")
local actions = glance.actions

glance.setup({
  mappings = {
    list = {
      ["<A-u>"] = actions.preview_scroll_win(10),
      ["<A-d>"] = actions.preview_scroll_win(-10),

      ["<Tab>"] = actions.enter_win("preview"),
    },
    preview = {
      ["<Tab>"] = actions.enter_win("list"),
    },
  },
})

if vim.g.neovide then
  vim.opt.winblend = 100
  vim.opt.pumblend = 100
  vim.g.neovide_floating_blur_amount_x = 30
  vim.g.neovide_floating_blur_amount_y = 30
end
vim.lsp.enable("intellij")
