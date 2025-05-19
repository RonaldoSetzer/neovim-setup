-- ╭─────────────────────────────────────────────────────╮
-- │ Telescope Bootstrap                                 │
-- ╰─────────────────────────────────────────────────────╯

local actions = require("telescope.actions")

local M = {}

M.defaults = {
	mappings = {
		i = {
			["<C-k>"] = actions.move_selection_previous,
			["<C-j>"] = actions.move_selection_next,
			["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
		},
	},
	prompt_prefix = "❯ ",
	selection_caret = "❯ ",
	path_display = { "smart" },
	layout_config = { prompt_position = "top" },
	sorting_strategy = "ascending",
	winblend = 10,
	file_ignore_patterns = { "node_modules", ".git" },
}

M.pickers = {
	find_files = { theme = "ivy", hidden = true },
	live_grep = { theme = "ivy" },
	buffers = { theme = "ivy" },
	help_tags = { theme = "ivy" },
	keymaps = { theme = "ivy" },
	lsp_definitions = { theme = "ivy" },
	lsp_references = { theme = "ivy" },
}

M.extensions = {
	fzf = {
		fuzzy = true,
		override_generic_sorter = true,
		override_file_sorter = true,
		case_mode = "smart_case",
	},
}

-- ╭─────────────────────────────────────────────────────╮
-- │ Customs Plugins                                     │
-- ╰─────────────────────────────────────────────────────╯

M.console_logs = function()
	local results = vim.fn.systemlist("rg --no-heading --with-filename --line-number --column console\\.log")

	if vim.tbl_isempty(results) then
		vim.notify("No console.log found in project", vim.log.levels.INFO)
		return
	end

	require("telescope.pickers")
		.new({}, {
			prompt_title = "console.log Files",
			finder = require("telescope.finders").new_table({ results = results }),
			sorter = require("telescope.config").values.generic_sorter({}),
			previewer = require("telescope.config").values.grep_previewer({}),
		})
		:find()
end

return M

