return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Telescope",
		version = "0.1.8",
		keys = {
			{
				"<Leader>ff",
				"<Cmd>Telescope find_files<CR>",
				desc = "• Telescope: Search for files in the workspace",
			},
			{
				"<Leader>fg",
				"<Cmd>Telescope live_grep<CR>",
				desc = "• Telescope: Search for text in files using live grep",
			},
			{ "<Leader>fb", "<Cmd>Telescope buffers<CR>", desc = "• Telescope: List open buffers" },
			{ "<Leader>fk", "<Cmd>Telescope keymaps<CR>", desc = "• Telescope: List available keymaps" },
			{
				"<Leader>fgc",
				"<Cmd>Telescope git_commits<CR>",
				desc = "• Telescope: List Git commits in the repository",
			},
			{
				"<Leader>fgs",
				"<Cmd>Telescope git_status<CR>",
				desc = "• Telescope: Show Git status for modified files",
			},
			{
				"<Leader>fc",
				function()
					require("config.telescope").console_logs()
				end,
				desc = "• Telescope: Search for console.log statements across the project",
			},
		},
		opts = function()
			return require("config.telescope")
		end,
		config = function(_, opts)
			require("telescope").setup(opts)
			pcall(require("telescope").load_extension, "fzf")
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		cond = function()
			return vim.fn.executable("make") == 1
		end,
	},
}
