return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Telescope",
		version = "0.1.8",
		keys = {
			{ "<Leader>ff", "<Cmd>Telescope find_files<CR>", desc = "Find Files" },
			{ "<Leader>fg", "<Cmd>Telescope live_grep<CR>", desc = "Grep (Live)" },
			{ "<Leader>fb", "<Cmd>Telescope buffers<CR>", desc = "Buffers" },
			{ "<Leader>fk", "<Cmd>Telescope keymaps<CR>", desc = "keymaps" },
			{ "<Leader>fg", "<Cmd>Telescope git_commits<CR>", desc = "git_commits" },
			{ "<Leader>fgs", "<Cmd>Telescope git_status<CR>", desc = "git_status" },
			{
				"<Leader>fc",
				function()
					require("config.telescope").console_logs()
				end,
				desc = "Find console.log",
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
