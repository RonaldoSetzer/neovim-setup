local M = {}

M.statusline = function()
	local statusline = require("mini.statusline")

	statusline.setup({
		use_icons = true,
		set_vim_settings = true,
	})

	statusline.section_location = function()
		return "%3l:%-2v"
	end

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

		return string.format("%s %s ", hl, mode_char)
	end

	statusline.section_fileinfo = function()
		local filename = vim.fn.expand("%:t")
		local filetype = vim.bo.filetype
		local modified = vim.bo.modified and " [+]" or ""
		return string.format("%s [%s]%s", filename, filetype, modified)
	end

	statusline.section_git = function()
		local branch = vim.b.gitsigns_head
		if branch then
			return " " .. branch
		else
			return ""
		end
	end

	statusline.section_diagnostics = function()
		local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
		local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
		local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
		local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })

		local result = {}
		if errors > 0 then
			table.insert(result, " " .. errors)
		end
		if warnings > 0 then
			table.insert(result, " " .. warnings)
		end
		if info > 0 then
			table.insert(result, " " .. info)
		end
		if hints > 0 then
			table.insert(result, " " .. hints)
		end

		return table.concat(result, " ")
	end
end

return M
