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

-- Can thiệp vào 'textDocument/hover' của LSP để clean text
-- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
-- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
--   if syntax == "markdown" then
--     for i, line in ipairs(contents) do
--       if type(line) == "string" then
--         -- Cách 1: Giữ lại text hiển thị, xóa link (biến thành link rỗng)
--         -- [Integer.MAX_VALUE](jdt://...) -> [Integer.MAX_VALUE]()
--         contents[i] = line:gsub("%((jdt://.-)%)", "()")
--
--         -- Cách 2: (Giống nvim-java hơn) Xóa sạch link, chỉ để lại text
--         -- [Integer.MAX_VALUE](jdt://...) -> Integer.MAX_VALUE
--         -- contents[i] = line:gsub("%[([^%]]*)%]%((jdt://.-)%)", "%1")
--       end
--     end
--   end
--   return orig_util_open_floating_preview(contents, syntax, opts, ...)
-- end

-- lua/config/options.lua
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  -- Hàm làm sạch text (định nghĩa 1 lần dùng cho gọn)
  local function clean(text)
    -- Cách 1: Biến [Text](jdt://...) thành Text (giống nvim-java - Sạch trơn)
    text = text:gsub("%[([^%]]*)%]%((jdt://[^)]*)%)", "%1")

    -- Cách 2: Xử lý các link jdt:// đứng một mình (không có [] bao quanh)
    text = text:gsub("%((jdt://[^)]*)%)", "")

    return text
  end

  -- Kiểm tra dữ liệu đầu vào và áp dụng hàm clean
  if syntax == "markdown" and contents then
    -- Trường hợp 1: Chuẩn mới (Markdown Object) -> { kind = 'markdown', value = '...' }
    if type(contents) == "table" and contents.kind == "markdown" then
      contents.value = clean(contents.value)

    -- Trường hợp 2: Chuẩn cũ (List of strings) -> { "line1", "line2" }
    elseif type(contents) == "table" then
      for i, line in ipairs(contents) do
        if type(line) == "string" then
          contents[i] = clean(line)
        elseif type(line) == "table" and line.kind == "markdown" then
          -- Đôi khi mảng lại chứa object con
          line.value = clean(line.value)
        end
      end
    end
  end

  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
