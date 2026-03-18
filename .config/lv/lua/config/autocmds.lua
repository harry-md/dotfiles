vim.api.nvim_create_autocmd("FileType", {
  pattern = { "csv", "text", "bigfile" },
  callback = function()
    vim.opt_local.spell = false
    vim.opt_local.wrap = false
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = false
  end,
})
