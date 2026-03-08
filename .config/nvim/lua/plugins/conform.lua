return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      css = { "prettier" },
      scss = { "prettier" },
      markdown = { "prettier" },
      java = { "google-java-format" },
      xml = { "lemminx" },
      js = { "biome" },
      javascript = { "biome" },
      ts = { "biome" },
      typescript = { "biome" },
    },
    -- formatters = {
    --   ["google-java-format"] = {
    --     prepend_args = { "--aosp" }, -- Ensure 4-space indentation
    --   },
    -- },
  },
}
