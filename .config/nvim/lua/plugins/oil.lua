return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  opts = {
    keymaps = {
      ["g?"] = { "actions.show_help", mode = "n" },
      ["<CR>"] = "actions.select",
      -- ["<C-s>"] = { "actions.select", opts = { vertical = true } },
      ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
      ["<C-t>"] = { "actions.select", opts = { tab = true } },
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = { "actions.close", mode = "n" },
      ["<C-l>"] = "actions.refresh",
      ["-"] = { "actions.parent", mode = "n" },
      ["_"] = { "actions.open_cwd", mode = "n" },
      ["`"] = { "actions.cd", mode = "n" },
      ["g~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
      ["gs"] = { "actions.change_sort", mode = "n" },
      ["gx"] = "actions.open_external",
      ["g."] = { "actions.toggle_hidden", mode = "n" },
      ["g\\"] = { "actions.toggle_trash", mode = "n" },
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "oil",
      callback = function()
        vim.keymap.set("n", "l", function()
          require("oil").select()
        end, { buffer = true, desc = "Open folder/file" })
        vim.keymap.set("n", "h", "-", { buffer = true, remap = true, desc = "Go to parent" })
      end,
    })
  end,
}
