return {
  "stevearc/conform.nvim",
  lazy = false,
  opts = {
    formatters_by_ft = {
      py = { "ruff" },
      css = { "biome" },
      js = { "biome" },
      javascriptreact = { "biome" },
      jsx = { "biome" },
      javascript = { "biome" },
      typescript = { "biome" },
      ts = { "biome" },
      tsx = { "biome" },
      typescriptreact = { "biome" },
      json = { "biome" },
      jsonc = { "biome" },
      tex = { "tex-fmt" },
      html = {},
      markdown = { "dprint" },
      dockerfile = { "dprint" },
      java = { "palantir-java-format" },
      xml = { "xmlformatter" },
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
