return {
  "NeogitOrg/neogit",
  lazy = true,
  dependencies = {
    "esmuellert/codediff.nvim",
  },
  cmd = "Neogit",
  keys = {
    { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
  },
}
