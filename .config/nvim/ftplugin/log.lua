vim.opt_local.wrap = false
vim.opt_local.linebreak = false
vim.opt_local.list = false
vim.opt_local.number = true
vim.opt_local.relativenumber = false
vim.opt_local.signcolumn = "no"

-- Fold
vim.opt_local.foldmethod = "expr"
vim.opt_local.foldexpr = "v:lua.SpringLogFoldExpr(v:lnum)"
vim.opt_local.foldtext = "v:lua.SpringLogFoldText()"
vim.opt_local.foldlevel = 99

-- Colors
-- IntelliJ-like terminal colors
vim.api.nvim_set_hl(0, "SpringLogError", { fg = "#ff3333", bold = true })
vim.api.nvim_set_hl(0, "SpringLogWarn", { fg = "#b58900", bold = true })
vim.api.nvim_set_hl(0, "SpringLogInfo", { fg = "#65b042" })
vim.api.nvim_set_hl(0, "SpringLogTrace", { fg = "#65b042" })
vim.api.nvim_set_hl(0, "SpringLogDebug", { fg = "#00afaf" })
vim.api.nvim_set_hl(0, "SpringLogException", { fg = "#ff3333", bold = true })
vim.api.nvim_set_hl(0, "SpringLogCausedBy", { fg = "#ff8700", bold = true })
vim.api.nvim_set_hl(0, "SpringLogSql", { fg = "#00afaf" })
vim.api.nvim_set_hl(0, "SpringLogParam", { fg = "#af5fff" })
vim.api.nvim_set_hl(0, "SpringLogClass", { fg = "#00afaf" })

vim.fn.matchadd("SpringLogError", "\\v\\c<ERROR>")
vim.fn.matchadd("SpringLogWarn", "\\v\\c<WARN>")
vim.fn.matchadd("SpringLogInfo", "\\v\\c<INFO>")
vim.fn.matchadd("SpringLogDebug", "\\v\\c<DEBUG>")
vim.fn.matchadd("SpringLogTrace", "\\v\\c<TRACE>")

vim.fn.matchadd("SpringLogException", "\\v\\c(\\w+\\.)*\\w*Exception")
vim.fn.matchadd("SpringLogCausedBy", "\\v\\c^Caused by:.*")
vim.fn.matchadd("SpringLogCausedBy", "\\v\\c^Suppressed:.*")

vim.fn.matchadd(
  "SpringLogSql",
  "\\v\\c\\b(select|insert|update|delete|from|where|join|left join|inner join|values|set|order by|group by|limit)\\b"
)
vim.fn.matchadd("SpringLogParam", "\\v\\c(binding parameter|extracting value|BasicBinder|jdbc\\.bind)")

-- Fold stacktrace lines
_G.SpringLogFoldExpr = function(lnum)
  local line = vim.fn.getline(lnum)

  if line:match("^%s+at%s+") then
    return "1"
  end

  if line:match("^Caused by:") or line:match("^Suppressed:") then
    return ">1"
  end

  if line:match("^%s*%.%.%. %d+ more") then
    return "1"
  end

  return "0"
end

_G.SpringLogFoldText = function()
  local line = vim.fn.getline(vim.v.foldstart)
  local count = vim.v.foldend - vim.v.foldstart + 1
  return "  ▶ " .. line .. "  [" .. count .. " lines]"
end
