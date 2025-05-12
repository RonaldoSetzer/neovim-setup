-- ╭─────────────────────────────────────────────────────╮
-- │ Lazy.nvim Bootstrap                                 │
-- ╰─────────────────────────────────────────────────────╯

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if lazy.nvim is already installed
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"

	-- Clone the repository using --filter for a lighter clone
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})

	-- Handle clone errors and show a friendly message
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "❌ Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})

		vim.fn.getchar()
		os.exit(1)
	end
end

-- Prepend lazy.nvim to the runtimepath
vim.opt.rtp:prepend(lazypath)

-- ╭─────────────────────────────────────────────────────╮
-- │ Lazy.nvim Setup                                     │
-- ╰─────────────────────────────────────────────────────╯

require("lazy").setup({
	spec = {
		{ import = "plugins.core" },
		{ import = "plugins.ui" },
		{ import = "plugins.formatting" },
		{ import = "plugins.extras" },
		-- { import = "plugins.git" },
		-- { import = "plugins.lsp" },
		-- { import = "plugins.completion" },
		-- { import = "plugins.search" },
		-- { import = "plugins.syntax" },
	},
	defaults = {
		lazy = true, -- Lazy-load plugins by default (recommended for performance)
	},
	ui = {
		border = "rounded", -- Rounded borders for lazy UI (optional but prettier)
	},
	change_detection = {
		notify = false, -- Disable annoying config change notifications
	},
	install = { -- Auto-install missing plugins
		colorscheme = { "gruvbox-material" },
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
