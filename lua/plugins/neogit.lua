return {
  {
    "NeogitOrg/neogit",
    lazy = true,
    cmd = "Neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
    },
    opts = {
      graph_style = "kitty",
    },
  },
  { "nvim-lua/plenary.nvim", lazy = true },
  { "sindrets/diffview.nvim", lazy = true },
  { "folke/snacks.nvim" },
}
