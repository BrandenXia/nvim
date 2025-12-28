local M = {}

function M.get_root_dir()
  local cwd = vim.fn.getcwd()
  local root = vim.lsp.buf.list_workspace_folders()[1] or vim.fs.root(0, { ".git" })
  local name = vim.fs.basename(root)

  if root == cwd then
    return false
  else
    return name
  end
end

return M
