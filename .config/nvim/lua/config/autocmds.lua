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

-- Fix indentation disappearing after Javadoc lookup (Shift+K)
-- vim.api.nvim_create_autocmd({ "WinClosed", "BufEnter" }, {
--   pattern = "java",
--   callback = function()
--     -- Check if the current buffer is Java
--     if vim.bo.filetype == "java" then
--       vim.schedule(function()
--         Snacks.indent.enable()
--       end)
--     end
--   end,
-- })
