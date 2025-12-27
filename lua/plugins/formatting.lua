return {
  "stevearc/conform.nvim",
  lazy = true,
  cmd = "ConformInfo",
  opts_extend = { "formatters_by_ft.*.keys" },
  opts = {
    default_format_opts = {
      timeout_ms = 3000,
      async = false, -- not recommended to change
      quiet = false, -- not recommended to change
      lsp_format = "fallback", -- not recommended to change
    },
    formatter_by_ft = {},
    formatters = {
      injected = { options = { ignore_errors = true } },
    },
  },
}
