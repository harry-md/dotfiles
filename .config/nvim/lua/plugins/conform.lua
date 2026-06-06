return {
  "stevearc/conform.nvim",
  lazy = false,
  opts = {
    formatters_by_ft = {
      html = {},
      css = { "biome" },
      scss = { "prettierd" },
      markdown = { "prettierd" },
      java = { "palantir-java-format" },
      xml = { "xmlformatter" },
      js = { "biome" },
      javascriptreact = { "biome" },
      jsx = { "biome" },
      javascript = { "biome" },
      typescript = { "biome" },
      ts = { "biome" },
      tsx = { "biome" },
      json = { "biome" },
      sql = { "sqlfmt" },
    },
    default_format_opts = {
      lsp_format = "never",
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
