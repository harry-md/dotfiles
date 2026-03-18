return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended
  },
  lazy = false, -- neo-tree will lazily load itself
  opts = {
    -- 1. CONFIG: Window Width
    window = {
      position = "left", -- left, right, top, bottom
      width = 30, -- width of the window
      mapping_options = {
        noremap = true,
        nowait = true,
      },
    },

    -- 2. CONFIG: Group Empty Folders (Java style)
    filesystem = {
      filtered_items = {
        visible = true, -- when true, they will just be displayed differently than normal items
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      -- This is the feature you want:
      group_empty_dirs = true,

      -- Optional: separate them with a specific character if you want, default is /
      -- renderers = {
      --   directory = {
      --     { "current_filter" },
      --     { "name", group_empty_dirs = true },
      --   }
      -- }
    },
  },
}
