return {
  "saghen/blink.cmp",
  lazy = false,
  version = not vim.g.lazyvim_blink_main and "*",
  build = vim.g.lazyvim_blink_main and "cargo build --release",
  opts_extend = {
    "sources.completion.enabled_providers",
    "sources.compat",
    "sources.default",
  },
  dependencies = {
    {
      "nvim-mini/mini.icons",
      version = false,
    },
    {
      "saghen/blink.compat",
      optional = true,
      opts = {},
      version = not vim.g.lazyvim_blink_main and "*",
    },
  },

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept, C-n/C-p for up/down)
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys for up/down)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-e: Hide menu
    -- C-k: Toggle signature help
    --
    -- See the full "keymap" documentation for information on defining your own keymap.

    keymap = {
      preset = "none",
      ["<Tab>"] = { "fallback" },
      ["<CR>"] = { "fallback" },
      ["<A-e>"] = { "show", "show_documentation", "hide_documentation" },
      ["<A-y>"] = { "select_and_accept" },
      ["<A-p>"] = { "select_prev", "fallback_to_mappings" },
      ["<A-n>"] = { "select_next", "fallback_to_mappings" },
      ["<A-b>"] = { "snippet_backward", "fallback" },
      ["<A-f>"] = { "snippet_forward", "fallback" },
      ["<A-j>"] = { "scroll_documentation_down", "fallback" },
      ["<A-k>"] = { "scroll_documentation_up", "show_signature", "hide_signature", "fallback" },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-e>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-y>"] = { "select_and_accept" },
      ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
      ["<C-n>"] = { "select_next", "fallback_to_mappings" },
      ["<C-b>"] = { "snippet_backward", "fallback" },
      ["<C-f>"] = { "snippet_forward", "fallback" },
      ["<C-j>"] = { "scroll_documentation_down", "fallback" },
      ["<C-k>"] = { "scroll_documentation_up", "fallback" },
    },

    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      -- Will be removed in a future release
      use_nvim_cmp_as_default = false,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = "normal",
    },

    signature = {
      enabled = true,
      window = {
        show_documentation = true,
      },
    },

    completion = {
      accept = {
        auto_brackets = { enabled = true },
      },
      menu = {
        draw = {
          treesitter = { "lsp" },
          components = {
            kind_icon = {
              text = function(ctx)
                local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                return kind_icon
              end,
              -- (optional) use highlights from mini.icons
              highlight = function(ctx)
                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                return hl
              end,
            },
            kind = {
              highlight = function(ctx)
                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                return hl
              end,
            },
          },
        },
      },

      ghost_text = { enabled = false },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          border = "none",
        },
      },
    },

    -- snippets = { preset = "luasnip" },
    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      -- `lsp`, `buffer`, `snippets`, `path` and `omni` are built-in
      -- so you don't need to define them in `sources.providers`
      default = { "lsp", "snippets", "buffer", "path" },
      providers = {},
    },

    cmdline = {
      enabled = false,
      keymap = {
        preset = "none",
        ["<Tab>"] = { "fallback" },
        ["<CR>"] = { "fallback" },
        ["<A-e>"] = { "show", "show_documentation", "hide_documentation" },
        ["<A-y>"] = { "select_and_accept" },
        ["<A-p>"] = { "select_prev", "fallback_to_mappings" },
        ["<A-n>"] = { "select_next", "fallback_to_mappings" },
        ["<A-b>"] = { "snippet_backward", "fallback" },
        ["<A-f>"] = { "snippet_forward", "fallback" },
        ["<A-j>"] = { "scroll_documentation_down", "fallback" },
        ["<A-k>"] = { "scroll_documentation_up", "fallback" },
        ["<C-e>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-y>"] = { "select_and_accept" },
        ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
        ["<C-n>"] = { "select_next", "fallback_to_mappings" },
        ["<C-b>"] = { "snippet_backward", "fallback" },
        ["<C-f>"] = { "snippet_forward", "fallback" },
        ["<C-j>"] = { "scroll_documentation_down", "fallback" },
        ["<C-k>"] = { "scroll_documentation_up", "fallback" },
      },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
}
