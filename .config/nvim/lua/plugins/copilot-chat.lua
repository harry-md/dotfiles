return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      model = "gpt-5.3-codex",
      temperature = 0.2,
      window = {
        layout = "vertical",
        width = 0.4,
      },
      auto_insert_mode = true,
    },
  },
}
