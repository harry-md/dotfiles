return {
  "dmtrKovalenko/fff.nvim",
  build = function()
    require("fff.download").download_or_build_binary()
  end,
  opts = {
    max_threads = 2,
    enable_home_dir_scanning = false,
    frecency = {
      enabled = false,
    },
    debug = {
      enabled = false,
      show_scores = false,
    },
    layout = {
      height = 0.85,
      width = 0.85,
      prompt_position = "top",
      flex = { size = 130, wrap = "bottom" },
      border = nil,
    },
  },
  lazy = false,
  keys = {
    {
      "ff",
      function()
        require("fff").find_files()
      end,
      desc = "FFFind files",
    },
    {
      "fg",
      function()
        require("fff").live_grep()
      end,
      desc = "LiFFFe grep",
    },
    {
      "fz",
      function()
        require("fff").live_grep({ grep = { modes = { "fuzzy", "plain" } } })
      end,
      desc = "Live fffuzy grep",
    },
    {
      "fw",
      function()
        require("fff").live_grep_under_cursor()
      end,
      mode = { "n", "x" },
      desc = "Search current word / selection",
    },
  },
}
