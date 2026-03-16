return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      css = { "biome" },
      scss = { "prettierd" },
      markdown = { "prettier" },
      java = { "palantir-java-format" },
      xml = { "lemminx" },
      js = { "biome" },
      javascript = { "biome" },
      ts = { "biome" },
      typescript = { "biome" },
      json = { "biome" },
    },
    formatters = {
      ["palantir-java-format"] = {
        command = vim.fn.expand("~/.local/bin/palantir-java-format-native.bin"),
        args = { "--aosp", "-" },
        stdin = true,
      },
    },
  },
}
