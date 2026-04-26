return {
  {
    "vague2k/vague.nvim",
    config = function()
      require("vague").setup({
        bold = true,
        italic = false,
        transparent = false,
        -- style = {
        --   boolean = "none",
        --   number = "none",
        --   float = "none",
        --   error = "bold",
        --   comments = "italic",
        --   conditionals = "none",
        --   functions = "none",
        --   headings = "bold",
        --   operators = "none",
        --   strings = "none",
        --   variables = "none",
        --
        --   keywords = "none",
        --   keyword_return = "italic",
        --   keywords_loop = "none",
        --   keywords_label = "none",
        --   keywords_exception = "none",
        --
        --   builtin_constants = "bold",
        --   builtin_functions = "none",
        --   builtin_types = "bold",
        --   builtin_variables = "none",
        -- },
        -- Override colors
        colors = {
          bg = "#141413",
          fg = "#faf9f5",
          -- floatBorder = "#878787",
          -- line = "#282830",
          -- comment = "#646477",
          -- builtin = "#bad1ce",
          -- func = "#be8c8c",
          -- string = "#deb896",
          -- number = "#d2a374",
          -- property = "#c7c7d4",
          -- constant = "#b4b4ce",
          -- parameter = "#b9a3ba",
          -- visual = "#363738",
          -- error = "#d2788c",
          -- warning = "#e6be8c",
          -- hint = "#8ca0dc",
          -- operator = "#96a3b2",
          -- keyword = "#7894ab",
          -- type = "#a1b3b9",
          -- search = "#465362",
          -- plus = "#8faf77",
          -- delta = "#e6be8c",
        },
      })
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      variant = "auto",
      dark_variant = "main",
      dim_inactive_windows = false,
      extend_background_behind_borders = true,

      enable = {
        terminal = true,
        legacy_highlights = true,
        migrations = true,
      },

      styles = {
        bold = true,
        italic = false,
        transparency = false,
      },

      groups = {
        border = "muted",
        link = "iris",
        panel = "surface",

        error = "love",
        hint = "iris",
        info = "foam",
        note = "pine",
        todo = "rose",
        warn = "gold",

        git_add = "foam",
        git_change = "rose",
        git_delete = "love",
        git_dirty = "rose",
        git_ignore = "muted",
        git_merge = "iris",
        git_rename = "pine",
        git_stage = "iris",
        git_text = "rose",
        git_untracked = "subtle",

        h1 = "iris",
        h2 = "foam",
        h3 = "rose",
        h4 = "gold",
        h5 = "pine",
        h6 = "foam",
      },

      palette = {},
    },
  },
}
