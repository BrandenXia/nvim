return {
  { "nvim-lua/plenary.nvim", lazy = true },
  -- enable color
  { "m00qek/baleia.nvim", tag = "v1.3.0", lazy = true },
  {
    "BrandenXia/compile-mode.nvim",
    version = false,
    branch = "flexible-default-command",
    -- version = "^5.0.0",
    cmd = { "Compile" },
    keys = {
      {
        "<C-e>",
        "<cmd>Recompile<CR>",
        desc = "Compile",
      },
    },
    config = function()
      ---@module "compile-mode"
      ---@type CompileModeOpts
      vim.g.compile_mode = {
        default_command = {
          python = "python %",
          lua = "lua %",
          javascript = "bun %",
          typescript = "bun %",
          c = "cc -x c -o %:r % && %:p:r",
          cpp = "cc -x c++ -std=c++23 -o %:r % && %:p:r",
        },
        baleia_setup = true,
        bang_expansion = true,
        recompile_no_fail = true,
        focus_compilation_buffer = false,
        hidden_buffer = true,
      }
    end,
  },
}
