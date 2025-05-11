-- ╭─────────────────────────────────────────────────────╮
-- │  Abreviations Configurations                        │
-- ╰─────────────────────────────────────────────────────╯
local function cabbrev(lhs, rhs)
  vim.cmd(string.format("cabbrev %s %s", lhs, rhs))
end

-- -------------------------------------------------------
-- Command abbreviations
-- -------------------------------------------------------

cabbrev("h",    "vert h")
cabbrev("help", "vert help")
cabbrev("Copilot", "vert Copilot")
cabbrev("new", "vert new")
