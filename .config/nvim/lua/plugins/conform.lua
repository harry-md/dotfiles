return {
  "stevearc/conform.nvim",
  lazy = false,
  opts = {
    formatters_by_ft = {
      py = { "ruff_organize_imports", "ruff_fix", "ruff_format" },
      python = { "ruff_organize_imports", "ruff_fix", "ruff_format" },
      css = { "oxfmt" },
      js = { "oxfmt" },
      javascriptreact = { "oxfmt" },
      jsx = { "oxfmt" },
      javascript = { "oxfmt" },
      typescript = { "oxfmt" },
      ts = { "oxfmt" },
      tsx = { "oxfmt" },
      typescriptreact = { "oxfmt" },
      json = { "oxfmt" },
      jsonc = { "oxfmt" },
      html = {},
      markdown = { "oxfmt" },
      dockerfile = { "dprint" },
      java = { "palantir-java-format" },
      xml = { "xmlformatter" },
      c = { "clang-format" },
      tex = { "tex-fmt" },
      bib = { "tex-fmt" },
      toml = { "oxfmt" },
    },
    default_format_opts = {
      lsp_format = "never",
    },
    formatters = {
      ["oxfmt"] = {
        command = "oxfmt",
        args = {
          "--stdin-filepath",
          "$FILENAME",
          "--config",
          vim.fn.expand("~/.config/oxfmt/.oxfmtrc.json"),
        },
        stdin = true,
      },
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
