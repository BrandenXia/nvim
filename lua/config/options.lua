vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.have_nerd_font = true

local o = vim.o
local opt = vim.opt

o.number = true
o.relativenumber = true
o.mouse = "a"
o.showmode = false
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)
o.confirm = true
o.conceallevel = 2
o.wrap = false
o.linebreak = true
o.cursorline = true
o.expandtab = true
o.breakindent = true
o.undofile = true
o.undolevels = 10000
o.updatetime = 200
o.ignorecase = true
o.smartcase = true
o.ruler = false
o.laststatus = 3
o.pumblend = 10
o.pumheight = 10
o.shiftround = true
o.shiftwidth = 2
o.smartindent = true
o.smoothscroll = true
o.splitbelow = true
o.splitkeep = "screen"
o.splitright = true
o.tabstop = 2
o.termguicolors = true
o.virtualedit = "block"
o.winminwidth = 5
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

-- treesitter folds
vim.opt.foldtext = "v:lua.require'utils.fold'.custom_foldtext()"
o.foldlevelstart = 99
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- custom global variables
vim.g.autoformat = true
