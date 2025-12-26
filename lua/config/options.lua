vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.have_nerd_font = true

local opt = vim.o

opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.showmode = false
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)
opt.conceallevel = 2
opt.wrap = false
opt.linebreak = true
opt.cursorline = true
opt.expandtab = true
opt.breakindent = true
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200
opt.ignorecase = true
opt.smartcase = true
opt.ruler = false
opt.laststatus = 3
opt.pumblend = 10
opt.pumheight = 10
opt.shiftround = true
opt.shiftwidth = 2
opt.smartindent = true
opt.smoothscroll = true
opt.splitbelow = true
opt.splitkeep = "screen"
opt.splitright = true
opt.tabstop = 2
opt.termguicolors = true
opt.virtualedit = "block"
opt.winminwidth = 5

-- custom global variables
vim.g.autoformat = true
