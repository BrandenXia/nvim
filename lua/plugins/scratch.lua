return {
  "folke/snacks.nvim",
  opts = {
    scratch = {
      root = vim.fn.stdpath("run") .. "/scratch",
      win = {
        keys = {
          run = {
            "<cr>",
            function(self)
              vim.api.nvim_buf_call(self.buf, function()
                vim.cmd("silent! write")
                vim.bo[self.buf].buflisted = false
              end)
              vim.cmd("silent! Compile")
            end,
            desc = "Run buffer",
            mode = { "n", "x" },
          },
        },
      },
    },
  },
}
