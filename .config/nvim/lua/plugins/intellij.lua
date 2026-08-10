return {
  "gipo355/nvim-intellij-lsp",
  ft = { "java", "xml" },
  opts = {
    server_dir = "~/.local/share/intellij-server",
    jvm_args = { "-Xmx4g" },
    completion_fix = true,
    build_tool = "maven",
  },
}
