vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.softtabstop = 2
vim.opt_local.expandtab = true

local root_dir = vim.fs.root(0, { "package.json", "tsconfig.json", "jsconfig.json" })
if not root_dir then
  return
end
