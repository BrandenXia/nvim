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

if vim.g.neovide then
  vim.g.neovide_input_macos_option_key_is_meta = "only_left"

  vim.g.neovide_opacity = 0.8
  vim.g.neovide_normal_opacity = 0.8
  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_blur_amount_x = 20
  vim.g.neovide_floating_blur_amount_y = 20

  vim.o.guifont = "CaskaydiaCove Nerd Font Mono:h13"
  vim.opt.linespace = 8

  vim.g.neovide_padding_top = 5
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 5
  vim.g.neovide_padding_left = 5

  vim.g.neovide_theme = "dark"

  vim.g.neovide_show_border = false

  vim.g.neovide_scroll_animation_length = 0
  vim.g.neovide_cursor_animation_length = 0
end
