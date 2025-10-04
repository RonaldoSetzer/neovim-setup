return {
	{
		"stevearc/oil.nvim",
		cmd = { "Oil", "OilOpen" },
		keys = {
			{
				"<Leader>E",
				function()
					require("oil").toggle_float()
				end,
				desc = "• File Explorer: Open Oil",
			},
			{
				"<Esc><Esc>",
				function()
					local oil = require("oil")
					vim.bo.modified = false
					if oil.close then
						oil.close()
					else
						vim.api.nvim_win_close(0, true)
					end
				end,
				mode = "n",
				ft = "oil",
				desc = "• Oil: Close with ESC",
			},
		},
		opts = {
			keymaps = {
				["<CR>"] = "actions.select",
				["<C-x>"] = "actions.select_split",
				["<C-v>"] = "actions.select_vsplit",
			},
			columns = { "icon" },
			view_options = { show_hidden = true },
			float = {
				padding = 0,
				max_width = 1,
				max_height = 0.7,
				border = "single",
				override = function(conf)
					local ui = vim.api.nvim_list_uis()[1]
					conf.width = math.floor(ui.width * 1)
					conf.height = math.floor(ui.height * 0.6)
					conf.row = ui.height - conf.height - 2
					conf.col = math.floor((ui.width - conf.width) / 2)
					return conf
				end,
				win_options = {
					winblend = 15,
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual",
				},
				buf_options = {
					buflisted = false,
					modifiable = false,
				},
			},
		},
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "personal",
					path = "~/Workspace/omoikane/",
				},
			},
			daily_notes = {
				folder = "daily",
				date_format = "%Y-%m-%d",
			},
			note_id_func = function(title)
				return title and title:gsub(" ", " ") or tostring(os.time())
			end,
		},
	},
}
