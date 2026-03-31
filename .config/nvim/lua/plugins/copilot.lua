return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "BufReadPost",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = false,
      hide_during_completion = false,
      keymap = {
        accept = "<Tab>",
        next = "<A-]>",
        prev = "<A-[>",
        toggle_auto_trigger = "<A-\\>",
      },
    },
    panel = { enabled = false },
    filetypes = {
      markdown = false,
      help = false,
    },
  },
}
