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
      "biome",
      "clang-format",
      "emmet-ls",
      "prettierd",
      "gitui",
      "hyprls",
      "lemminx",
      "ruff",
      "ty",
      "shellcheck",
      "stylelint",
      "tailwindcss-language-server",
      "tombi",
      -- "typescript-language-server",
      "vtsls",
      "yaml-language-server",
      "jdtls",
    },
  },
}
