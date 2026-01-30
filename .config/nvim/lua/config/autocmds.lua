vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "txt", "csv" },
  callback = function()
    vim.opt_local.spell = false
    vim.opt_local.wrap = false
  end,
})
