local status_ok, alpha = pcall(require, "alpha")
if not status_ok then return end

--    ░░ ▒▒ ▓▓ ██ == coloers defaylt
-- ██ ▓▓ ▒▒ ░░    -- colors negative

local negative_slimer = {
  [[             ▓▓▓▓▓▓▓▓▒▒▒▒▒▒       ]],
  [[           ▓▓▒▒  ░░░░░░░░░░▒▒     ]],
  [[         ██▒▒  ░░░░░░░░░░░░░░▒▒   ]],
  [[       ██▓▓  ░░░░████████████▒▒   ]],
  [[       ██▓▓░░░░▒▒  ██    ██  ▒▒   ]],
  [[     ██▓▓▒▒░░░░▒▒            ▒▒   ]],
  [[     ██▓▓░░░░░░░░▒▒▒▒░░░░▒▒▒▒██   ]],
  [[   ██▓▓▒▒░░░░░░░░░░░░░░░░░░░░██   ]],
  [[   ██▓▓░░░░░░░░░░████░░░░░░░░██   ]],
  [[ ██▓▓▒▒░░░░▒▒░░░░░░░░░░░░░░░░▒▒▓▓ ]],
  [[ ██▓▓░░░░▓▓▓▓▓▓▓▓▒▒░░▒▒▓▓▓▓░░░░▓▓ ]],
  [[ ██▓▓████████████████████████████ ]]
}
local slimer = {
  [[████████████████████████████████████████████████████████]],
  [[████████████████████████░░░░░░░░▒▒▒▒▒▒██████████████████]],
  [[██████████████████████░░▒▒██▓▓▓▓▓▓▓▓▓▓▒▒████████████████]],
  [[████████████████████  ▒▒██▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒██████████████]],
  [[██████████████████  ░░██▓▓▓▓            ▒▒██████████████]],
  [[██████████████████  ░░▓▓▓▓▒▒██  ████  ██▒▒██████████████]],
  [[████████████████  ░░▒▒▓▓▓▓▒▒████████████▒▒██████████████]],
  [[████████████████  ░░▓▓▓▓▓▓▓▓▒▒▒▒▓▓▓▓▒▒▒▒  ██████████████]],
  [[██████████████  ░░▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓  ██████████████]],
  [[██████████████  ░░▓▓▓▓▓▓▓▓▓▓    ▓▓▓▓▓▓▓▓  ██████████████]],
  [[████████████  ░░▒▒▓▓▓▓▒▒▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒░░████████████]],
  [[████████████  ░░▓▓▓▓░░░░░░░░▒▒░░▒▒░░░░▓▓▓▓░░████████████]],
  [[████████████  ░░                            ████████████]],
  [[████████████████████████████████████████████████████████]]
}
local setzer = {
  [[                      ██                ]],
  [[                    ██▓▓██              ]],
  [[                  ██████████            ]],
  [[                ▓▓  ██████              ]],
  [[              ▓▓▒▒▓▓  ██                ]],
  [[            ▓▓▓▓▓▓▓▓▓▓                  ]],
  [[              ▓▓▓▓▓▓  ▒▒                ]],
  [[                ▓▓  ▒▒░░▒▒              ]],
  [[                  ▒▒▒▒▒▒▒▒▒▒            ]],
  [[                ░░  ▒▒▒▒▒▒              ]],
  [[              ░░  ░░  ▒▒                ]],
  [[            ░░░░░░░░░░                  ]],
  [[              ░░░░░░                    ]],
  [[                ░░                      ]]
}

local space = {
  [[]],
  [[]],
  [[]],
  [[██████████████████████████████████████████████████████████████████████████████]],
  [[██████████    ██████████████  ██████████  ████████████████        ████████████]],
  [[████████        ██████████████  ██████  ████████████                    ██████]],
  [[██████            ██████████              ████████                        ████]],
  [[████    ██    ██    ██████    ██      ██    ██████      ████    ████      ████]],
  [[████                ████                      ████                        ████]],
  [[████████  ████  ████████  ██              ██  ██████████    ████    ██████████]],
  [[██████  ██    ██  ██████  ██  ██████████  ██  ████████    ██    ██    ████████]],
  [[████  ██  ████  ██  ██████████    ██    ██████████    ████████████████    ████]],
  [[██████████████████████████████████████████████████████████████████████████████]],
  [[]],
  [[]]
}
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = space;

dashboard.section.buttons.val = {
  dashboard.button("f", "  Find file", "<cmd>Telescope find_files <CR>"),
  dashboard.button("t", "  Find text", "<cmd>Telescope live_grep <CR>"),
  dashboard.button("p", "  Find project", "<cmd>Telescope projects <CR>"),
  dashboard.button("g", "  Git", "<cmd>tab G<CR>"),
  -- dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  -- dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
  -- dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
  -- dashboard.button("q", "  Quit Neovim", ":qa<CR>")
}

local function footer()
  return "Santiago.d.Ronaldo"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
