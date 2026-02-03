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
      "stylua",
      "shfmt",
      "google-java-format",
      "biome",
      "clang-format",
      "clangd",
      "emmet-ls",
      "prettier",
      "gitui",
      "hyprls",
      "lemminx",
      "ruff",
      "ty",
      "shellcheck",
      "stylelint",
      "tailwindcss-language-server",
      "tombi",
      "typescript-language-server",
      "yaml-language-server",
      "jdtls",
    },
  },
}
