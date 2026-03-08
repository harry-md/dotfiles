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

-- CÁCH AN TOÀN, GIỮ LẠI ĐỀ PHÒNG. DÙNG ĐỂ LOẠI BỎ jdt:// KHI HOVER TRONG FILE JAVA
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

-- CÁCH TỐI ƯU. DÙNG ĐỂ LOẠI BỎ jdt:// KHI HOVER TRONG FILE JAVA
-- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
-- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
--   -- Hàm làm sạch text (định nghĩa 1 lần dùng cho gọn)
--   local function clean(text)
--     -- Cách 1: Biến [Text](jdt://...) thành Text (giống nvim-java - Sạch trơn)
--     -- text = text:gsub("%[([^%]]*)%]%((jdt://[^)]*)%)", "%1")
--
--     -- Cách 2: Xử lý các link jdt:// đứng một mình (không có [] bao quanh)
--     text = text:gsub("%((jdt://[^)]*)%)", "")
--
--     return text
--   end
--
--   -- Kiểm tra dữ liệu đầu vào và áp dụng hàm clean
--   if syntax == "markdown" and contents then
--     -- Trường hợp 1: Chuẩn mới (Markdown Object) -> { kind = 'markdown', value = '...' }
--     if type(contents) == "table" and contents.kind == "markdown" then
--       contents.value = clean(contents.value)
--
--     -- Trường hợp 2: Chuẩn cũ (List of strings) -> { "line1", "line2" }
--     elseif type(contents) == "table" then
--       for i, line in ipairs(contents) do
--         if type(line) == "string" then
--           contents[i] = clean(line)
--         elseif type(line) == "table" and line.kind == "markdown" then
--           -- Đôi khi mảng lại chứa object con
--           line.value = clean(line.value)
--         end
--       end
--     end
--   end
--   return orig_util_open_floating_preview(contents, syntax, opts, ...)
-- end

-- GOAT
-- Hàm dọn dẹp link jdt:// dùng chung
local function clean_jdtls_text(text)
  if type(text) ~= "string" then
    return text
  end
  -- Biến [Text](URL) thành [Text] (Giữ lại ngoặc vuông và nội dung, xóa ngoặc tròn chứa link)
  text = text:gsub("(%b[])(%b())", "%1")
  -- Xóa các link jdt:// đứng bơ vơ một mình nếu có: (jdt://...) -> rỗng
  text = text:gsub("%(jdt://.-%)", "")
  return text
end

-- 1. Bắt ngay lúc Neovim dịch data từ LSP thành mảng các dòng (Blink.cmp dùng cái này để lấy text)
local orig_convert = vim.lsp.util.convert_input_to_markdown_lines
function vim.lsp.util.convert_input_to_markdown_lines(input, contents)
  if type(input) == "table" and input.value then
    input.value = clean_jdtls_text(input.value)
  elseif type(input) == "string" then
    input = clean_jdtls_text(input)
  end
  return orig_convert(input, contents)
end

-- 2. Bắt ngay lúc Neovim style cái text đó lên buffer (Dành cho các UI plugin khác fallback về)
local orig_stylize = vim.lsp.util.stylize_markdown
function vim.lsp.util.stylize_markdown(bufnr, contents, opts)
  if type(contents) == "table" then
    for i, line in ipairs(contents) do
      if type(line) == "string" then
        contents[i] = clean_jdtls_text(line)
      end
    end
  end
  return orig_stylize(bufnr, contents, opts)
end

-- 3. Giữ lại fix cho Hover chuẩn của Neovim (Shift+K)
local orig_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  if syntax == "markdown" and contents then
    if type(contents) == "table" and contents.kind == "markdown" then
      contents.value = clean_jdtls_text(contents.value)
    elseif type(contents) == "table" then
      for i, line in ipairs(contents) do
        if type(line) == "string" then
          contents[i] = clean_jdtls_text(line)
        elseif type(line) == "table" and line.kind == "markdown" then
          line.value = clean_jdtls_text(line.value)
        end
      end
    end
  end
  return orig_open_floating_preview(contents, syntax, opts, ...)
end
