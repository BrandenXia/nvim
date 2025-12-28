return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "macchiato",
    transparent_background = true,
    auto_integrations = false,
    integrations = {
      diffview = true,
      flash = true,
      grug_far = true,
      gitsigns = true,
      lsp_trouble = true,
      neogit = true,
      noice = true,
      notify = true,
      render_markdown = true,
      snacks = { enabled = true },
      mini = { enabled = true },
      blink_cmp = { style = "bordered" },
      mason = true,
      which_key = true,
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}
