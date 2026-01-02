return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "bibtex", "latex" },
      disable = { "latex" },
    },
  },
  {
    "lervag/vimtex",
    -- lazy = false, -- lazy-loading will disable inverse search
    ft = "tex",
    config = function()
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_view_automatic = 1
      vim.g.vimtex_view_zathura_use_synctex = 0
      vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
      vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
    end,
    keys = {
      { "<localLeader>l", "", desc = "+vimtex", ft = "tex" },
    },
  },
}
