return {
  "nvim-mini/mini.statusline",
  config = function()
    local statusline = require("mini.statusline")

    statusline.setup({
      content = {
        active = function()
          -- Default sections
          local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
          local git = statusline.section_git({ trunc_width = 75 })
          local diff = statusline.section_diff({ trunc_width = 75 })
          local diagnostics = statusline.section_diagnostics({ trunc_width = 75 })
          local filename = statusline.section_filename({ trunc_width = 140 })

          -- Improved File Info (remove encoding/format)
          local fileinfo = statusline.section_fileinfo({ trunc_width = 120 })
          local clean_fileinfo = fileinfo:gsub("%s?%S+%.?%S*%[%S+%]%s?", " ")

          -- Clean Location (Line:Column)
          local location = string.format("%d:%d", vim.fn.line("."), vim.fn.col("."))

          return statusline.combine_groups({
            { hl = mode_hl, strings = { mode } },
            { hl = "MiniStatuslineDevinfo", strings = { git, diff, diagnostics } },
            "%<",
            { hl = "MiniStatuslineFilename", strings = { filename } },
            "%=",
            { hl = "MiniStatuslineFileinfo", strings = { clean_fileinfo } },
            { hl = "MiniStatuslineFileinfo", strings = { location } },
          })
        end,
      },
    })
  end,
}
