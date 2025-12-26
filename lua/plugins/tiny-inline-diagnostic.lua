return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = { "LspAttach" },
  priority = 1000, -- needs to be loaded in first
  config = function()
    require("tiny-inline-diagnostic").setup({
      options = {
        show_all_diags_on_cursorline = true,
        use_icons_from_diagnostic = true,
        show_source = { if_many = true },
        multiline = {
          enabled = true,
          always_show = true,
        },
      },
    })
  end,
}
