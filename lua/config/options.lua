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
-- from https://github.com/patricorgi/dotfiles/blob/a35b8b05b9aeab93b03c64094f1da5d607c6d129/.config/nvim/lua/config/folding.lua#L10
local function fold_virt_text(result, start_text, lnum)
  local text = ""
  local hl
  for i = 1, #start_text do
    local char = start_text:sub(i, i)
    local new_hl = "@text"

    -- if semantic tokens unavailable, use treesitter hl
    local sem_tokens = vim.lsp.semantic_tokens.get_at_pos(0, lnum, i)
    if sem_tokens and #sem_tokens > 0 then
      new_hl = "@" .. sem_tokens[1].type
    else
      local captures = vim.treesitter.get_captures_at_pos(0, lnum, i - 1)
      if #captures > 0 then
        local top = captures[1]
        local top_priority = (top.metadata and tonumber(top.metadata.priority)) or 0
        for _, cap in ipairs(captures) do
          local raw_prio = cap.metadata and cap.metadata.priority
          local prio = tonumber(raw_prio) or 0
          if prio > top_priority then
            -- print(char .. ' ' .. top_priority .. ' -> ' .. prio)
            top = cap
            top_priority = prio
          end
        end
        new_hl = "@" .. top.capture
      end
    end

    if new_hl then
      if new_hl ~= hl then
        -- as soon as new hl appears, push substring with current hl to table
        table.insert(result, { text, hl })
        text = ""
        hl = nil
      end
      text = text .. char
      hl = new_hl
    else
      text = text .. char
    end
  end
  table.insert(result, { text, hl })
end
function _G.custom_foldtext()
  local start_text = vim.fn.getline(vim.v.foldstart):gsub("\t", string.rep(" ", vim.o.tabstop))
  local nline = vim.v.foldend - vim.v.foldstart
  local result = {}
  fold_virt_text(result, start_text, vim.v.foldstart - 1)
  table.insert(result, { "  ", nil })
  table.insert(result, { "󰛁  " .. nline .. " lines folded", "@comment" })
  return result
end

vim.opt.foldtext = "v:lua.custom_foldtext()"
o.foldlevelstart = 99
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- custom global variables
vim.g.autoformat = true
