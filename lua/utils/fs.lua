local M = {}

local root_markers = { ".git", ".editorconfig" }

function M.get_root_dir()
  return vim.lsp.buf.list_workspace_folders()[1] or vim.fs.root(0, root_markers) or vim.fn.getcwd()
end

function M.get_root_name()
  local cwd = vim.fn.getcwd()
  local root = M.get_root_dir()
  local name = vim.fs.basename(root)

  if root == cwd then
    return false
  else
    return name
  end
end

return M
