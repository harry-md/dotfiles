return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      markdown = { "prettier" },
      java = { "google-java-format" },
      xml = { "lemminx" },
      html = { "htmlbeautifier" },
      js = { "biome" },
      javascript = { "biome" },
      ts = { "biome" },
      typescript = { "biome" },
      -- htmldjango = {},
    },
    formatters = {
      -- ["google-java-format"] = {
      --     prepend_args = { "--aosp" },
      -- },
    },
  },
}
