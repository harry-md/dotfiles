return {
  "mason-org/mason.nvim",
  dependencies = {
    {
      "mason-org/mason-lspconfig.nvim",
      opts = {
        automatic_enable = {
          exclude = {
            "jdtls",
          },
        },
      },
    },
  },
  opts = {
    ensure_installed = {
      "jdtls",
      "clang-format",
      "tex-fmt",
    },
  },
}
