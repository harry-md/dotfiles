return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "InsertEnter",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = false,
      hide_during_completion = false,
      keymap = {
        accept = "<Tab>",
        next = "<A-]>",
        prev = "<A-[>",
        dismiss = "<C-]>",
        toggle_auto_trigger = "<A-\\>",
      },
    },
    panel = { enabled = false },
    filetypes = {
      markdown = false,
      help = false,
      sh = function()
        if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
          -- disable for .env files
          return false
        end
        return true
      end,
    },
  },
}
