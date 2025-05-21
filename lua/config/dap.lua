local M = {}

M.ui = function()
	local dapui = require("dapui")

	vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
	vim.fn.sign_define(
		"DapBreakpointRejected",
		{ text = "", texthl = "DiagnosticSignInfo", linehl = "", numhl = "" }
	)

	dapui.setup({
		floating = {
			border = "rounded",
			mappings = {
				close = { "q", "<Esc>" },
			},
		},
		layouts = {
			{
				elements = {
					{ id = "scopes", size = 0.25 },
					{ id = "breakpoints", size = 0.25 },
					{ id = "stacks", size = 0.25 },
					{ id = "watches", size = 0.25 },
				},
				position = "right",
				size = 50,
			},
			{
				elements = {
					{ id = "repl", size = 0.5 },
					{ id = "console", size = 0.5 },
				},
				position = "bottom",
				size = 10,
			},
		},
	})
end

M.adapters = function(dap)
	-- Adaptadores pwa-node, chrome, msedge
	for _, adapterType in ipairs({ "node", "chrome", "msedge" }) do
		local pwaType = "pwa-" .. adapterType

		dap.adapters[pwaType] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = "node",
				args = {
					vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
					"${port}",
				},
			},
		}

		dap.adapters[adapterType] = function(cb, config)
			local nativeAdapter = dap.adapters[pwaType]
			config.type = pwaType

			if type(nativeAdapter) == "function" then
				nativeAdapter(cb, config)
			else
				cb(nativeAdapter)
			end
		end
	end

	-- Adaptador Delve para Go
	dap.adapters.go = {
		type = "server",
		host = "127.0.0.1",
		port = 38697,
		executable = {
			command = "dlv",
			args = { "dap", "--listen=127.0.0.1:38697", "--log" },
		},
	}
end

M.languages = function(dap)
	for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" }) do
		dap.configurations[language] = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file using Node.js",
				program = "${file}",
				cwd = "${workspaceFolder}",
			},
			{
				type = "pwa-node",
				request = "attach",
				name = "Attach to process using Node.js",
				processId = require("dap.utils").pick_process,
				cwd = "${workspaceFolder}",
			},
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file using Node.js with ts-node/register",
				program = "${file}",
				cwd = "${workspaceFolder}",
				runtimeArgs = { "-r", "ts-node/register" },
			},
			{
				type = "pwa-chrome",
				request = "launch",
				name = "Launch Chrome",
				url = function()
					vim.ui.input({ prompt = "Enter URL: ", default = "http://localhost:" }, function(url)
						return url or "http://localhost:"
					end)
				end,
				webRoot = "${workspaceFolder}",
				sourceMaps = true,
			},
			{
				type = "pwa-msedge",
				request = "launch",
				name = "Launch Edge",
				url = function()
					vim.ui.input({ prompt = "Enter URL: ", default = "http://localhost:" }, function(url)
						return url or "http://localhost:"
					end)
				end,
				webRoot = "${workspaceFolder}",
				sourceMaps = true,
			},
		}
		dap.configurations.go = {
			{
				type = "go",
				name = "Debug",
				request = "launch",
				program = "${file}",
			},
			{
				type = "go",
				name = "Debug (com argumentos)",
				request = "launch",
				program = "${file}",
				args = function()
					return vim.split(vim.fn.input("Args: "), " ", { trimempty = true })
				end,
			},
			{
				type = "go",
				name = "Attach",
				request = "attach",
				processId = require("dap.utils").pick_process,
			},
		}
	end

	dap.configurations.cs = {
		{
			type = "coreclr",
			name = "Launch - coreclr",
			request = "launch",
			program = function()
				local path = vim.fn.input("Path to dll to debug: ", vim.fn.getcwd() .. "/bin/Debug/", "file")
				return path
			end,
		},
	}
end

M.events = function(dap, dapui)
	dap.listeners.before.attach.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.launch.dapui_config = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated.dapui_config = function()
		dapui.close()
	end
	dap.listeners.before.event_exited.dapui_config = function()
		dapui.close()
	end
end

M.setup = function()
	local dap = require("dap")
	local dapui = require("dapui")

	M.adapters(dap)
	M.languages(dap)
	M.events(dap, dapui)
end

return M
