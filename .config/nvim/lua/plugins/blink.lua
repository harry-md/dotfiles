return {
  "saghen/blink.cmp",
  lazy = false,
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
      use_nvim_cmp_as_default = false,
      nerd_font_variant = "normal",
    },

    signature = {
      enabled = false,
      window = {
        show_documentation = true,
      },
    },

    completion = {
      accept = {
        auto_brackets = { enabled = true },
      },
      menu = {
        border = "rounded",
        auto_show = true,
        auto_show_delay_ms = 300,
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
        auto_show_delay_ms = 500,
        treesitter_highlighting = true,
        window = {
          border = "rounded",
        },
      },
    },

    -- snippets = { preset = "luasnip" },
    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { "lsp", "snippets", "buffer", "path" },
      providers = {},
    },

    cmdline = {
      enabled = false,
    },
    fuzzy = {
      implementation = "prefer_rust_with_warning",
    },
  },
}
