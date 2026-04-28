return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      html = {},
      css = { "biome" },
      scss = { "prettierd" },
      markdown = { "prettierd" },
      java = { "palantir-java-format" },
      xml = { "lemminx" },
      js = { "biome" },
      jsx = { "biome" },
      javascript = { "biome" },
      ts = { "biome" },
      tsx = { "biome" },
      typescript = { "biome" },
      json = { "biome" },
      sql = { "sqlfmt" },
    },
    formatters = {
      ["palantir-java-format"] = {
        command = vim.fn.expand("~/.local/bin/palantir-java-format-linux-glibc_x86-64.bin"),
        args = { "--aosp", "-" },
        stdin = true,
      },
      ["sqlfmt"] = {
        args = { "--dialect", "clickhouse", "--fast", "-" },
      },
    },
  },
}
