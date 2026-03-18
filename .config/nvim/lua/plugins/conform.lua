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
    formatters = {
      ["google-java-format"] = {},
    },
  },
}
