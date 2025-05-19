local M = {}

M.statusline = function()
	local statusline = require("mini.statusline")
	set_hl = function(hl, fg, bg, bold)
		vim.api.nvim_set_hl(0, hl, { fg = fg, bg = bg, bold = bold })
	end

	statusline.setup({
		use_icons = true,
		set_vim_settings = true,
		content = {
			active = function()
				local left = table.concat({
					statusline.section_mode(),
					statusline.section_git(),
					statusline.section_fileinfo(),
				}, " ")
				local right = table.concat({
					statusline.section_location(),
					statusline.section_git_status(),
					statusline.section_diagnostics(),
				})

				return left .. "%=" .. right
			end,
			inactive = function()
				return statusline.section_fileinfo()
			end,
		},
	})

	statusline.section_mode = function()
		local mode = vim.fn.mode()
		local mode_map = {
			n = { icon = "", color = "%#MiniStatuslineModeNormal#" },
			no = { icon = "", color = "%#MiniStatuslineModeNormal#" },
			i = { icon = "", color = "%#MiniStatuslineModeInsert#" },
			ic = { icon = "", color = "%#MiniStatuslineModeInsert#" },
			v = { icon = "", color = "%#MiniStatuslineModeVisual#" },
			V = { icon = "", color = "%#MiniStatuslineModeVisual#" },
			["\22"] = { icon = "", color = "%#MiniStatuslineModeNormal#" },
			c = { icon = "", color = "%#MiniStatuslineModeCommand#" },
			cv = { icon = "C", color = "%#MiniStatuslineModeCommand#" },
			s = { icon = "S", color = "%#MiniStatuslineModeOther#" },
			S = { icon = "S", color = "%#MiniStatuslineModeOther#" },
			t = { icon = "", color = "%#MiniStatuslineModeCommand#" },
			R = { icon = "R", color = "%#MiniStatuslineModeOther#" },
		}
		local mode_char = mode_map[mode].icon or mode:sub(1, 1)
		local hl = mode_map[mode].color or "%#MiniStatuslineModeOther#"

		return string.format("%s %s %s", hl, mode_char, "%*")
	end

	statusline.section_git = function()
		local branch = vim.b.gitsigns_head
		if branch then
			return "%#MiniStatuslineGit# " .. branch .. "%*"
		else
			return ""
		end
	end

	statusline.section_fileinfo = function()
		local project_dir = vim.fn.getcwd()
		local filepath = vim.fn.expand("%:p")
		local relative_path = vim.fn.fnamemodify(filepath, ":." .. project_dir)
		local filename = vim.fn.expand("%:t")

		local filetype = vim.bo.filetype
		local modified = vim.bo.modified and "  " or ""

		local icon, icon_color =
			require("nvim-web-devicons").get_icon_color(filename, vim.fn.expand("%:e"), { default = true })

		vim.api.nvim_set_hl(0, "CustomFileIcon", { fg = icon_color })

		return "%#CustomFileIcon# [" .. filetype .. "] " .. (icon or "") .. " %* ./" .. relative_path .. modified
	end

	statusline.section_location = function()
		set_hl("MiniStatuslineLocation", "#8ec07c", "#3c3836", false)
		return "%#MiniStatuslineLocation# %3l:%-2v %*"
	end

	statusline.section_git_status = function()
		local gitsigns = vim.b.gitsigns_status_dict or {}
		local added = gitsigns.added or 0
		local changed = gitsigns.changed or 0
		local removed = gitsigns.removed or 0
		set_hl("MiniStatuslineGit", "#fabd2f", "#3c3836", false)
		set_hl("MiniStatuslineGitAdded", "#b8bb26", "#3c3836", true)
		set_hl("MiniStatuslineGitChanged", "#fabd2f", "#3c3836", true)
		set_hl("MiniStatuslineGitRemoved", "#fb4934", "#3c3836", true)

		return table.concat({
			"%#MiniStatuslineGit#  %*" .. "%#MiniStatuslineGitAdded# " .. added .. "%*",
			"%#MiniStatuslineGitChanged#  " .. changed .. "%*",
			"%#MiniStatuslineGitRemoved#  " .. removed .. " %*",
		})
	end

	statusline.section_diagnostics = function()
		local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
		local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
		local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
		local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })

		local result = {}
		if errors > 0 then
			table.insert(result, "%#MiniStatuslineDiagnosticError#  " .. errors .. " %*")
		end
		if warnings > 0 then
			table.insert(result, "%#MiniStatuslineDiagnosticWarn#  " .. warnings .. " %*")
		end
		if info > 0 then
			table.insert(result, "%#MiniStatuslineDiagnosticInfo#  " .. info .. " %*")
		end
		if hints > 0 then
			table.insert(result, "%#MiniStatuslineDiagnosticHint#  " .. hints .. " %*")
		end

		set_hl("MiniStatuslineDiagnostics", "#83a598", "#3c3836", false)
		set_hl("MiniStatuslineDiagnosticError", "#3c3836", "#fb4934", true)
		set_hl("MiniStatuslineDiagnosticWarn", "#3c3836", "#fabd2f", true)
		set_hl("MiniStatuslineDiagnosticInfo", "#3c3836", "#83a598", true)
		set_hl("MiniStatuslineDiagnosticHint", "#3c3836", "#b8bb26", true)

		return "%#MiniStatuslineDiagnostics# " .. table.concat(result) .. " %*"
	end
end

M.indent = function()
	local highlight = {
		"RainbowYellow",
		"RainbowGreen",
		"RainbowBlue",
		"RainbowAqua",
		"RainbowOrange",
		"RainbowRed",
	}

	local hooks = require("ibl.hooks")
	hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
		vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#fabd2f" })
		vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#b8bb26" })
		vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#83a598" })
		vim.api.nvim_set_hl(0, "RainbowAqua", { fg = "#8ec07c" })
		vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#fe8019" })
		vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#fb4934" })
	end)

	require("ibl").setup({
		indent = { char = "▏" },
		exclude = {
			filetypes = {
				"help",
				"startify",
				"dashboard",
				"packer",
				"neogitstatus",
				"NvimTree",
				"Trouble",
			},
		},
		scope = {
			highlight = highlight,
			enabled = true,
		},
	})
	hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
end

return M
