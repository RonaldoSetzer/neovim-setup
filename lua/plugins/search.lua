return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = "Telescope",
    version = "0.1.4",
		keys = {
			{ "<Leader>ff", "<Cmd>Telescope find_files<CR>", desc = "Find Files" },
			{ "<Leader>fg", "<Cmd>Telescope live_grep<CR>", desc = "Grep (Live)" },
			{ "<Leader>fb", "<Cmd>Telescope buffers<CR>", desc = "Buffers" },
			{ "<Leader>fh", "<Cmd>Telescope help_tags<CR>", desc = "Help Tags" },
			{ "<Leader>fo", "<Cmd>Telescope oldfiles<CR>", desc = "Recent Files" },
			{ "<Leader>fk", "<Cmd>Telescope keymaps<CR>", desc = "Keymaps" },
			{ "<Leader>fd", "<Cmd>Telescope lsp_definitions<CR>", desc = "LSP Definitions" },
			{ "<Leader>fr", "<Cmd>Telescope lsp_references<CR>", desc = "LSP References" },
			{ "<Leader>fs", "<Cmd>Telescope lsp_document_symbols<CR>", desc = "LSP Document Symbols" },
			{ "<Leader>fS", "<Cmd>Telescope lsp_workspace_symbols<CR>", desc = "LSP Workspace Symbols" },
			{ "<Leader>fc", "<Cmd>Telescope commands<CR>", desc = "Telescope Commands" },
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
