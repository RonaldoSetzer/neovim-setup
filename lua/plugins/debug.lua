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
			{
				"<Leader><Space>",
				"<Cmd>DapToggleBreakpoint<CR>",
				desc = "• Dap: Toggle a breakpoint at the current line",
			},
			{
				"<Leader>bb",
				"<Cmd>DapContinue<CR>",
				desc = "• Dap: Continue program execution from the current breakpoint",
			},
			{ "[b", "<Cmd>DapStepInto<CR>", desc = "• Dap: Step into the next function call" },
			{ "]b", "<Cmd>DapStepOver<CR>", desc = "• Dap: Step over the next function call" },
			{ "<Leader>dr", "<Cmd>DapReplOpen<CR>", desc = "• Dap: Open the interactive REPL for debugging" },
			{
				"<Leader>dd",
				"<Cmd>lua require('dapui').toggle()<CR>",
				desc = "• Dap: Toggle the DAP UI panels (scopes, watches, breakpoints)",
			},
			{ "<Esc><Esc>", "<Cmd>lua require('dapui').close()<CR>", desc = "• Dap: Close the DAP UI panels" },
		},
	},
}
