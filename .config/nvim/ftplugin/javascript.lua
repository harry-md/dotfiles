vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.expandtab = true

local root_dir = vim.fs.root(0, { "package.json", "tsconfig.json", "jsconfig.json" })
if not root_dir then
  return
end

vim.lsp.start({
  name = "vtsls",
  cmd = { "vtsls", "--stdio" },
  root_dir = root_dir,

  settings = {
    vtsls = {
      autoUseWorkspaceTsdk = true,
      experimental = { completion = { enableServerSideFuzzyMatch = true } },
    },
    javascript = {
      updateImportsOnFileMove = { enabled = "always" },
      inlayHints = {
        parameterNames = { enabled = "none" },
        parameterTypes = { enabled = false },
        variableTypes = { enabled = false },
        propertyDeclarationTypes = { enabled = false },
        functionLikeReturnTypes = { enabled = false },
        enumMemberValues = { enabled = false },
      },
    },
    typescript = {
      updateImportsOnFileMove = { enabled = "always" },
      inlayHints = {
        parameterNames = { enabled = "all" },
        parameterTypes = { enabled = true },
        variableTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        enumMemberValues = { enabled = true },
      },
    },
  },

  on_attach = function(client, bufnr)
    if vim.lsp.inlay_hint then
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end
  end,
})
