return {
  "saghen/blink.cmp",
  event = { "BufReadPost", "BufNewFile" },
  version = "*",
  dependencies = { "xzbdmw/colorful-menu.nvim", opts = {} },
  opts_extend = {
    "sources.completion.enabled_providers",
    "sources.compat",
    "sources.default",
  },
  opts = {
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          border = "rounded",
        },
      },
      ghost_text = {
        enabled = true,
      },
      menu = {
        border = "rounded",
        draw = {
          -- We don't need label_description now because label and label_description are already
          -- combined together in label by colorful-menu.nvim.
          columns = { { "kind_icon" }, { "label", gap = 1 } },
          components = {
            label = {
              text = function(ctx)
                return require("colorful-menu").blink_components_text(ctx)
              end,
              highlight = function(ctx)
                return require("colorful-menu").blink_components_highlight(ctx)
              end,
            },
          },
        },
      },
    },
    keymap = {
      preset = "enter",
    },
    signature = {
      enabled = true,
    },
    cmdline = {
      enabled = false,
    },
  },
}
