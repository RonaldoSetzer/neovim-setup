local M = {}
local agni = {
  black = "#282828",
  black2 = "#3c3836",
  black3 = "#504945",
  white = "#d5c4a1",
  yellow = "#fabd2f",
  --[[ green = "#83a598", ]]
  dark_yellow = "#d79921", -- nao usado
  orange = "#fe8019",      -- nao usado
  dark_orange = "#d65d0e",
  red = "#fb4934",
  dark_red = "#cc241d",     -- nao usado
  purple = "#d3869b",
  dark_primary = "#b16286", -- nao usado
  blue = "#fe8019",
  green = "#458588",        -- nao usado
  aqua = "#8ec07c",
  dark_aqua = "#689d6a",    -- nao usado
  --[[ green = "#b8bb26", ]]
  --[[ yellow = "#b8bb26", ]]
  dark_green = "#98971a", -- nao usado
  grey = "#a89984",
  dark_grey = "#7c6f64"
}
local kaiser = {
  black = "#282828",
  black2 = "#3c3836",
  black3 = "#504945",
  white = "#d5c4a1",
  yellow = "#fabd2f",
  dark_yellow = "#d79921", -- nao usado
  orange = "#fe8019",      -- nao usado
  dark_orange = "#d65d0e",
  red = "#fb4934",
  dark_red = "#cc241d",     -- nao usado
  purple = "#d3869b",
  dark_primary = "#b16286", -- nao usado
  blue = "#83a598",
  dark_blue = "#458588",    -- nao usado
  aqua = "#8ec07c",
  dark_aqua = "#689d6a",    -- nao usado
  green = "#b8bb26",
  dark_green = "#98971a",   -- nao usado
  grey = "#a89984",
  dark_grey = "#7c6f64"
}
local rudra = {
  black = "#202d3e",
  black2 = "#434758",
  black3 = "#585d81",
  white = "#d0d0d0",
  --[[ black = "#202d3e", ]]
  --[[ black2 = "#434758", ]]
  --[[ black3 = "#585d81", ]]
  --[[ white = "#d0d0d0", ]]
  yellow = "#82aaff",
  dark_yellow = "#d79921", -- nao usado
  orange = "#fe8019",      -- nao usado
  dark_orange = "#d65d0e",
  red = "#fb4934",
  dark_red = "#cc241d",     -- nao usado
  purple = "#d3869b",
  dark_primary = "#b16286", -- nao usado
  blue = "#c792ea",
  dark_blue = "#458588",    -- nao usado
  aqua = "#c3e88d",
  dark_aqua = "#689d6a",    -- nao usado
  green = "#89ddff",
  dark_green = "#98971a",   -- nao usado
  grey = "#767ba4",
  dark_grey = "#7c6f64"
}
local rudra2 = {
  black = "#202d3e",
  black2 = "#434758",
  black3 = "#585d81",
  white = "#d0d0d0",
  dark_orange = "#82aaff",
  dark_yellow = "#d79921", -- nao usado
  green = "#c3e88d",       -- nao usado
  orange = "#d65d0e",
  red = "#fb4934",
  dark_red = "#cc241d",     -- nao usado
  purple = "#d3869b",
  dark_primary = "#b16286", -- nao usado
  blue = "#c792ea",
  dark_blue = "#458588",    -- nao usado
  aqua = "#ff8b92",
  dark_aqua = "#689d6a",    -- nao usado
  yellow = "#89ddff",
  dark_green = "#98971a",   -- nao usado
  grey = "#767ba4",
  dark_grey = "#7c6f64"
}
local ansi = kaiser

local pallet = {
  -- gradient block
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

local c = pallet
local theme = {
  base = {
    Normal = { fg = c.foreground, bg = c.background },
    Comment = { fg = c.comments, style = "i" },
    Constant = { fg = c.foreground, style = "b" },
    String = { fg = c.text, style = "b" },
    Number = { fg = c.number },
    Boolean = { fg = c.primary, style = "b" },
    Float = { fg = c.number },
    Identifier = { fg = c.primary, style = "i" },
    Function = { fg = c.secondary }, -- REVIEW
    Statement = { fg = c.primary, style = "i" },
    Conditional = { fg = c.primary, style = "i" },
    Repeat = { fg = c.primary, style = "i" },
    Label = { fg = c.primary }, -- REVIEW
    Operator = { fg = c.primary },
    Keyword = { fg = c.primary, style = "i" },
    Exception = { fg = c.primary },            -- REVIEW
    Include = { fg = c.primary, style = "i" }, -- REVIEW
    --[[ Title = { fg = c.primary }, ]]
    Type = { fg = c.tertiary },
    SpecialComment = { fg = c.comments, style = "b" },           -- REVIEW
    Todo = { fg = c.tertiary, bg = c.background, style = "ri" }, -- REVIEW
    Underlined = { fg = c.foreground, style = "u" },             -- REVIEW
    ColorColumn = { fg = c.background, bg = c.ui1 },
    CursorLineNr = { fg = c.secondary },
    SignColumn = { fg = c.background, bg = c.ui1 },
    Conceal = { fg = c.primary }, -- REVIEW
    CursorColumn = { bg = c.ui1 },
    CursorLine = { bg = c.ui1 },
    Directory = { fg = c.primary },                                   -- REVIEW
    DiffAdd = { fg = c.info, bg = c.background, style = "ri" },       -- REVIEW
    DiffAdded = { fg = c.info },                                      -- REVIEW
    DiffChange = { fg = c.warning, bg = c.background, style = "ri" }, -- REVIEW
    DiffChanged = { fg = c.warning },                                 -- REVIEW
    DiffDelete = { fg = c.danger, bg = c.background, style = "ri" },  -- REVIEW
    DiffRemoved = { fg = c.danger },                                  -- REVIEW
    DiffText = { fg = c.background, bg = c.warning, style = "ri" },   -- REVIEW
    ErrorMsg = { bg = c.danger },                                     -- REVIEW
    VertSplit = { fg = c.background, bg = c.ui1 },
    Folded = { fg = c.comment, bg = c.ui1, style = "i" },
    FoldColumn = { fg = c.ui2, bg = c.ui2 },
    IncSearch = { fg = c.background, bg = c.primary },
    LineNr = { fg = c.comment },
    --[[ MatchParen = { fg = c.blue, style = "b" }, ]]
    --[[ ModeMsg = { fg = c.blue, style = "b" }, ]]
    --[[ MoreMsg = { fg = c.info, style = "b" }, ]]
    NonText = { fg = c.ui2 },
    PreProc = { fg = c.primary, style = "i" },
    Pmenu = { fg = c.foreground, bg = c.background },
    PmenuSel = { fg = c.ui1, bg = c.primary, style = "b" },
    PmenuSbar = { bg = c.ui2 },
    PmenuThumb = { bg = c.primary },
    --[[ Question = { fg = c.danger, style = "b" }, ]]
    Search = { fg = c.background, bg = c.secondary },
    --[[ SpecialKey = { fg = c.blue }, ]]
    StatusLine = { bg = c.ui1, style = "b" },
    StatusLineNC = { fg = c.comment, bg = c.ui2, style = "b" },
    TabLine = { bg = c.ui1 },
    TabLineSel = { fg = c.primary }, -- REVIEW
    TabLineFill = { bg = c.ui1 },
    Visual = { bg = c.visual },
    VisualNOS = { bg = c.visual },
    --[[ WarningMsg = { fg = c.warning, style = "b" }, ]]
    WildMenu = { fg = c.primary, bg = c.ui2, style = "b" }
  },
  treesitter = {
    ["@Include"] = { fg = c.primary, style = "i" },
    ["@keyword"] = { fg = c.primary, style = "i" },
    ["@keyword.operator"] = { fg = c.primary, style = "b" },
    ["@keyword.return"] = { fg = c.primary, style = "i" },
    ["@keyword.function"] = { fg = c.primary, style = "i" },
    ["@type"] = { fg = c.tertiary },
    ["@type.builtin"] = { fg = c.tertiary },
    ["@type.qualifier"] = { fg = c.primary, style = "i" },
    ["@method"] = { fg = c.secondary },
    ["@variable"] = { fg = c.foreground },
    ["@variable.builtin"] = { fg = c.primary },
    ["@property"] = { fg = c.foreground, style = "i" },
    ["@parameter"] = { fg = c.foreground },
    ["@repeat"] = { fg = c.primary, style = "i" },
    ["@number"] = { fg = c.number },
    ["@string"] = { fg = c.text, style = "b" },
    ["@constant"] = { fg = c.foreground, style = "b" },
    ["@constant.builtin"] = { fg = c.primary },
    ["@operator"] = { fg = c.primary },
    ["@comment"] = { fg = c.comment, style = "i" },
    ["@function"] = { fg = c.secondary },
    ["@function.call"] = { fg = c.secondary, style = "b" },
    ["@conditional"] = { fg = c.primary, style = "i" },
    ["@punctuation.delimiter"] = { fg = c.punctuation },
    ["@punctuation.special"] = { fg = c.secondary },
    ["@boolean"] = { fg = c.primary, style = "b" },
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
    ["@constructor"] = { fg = c.secondary },
    --[[ ["@label"] = { fg = c.blue_gray }, ]]
    --[[ ["@exception"] = { fg = c.red }, ]]
    --[[ ["@storageclass.lifetime"] = { fg = c.orange }, ]]
    --[[ ["@structure"] = { fg = c.blue_gray }, ]]
    --[[ ["@text"] = { fg = c.soft_yellow }, ]]
    --[[ ["@text.strong"] = { fg = c.soft_yellow }, ]]
    --[[ ["@text.emphasis"] = { fg = c.soft_yellow }, ]]
    --[[ ["@text.underline"] = { fg = c.soft_yellow }, ]]
    ["@text.title"] = { fg = c.secondary },
    --[[ ["@text.literal"] = { fg = c.soft_yellow }, ]]
    ["@text.uri"] = { fg = c.text, style = "biu" },
    ["@uri"] = { fg = c.text, style = "b" },
    ["@tag"] = { fg = c.primary },
    ["@tag.delimiter"] = { fg = c.punctuation },
    ["@tag.attribute"] = { fg = c.tertiary, style = "i" },
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
    jsonQuote = { fg = c.comment, style = "i" },
    jsonnoQuotesError = { fg = c.comment, style = "i" },
    jsonFold = { fg = c.comment, style = "i" },
  },
  GitSigns = {
    GitSignsChange = { fg = c.warning, bg = c.ui1 },
    GitSignsAdd = { fg = c.info, bg = c.ui1 },
    GitSignsDelete = { fg = c.danger, bg = c.ui1 }
  },
  LSP = {
    DiagnosticSignHint = { fg = c.info, bg = c.ui1 },
    DiagnosticSignInfo = { fg = c.info, bg = c.ui1 },
    DiagnosticSignWarn = { fg = c.warning, bg = c.ui1 },
    DiagnosticSignError = { fg = c.danger, bg = c.ui1 }
  },
  VimWiki = {
    VimwikiHeader1 = { fg = c.secondary, style = "b" },
    VimwikiHeader2 = { fg = c.secondary, style = "b" },
    VimwikiHeader3 = { fg = c.secondary, style = "b" },
    VimwikiHeader4 = { fg = c.secondary, style = "b" },
    VimwikiHeader5 = { fg = c.secondary, style = "b" },
    VimwikiHeader6 = { fg = c.secondary, style = "b" },
    VimwikiBold = { fg = c.primary, style = "b" },
    VimwikiItalic = { fg = c.primary, style = "i" },
    VimwikiBoldItalic = { fg = c.primary, style = "bi" },
    VimwikiLink = { fg = c.tertiary, style = "u" },
    VimwikiLinkText = { fg = c.tertiary, style = "u" },
    VimwikiLinkTextStd = { fg = c.tertiary, style = "u" },
    VimwikiPre = { fg = c.primary, style = "b" },
  }
}
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

function M.colorscheme()
  if vim.g.colors_name then vim.cmd("hi clear") end

  vim.o.termguicolors = true
  vim.g.colors_name = 'agni'

  for _, h in pairs(theme) do load(h) end
end

return M
