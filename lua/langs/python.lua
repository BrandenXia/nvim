return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "python" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ruff = {
          cmd_env = { RUFF_TRACE = "messages" },
          init_options = {
            settings = {
              logLevel = "error",
            },
          },
        },
        pyright = {},
      },
      setup = {
        ruff = function()
          Snacks.util.lsp.on({ name = "ruff" }, function(_, client)
            -- Disable hover in favor of Pyright
            client.server_capabilities.hoverProvider = false
          end)
        end,
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatter_by_ft = {
        python = { "ruff" },
      },
    },
  },
}
