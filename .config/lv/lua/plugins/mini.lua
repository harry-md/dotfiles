return {
  {
    "nvim-mini/mini.nvim",
    version = false,
    config = function()
      local statusline = require("mini.statusline")
      statusline.setup()
      ---@diagnostic disable-next-line
      statusline.section_location = function()
        return "%l:%-v"
      end
    end,
  },
}
