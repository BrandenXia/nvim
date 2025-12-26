local function map(func, func_param_table)
  for _, v in ipairs(func_param_table) do
    func(unpack(v))
  end
end

local diagnostic_goto = function(next, severity)
  return function()
    vim.diagnostic.jump({
      count = (next and 1 or -1) * vim.v.count1,
      severity = severity and vim.diagnostic.severity[severity] or nil,
      float = true,
    })
  end
end

Snacks.toggle({
  name = "Auto Format",
  -- stylua: ignore
  get = function () return vim.g.autoformat end,
  -- stylua: ignore
  set = function (value) vim.g.autoformat = value end,
}):map("<leader>uf")
Snacks.toggle({
  name = "Wrap Lines",
  -- stylua: ignore
  get = function () return vim.wo.wrap end,
  -- stylua: ignore
  set = function (value) vim.wo.wrap = value end,
}):map("<leader>uw")

local deleted_keymaps = {}

local added_keymaps = {
  -- lazy.nvim
  { "n", "<leader>l", "<cmd>Lazy<cr>", { desc = "lazy.nvim" } },

  -- better up/down navigation
  { { "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true } },
  { { "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true } },
  { { "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true } },
  { { "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true } },

  -- easy delete during edit
  { "i", "<Esc><BS>", "<C-w>", { desc = "Delete previous word" } },

  -- move to window
  { "n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true } },
  { "n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true } },
  { "n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true } },
  { "n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true } },

  -- window management
  { "n", "<leader>wd", "<C-w>c", { desc = "Delete Window", remap = true } },
  { "n", "<leader>|", "<C-w>v", { desc = "Split Window (Vertical)" } },

  -- quick move
  { { "n", "v" }, "<A-j>", "5j", { desc = "Down" } },
  { { "n", "v" }, "<A-k>", "5k", { desc = "Up" } },
  { "i", "<A-j>", "<esc>5ji", { desc = "Down" } },
  { "i", "<A-k>", "<esc>5ki", { desc = "Up" } },

  -- move lines
  { "n", "<S-A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" } },
  { "n", "<S-A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" } },
  { "i", "<S-A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" } },
  { "i", "<S-A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" } },
  { "v", "<S-A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" } },
  { "v", "<S-A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" } },

  -- fix spelling mistakes
  { "i", "<C-f>", "<c-g>u<Esc>[s1z=`]a<c-g>u", { desc = "Fix previous spelling mistake" } },

  -- buffers
  { "n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" } },
  { "n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" } },
  { "n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" } },

  -- diagnostics
  { "n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" } },
  { "n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" } },
  { "n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" } },
  { "n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" } },
  { "n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" } },
  { "n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" } },
  { "n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" } },

  -- tabs
  { "n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" } },
  { "n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" } },
  { "n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" } },
  { "n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" } },
  { "n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" } },
  { "n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" } },
  { "n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" } },

  -- toggle options
  -- { "n", "<leader>uf", toggle_option("auto_format"), { desc = "Toggle Auto Format" } },

  -- clear hlsearch on escape
  {
    { "i", "n", "s" },
    "<esc>",
    function()
      vim.cmd("noh")
      return "<esc>"
    end,
    { expr = true, desc = "Escape and Clear hlsearch" },
  },
}

map(vim.keymap.del, deleted_keymaps)
map(vim.keymap.set, added_keymaps)
