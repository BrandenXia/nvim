local function get_root_dir()
	local cwd = vim.fn.getcwd()
	local root = vim.lsp.buf.list_workspace_folders()[1] or vim.fs.root(0, { ".git" })
	local name = vim.fs.basename(root)

	if root == cwd then
		return false
	else
		return name
	end
end

local function root_dir_component()
	return {
		function()
			return "󱉭  " .. get_root_dir()
		end,
		cond = function()
			return type(get_root_dir()) == "string"
		end,
		color = function()
			return { fg = Snacks.util.color("Special") }
		end,
	}
end

return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	init = function()
		vim.g.lualine_laststatus = 3
		if vim.fn.argc(-1) > 0 then
			-- set an empty statusline till lualine loads
			vim.o.statusline = " "
		else
			-- hide the statusline on the starter page
			vim.o.laststatus = 0
		end
	end,
	opts = function()
		vim.o.laststatus = 3
		local icons = require("config.icons")

		return {
			options = {
				theme = "catppuccin",
				globalstatus = vim.o.laststatus == 3,
				disabled_filetypes = { statusline = { "snacks_dashboard" } },
				component_separators = "",
				section_separators = "",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { { "branch", padding = 2 } },
				lualine_c = {
					root_dir_component(),
					{
						"diagnostics",
						symbols = {
							error = icons.diagnostics.Error,
							warn = icons.diagnostics.Warn,
							info = icons.diagnostics.Info,
							hint = icons.diagnostics.Hint,
						},
					},
					{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
					"filename",
					-- { LazyVim.lualine.pretty_path() },
				},
				lualine_x = {
					"filetype",
					"encoding",
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = function() return { fg = Snacks.util.color("Statement") } end,
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = function() return { fg = Snacks.util.color("Constant") } end,
          },
					{
						require("lazy.status").updates,
						cond = require("lazy.status").has_updates,
            -- stylua: ignore
						color = function() return { fg = Snacks.util.color("Special") } end,
					},
				},
				lualine_y = {
					{ "progress", separator = " ", padding = { left = 1, right = 0 } },
					{ "location", padding = { left = 0, right = 1 } },
				},
				lualine_z = {
					function()
						return " " .. os.date("%R")
					end,
				},
			},
			extensions = { "lazy" },
		}
	end,
}
