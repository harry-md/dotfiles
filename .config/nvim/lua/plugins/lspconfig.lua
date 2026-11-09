return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      clangd = { mason = false },
      lemminx = { mason = false },
      vtsls = { mason = false },
      jdtls = { mason = false },
      ty = {
        mason = false,
        settings = {
          ty = {
            inlayHints = {
              variableTypes = false,
              callArgumentNames = true,
            },
          },
        },
      },
      lua_ls = {
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            codeLens = { enable = true },
            completion = { callSnippet = "Replace" },
            doc = { privateName = { "^_" } },
            hint = {
              enable = true,
              setType = false,
              paramType = true,
              paramName = "Disable",
              semicolon = "Disable",
              arrayIndex = "Disable",
            },
          },
        },
      },
    },
    setup = {
      jdtls = function()
        return true
      end,
    },
  },
}
