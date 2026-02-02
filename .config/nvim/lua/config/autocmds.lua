vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "csv", "text", "bigfile" },
  callback = function()
    vim.opt_local.spell = false
    vim.opt_local.wrap = false
  end,
})
