-- Copilot
require("copilot").setup({
	suggestion = { enabled = false },
	panel = { enabled = false },
})
require("copilot_cmp").setup()

-- UI Options
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append("c")

-- LSPKind Icons
local lspkind = require("lspkind")
local cmp = require("cmp")

lspkind.init({
	symbol_map = {
		Copilot = "",
		Text = "󰉿",
		Method = "󰆧",
		Function = "󰊕",
		Constructor = "",
		Field = "󰜢",
		Variable = "󰀫",
		Class = "󰠱",
		Interface = "",
		Module = "󰏗",
		Property = "󰜢",
		Unit = "",
		Value = "󰎠",
		Enum = "",
		Keyword = "󰌋",
		Snippet = "",
		Color = "󰏘",
		File = "󰈙",
		Reference = "󰈇",
		Folder = "󰉋",
		EnumMember = "",
		Constant = "󰏿",
		Struct = "󰙅",
		Event = "",
		Operator = "󰆕",
		TypeParameter = "󰊄",
	},
})

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

-- Tailwind color squares
require("tailwindcss-colorizer-cmp").setup({
	color_square_width = 2,
})

local kind_formatter = lspkind.cmp_format({
	mode = "symbol_text",
	menu = {
		buffer = "[buf]",
		nvim_lsp = "[LSP]",
		nvim_lua = "[api]",
		path = "[path]",
		luasnip = "[snip]",
		gh_issues = "[issues]",
		tn = "[TabNine]",
		eruby = "[erb]",
	},
})

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("lua", {
	s("pr", { t("print('Hello World')") }),
})

local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

-- Verificar backspace
local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	mapping = {
		["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
		["<C-e>"] = cmp.mapping.close(),
		["<C-y>"] = cmp.mapping(
			cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
			{ "i", "c" }
		),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end,
	},

	sources = {
		{ name = "lazydev", group_index = 0 },
		{ name = "copilot" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "buffer" },
	},

	formatting = {
		fields = { "kind", "abbr", "menu" },
		expandable_indicator = true,
		format = function(entry, vim_item)
			vim_item = kind_formatter(entry, vim_item)
			vim_item = require("tailwindcss-colorizer-cmp").formatter(entry, vim_item)
			-- intercepta função e cria placeholders genericos
			if entry.completion_item.kind == vim.lsp.protocol.CompletionItemKind.Function then
				local label = entry.completion_item.label
				if not label:find("%(") then -- só se não vier com ()
					entry.completion_item.insertTextFormat = 2 -- snippet
					entry.completion_item.insertText = label .. "(${1})"
				end
			end
			return vim_item
		end,
	},

	sorting = {
		priority_weight = 2,
		comparators = {
			require("copilot_cmp.comparators").prioritize,
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			cmp.config.compare.recently_used,
			cmp.config.compare.locality,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},

	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
})

-- SQL filetype completion
cmp.setup.filetype({ "sql" }, {
	sources = {
		{ name = "vim-dadbod-completion" },
		{ name = "buffer" },
	},
})
