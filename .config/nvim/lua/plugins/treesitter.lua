return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "c",
        "cpp",
        "csv",
        "css",
        "html",
        "htmldjango",
        "hyprlang",
        "java",
        "javadoc",
        "javascript",
        "lua",
        "go",
        "python",
        "jinja",
        "jinja_inline",
        "jsdoc",
        "json",
        "latex",
        "markdown",
        "python",
        "typescript",
      })
    end
  end,
}
