return {
  { "nvim-lua/plenary.nvim", lazy = true },
  -- enable color
  { "m00qek/baleia.nvim", tag = "v1.3.0", lazy = true },
  {
    "ej-shafran/compile-mode.nvim",
    version = "^5.0.0",
    cmd = { "Compile", "Recompile" },
    keys = {
      { "<C-a>", "<cmd>Recompile<CR>", desc = "Recompile" },
      { "<C-S-a>", "<cmd>Compile<CR>", desc = "Recompile" },
    },
    config = function()
      ---@module "compile-mode"
      ---@type CompileModeOpts
      vim.g.compile_mode = {
        default_command = "",
        baleia_setup = true,
        bang_expansion = true,
        recompile_no_fail = true,
        focus_compilation_buffer = true,
      }
    end,
  },
}
