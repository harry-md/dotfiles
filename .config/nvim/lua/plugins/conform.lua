return {
  "stevearc/conform.nvim",
  lazy = false,
  opts = {
    formatters_by_ft = {
      py = { "ruff_organize_imports", "ruff_fix", "ruff_format" },
      python = { "ruff_organize_imports", "ruff_fix", "ruff_format" },
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
      html = {},
      markdown = { "dprint" },
      dockerfile = { "dprint" },
      java = { "palantir-java-format" },
      xml = { "xmlformatter" },
      c = { "clang-format" },
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
