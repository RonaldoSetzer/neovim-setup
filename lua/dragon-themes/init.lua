local M = {}

function create_theme(ansi)
  local pallet = {
    background = ansi.black,
    foreground = ansi.white,
    primary = ansi.blue,
    secondary = ansi.yellow,
    tertiary = ansi.green,
    number = ansi.purple,
    text = ansi.aqua,
    comment = ansi.grey,
    punctuation = ansi.grey,
    visual = ansi.dark_blue,
    ui1 = ansi.black2,
    ui2 = ansi.black3,
    warning = ansi.dark_grey,
    info = ansi.dark_aqua,
    danger = ansi.red
  }
  local theme = {
    base = {
      Normal = { fg = pallet.foreground, bg = pallet.background },
      Comment = { fg = pallet.comment, style = "i" },
      Constant = { fg = pallet.foreground, style = "b" },
      String = { fg = pallet.text, style = "b" },
      Number = { fg = pallet.number },
      Boolean = { fg = pallet.primary, style = "b" },
      Float = { fg = pallet.number },
      Identifier = { fg = pallet.primary, style = "i" },
      Function = { fg = pallet.secondary }, -- REVIEW
      Statement = { fg = pallet.primary, style = "i" },
      Conditional = { fg = pallet.primary, style = "i" },
      Repeat = { fg = pallet.primary, style = "i" },
      Label = { fg = pallet.primary }, -- REVIEW
      Operator = { fg = pallet.primary },
      Keyword = { fg = pallet.primary, style = "i" },
      Exception = { fg = pallet.primary },            -- REVIEW
      Include = { fg = pallet.primary, style = "i" }, -- REVIEW
      --[[ Title = { fg = c.primary }, ]]
      Type = { fg = pallet.tertiary },
      SpecialComment = { fg = pallet.comment, style = "b" },                 -- REVIEW
      Todo = { fg = pallet.tertiary, bg = pallet.background, style = "ri" }, -- REVIEW
      Underlined = { fg = pallet.foreground, style = "u" },                  -- REVIEW
      ColorColumn = { fg = pallet.background, bg = pallet.ui1 },
      CursorLineNr = { fg = pallet.secondary },
      SignColumn = { fg = pallet.background, bg = pallet.ui1 },
      Conceal = { fg = pallet.primary }, -- REVIEW
      CursorColumn = { bg = pallet.ui1 },
      CursorLine = { bg = pallet.ui1 },
      Directory = { fg = pallet.primary },                                        -- REVIEW
      DiffAdd = { fg = pallet.info, bg = pallet.background, style = "ri" },       -- REVIEW
      DiffAdded = { fg = pallet.info },                                           -- REVIEW
      DiffChange = { fg = pallet.warning, bg = pallet.background, style = "ri" }, -- REVIEW
      DiffChanged = { fg = pallet.warning },                                      -- REVIEW
      DiffDelete = { fg = pallet.danger, bg = pallet.background, style = "ri" },  -- REVIEW
      DiffRemoved = { fg = pallet.danger },                                       -- REVIEW
      DiffText = { fg = pallet.background, bg = pallet.warning, style = "ri" },   -- REVIEW
      ErrorMsg = { bg = pallet.danger },                                          -- REVIEW
      VertSplit = { fg = pallet.background, bg = pallet.ui1 },
      Folded = { fg = pallet.comment, bg = pallet.ui1, style = "i" },
      FoldColumn = { fg = pallet.ui2, bg = pallet.ui2 },
      IncSearch = { fg = pallet.background, bg = pallet.primary },
      LineNr = { fg = pallet.comment },
      --[[ MatchParen = { fg = c.blue, style = "b" }, ]]
      --[[ ModeMsg = { fg = c.blue, style = "b" }, ]]
      --[[ MoreMsg = { fg = c.info, style = "b" }, ]]
      NonText = { fg = pallet.ui2 },
      PreProc = { fg = pallet.primary, style = "i" },
      Pmenu = { fg = pallet.foreground, bg = pallet.background },
      PmenuSel = { fg = pallet.ui1, bg = pallet.primary, style = "b" },
      PmenuSbar = { bg = pallet.ui2 },
      PmenuThumb = { bg = pallet.primary },
      --[[ Question = { fg = c.danger, style = "b" }, ]]
      Search = { fg = pallet.background, bg = pallet.secondary },
      --[[ SpecialKey = { fg = c.blue }, ]]
      StatusLine = { bg = pallet.ui1, style = "b" },
      StatusLineNC = { fg = pallet.comment, bg = pallet.ui2, style = "b" },
      TabLine = { bg = pallet.ui1 },
      TabLineSel = { fg = pallet.primary }, -- REVIEW
      TabLineFill = { bg = pallet.ui1 },
      Visual = { bg = pallet.visual },
      VisualNOS = { bg = pallet.visual },
      --[[ WarningMsg = { fg = c.warning, style = "b" }, ]]
      WildMenu = { fg = pallet.primary, bg = pallet.ui2, style = "b" }
    },
    treesitter = {
      ["@Include"] = { fg = pallet.primary, style = "i" },
      ["@keyword"] = { fg = pallet.primary, style = "i" },
      ["@keyword.operator"] = { fg = pallet.primary, style = "b" },
      ["@keyword.return"] = { fg = pallet.primary, style = "i" },
      ["@keyword.function"] = { fg = pallet.primary, style = "i" },
      ["@type"] = { fg = pallet.tertiary },
      ["@type.builtin"] = { fg = pallet.tertiary },
      ["@type.qualifier"] = { fg = pallet.primary, style = "i" },
      ["@method"] = { fg = pallet.secondary },
      ["@variable"] = { fg = pallet.foreground },
      ["@variable.builtin"] = { fg = pallet.primary },
      ["@property"] = { fg = pallet.foreground, style = "i" },
      ["@parameter"] = { fg = pallet.foreground },
      ["@repeat"] = { fg = pallet.primary, style = "i" },
      ["@number"] = { fg = pallet.number },
      ["@string"] = { fg = pallet.text, style = "b" },
      ["@constant"] = { fg = pallet.foreground, style = "b" },
      ["@constant.builtin"] = { fg = pallet.primary },
      ["@operator"] = { fg = pallet.primary },
      ["@comment"] = { fg = pallet.comment, style = "i" },
      ["@function"] = { fg = pallet.secondary },
      ["@function.call"] = { fg = pallet.secondary, style = "b" },
      ["@conditional"] = { fg = pallet.primary, style = "i" },
      ["@punctuation.delimiter"] = { fg = pallet.punctuation },
      ["@punctuation.special"] = { fg = pallet.secondary },
      ["@boolean"] = { fg = pallet.primary, style = "b" },
      --[[ ["@punctuation.bracket"] = { fg = c.punctuation }, ]]
      --[[ ["@define"] = { fg = c.red }, ]]
      --[[ ["@error"] = { fg = c.red }, ]]
      --[[ ["@definition.constant"] = { fg = c.pink, style = "bold" }, ]]
      --[[ ["@character"] = { fg = c.soft_green }, ]]
      --[[ ["@namespace"] = { fg = c.light_blue }, ]]
      --[[ ["@func.builtin"] = { fg = c.soft_yellow }, ]]
      --[[ ["@function.builtin"] = { fg = c.soft_yellow, style = config.function_style }, ]]
      --[[ ["@func.macro"] = { fg = c.soft_yellow }, ]]
      --[[ ["@parameter.reference"] = { fg = c.dark_gray }, ]]
      --[[ ["@field"] = { fg = c.light_blue }, ]]
      ["@constructor"] = { fg = pallet.secondary },
      --[[ ["@label"] = { fg = c.blue_gray }, ]]
      --[[ ["@exception"] = { fg = c.red }, ]]
      --[[ ["@storageclass.lifetime"] = { fg = c.orange }, ]]
      --[[ ["@structure"] = { fg = c.blue_gray }, ]]
      --[[ ["@text"] = { fg = c.soft_yellow }, ]]
      --[[ ["@text.strong"] = { fg = c.soft_yellow }, ]]
      --[[ ["@text.emphasis"] = { fg = c.soft_yellow }, ]]
      --[[ ["@text.underline"] = { fg = c.soft_yellow }, ]]
      ["@text.title"] = { fg = pallet.secondary },
      --[[ ["@text.literal"] = { fg = c.soft_yellow }, ]]
      ["@text.uri"] = { fg = pallet.text, style = "biu" },
      ["@uri"] = { fg = pallet.text, style = "b" },
      ["@tag"] = { fg = pallet.primary },
      ["@tag.delimiter"] = { fg = pallet.punctuation },
      ["@tag.attribute"] = { fg = pallet.tertiary, style = "i" },
      --
      -- per language TreeSitter
      --[[ ["@variable.python"] = { fg = c.foreground, style = "NONE" }, ]]
      --[[ ["@attribute.python"] = { fg = c.orange, style = "bold" }, ]]
      --[[ ["@decorator"] = { fg = c.orange, style = "bold" }, ]]
      --[[ ["@variable.rust"] = { fg = c.foreground, style = "NONE" }, ]]
      --[[ ["@conditional.javascript"] = { fg = c.red }, ]]
      --[[ ["@variable.javascript"] = { fg = c.light_blue }, ]]
    },
    json = {
      jsonQuote = { fg = pallet.comment, style = "i" },
      jsonnoQuotesError = { fg = pallet.comment, style = "i" },
      jsonFold = { fg = pallet.comment, style = "i" },
      jsonCommentError = { fg = pallet.comment, style = "ib" },
    },
    GitSigns = {
      GitSignsChange = { fg = pallet.warning, bg = pallet.ui1 },
      GitSignsAdd = { fg = pallet.info, bg = pallet.ui1 },
      GitSignsDelete = { fg = pallet.danger, bg = pallet.ui1 }
    },
    telescope = {
      TelescopePromptPrefix = { fg = pallet.primary },
    },
    LSP = {
      DiagnosticSignHint = { fg = pallet.info, bg = pallet.ui1 },
      DiagnosticSignInfo = { fg = pallet.info, bg = pallet.ui1 },
      DiagnosticSignWarn = { fg = pallet.warning, bg = pallet.ui1 },
      DiagnosticSignError = { fg = pallet.danger, bg = pallet.ui1 }
    },
    VimWiki = {
      VimwikiHeader1 = { fg = pallet.secondary, style = "b" },
      VimwikiHeader2 = { fg = pallet.secondary, style = "b" },
      VimwikiHeader3 = { fg = pallet.secondary, style = "b" },
      VimwikiHeader4 = { fg = pallet.secondary, style = "b" },
      VimwikiHeader5 = { fg = pallet.secondary, style = "b" },
      VimwikiHeader6 = { fg = pallet.secondary, style = "b" },
      VimwikiBold = { fg = pallet.primary, style = "b" },
      VimwikiItalic = { fg = pallet.primary, style = "i" },
      VimwikiBoldItalic = { fg = pallet.primary, style = "bi" },
      VimwikiLink = { fg = pallet.tertiary, style = "u" },
      VimwikiLinkText = { fg = pallet.tertiary, style = "u" },
      VimwikiLinkTextStd = { fg = pallet.tertiary, style = "u" },
      VimwikiPre = { fg = pallet.primary, style = "b" },
    }
  }
  return theme
end

function apply(group, colors)
  local data = {}
  if colors.fg then data.fg = colors.fg end
  if colors.bg then data.bg = colors.bg end
  if colors.style == "i" then data.italic = true end
  for char in string.gmatch(colors.style or "", ".") do
    if char == "b" then data.bold = true end
    if char == "u" then data.underline = true end
    if char == "r" then data.reverse = true end
    if char == "s" then data.standout = true end
    if char == "c" then data.undercurl = true end
  end
  vim.api.nvim_set_hl(0, group, data)
end

function load(params)
  for group, colors in pairs(params) do apply(group, colors) end
end

function M.colorscheme(name, ansi)
  if vim.g.colors_name then vim.cmd("hi clear") end

  vim.o.termguicolors = true
  vim.g.colors_name = name
  local theme = create_theme(ansi)
  for _, h in pairs(theme) do load(h) end
end

return M
