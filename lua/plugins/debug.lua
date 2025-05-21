return {
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			require("config.dap").ui()
		end,
	},
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			require("config.dap").setup()
		end,
		keys = {
			{ "<Leader><Space>", "<Cmd>DapToggleBreakpoint<CR>", desc = "Toggle breakpoint" },
			{ "<Leader>bb", "<Cmd>DapContinue<CR>", desc = "Continue debugging" },
			{ "[b", "<Cmd>DapStepInto<CR>", desc = "Step into" },
			{ "]b", "<Cmd>DapStepOver<CR>", desc = "Step over" },
			{ "<Leader>dr", "<Cmd>DapReplOpen<CR>", desc = "Open REPL" },
			{ "<Leader>dd", "<Cmd>lua require('dapui').toggle()<CR>", desc = "Toggle UI" },
			{ "<Esc><Esc>", "<Cmd>lua require('dapui').close()<CR>", desc = "Close UI" },
		},
	},
}
