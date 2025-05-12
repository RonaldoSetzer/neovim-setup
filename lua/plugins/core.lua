return {
  {
    "folke/snacks.nvim",
    event = "VimEnter",
    opts = {
      dashboard = {
        enabled = true,
        preset = {
          header = table.concat({
            "",
            "",
            "",
            "██████████████████████████████████████████████████████████████████████████████",
            "██████████    ██████████████  ██████████  ████████████████        ████████████",
            "████████        ██████████████  ██████  ████████████                    ██████",
            "██████            ██████████              ████████                        ████",
            "████    ██    ██    ██████    ██      ██    ██████      ████    ████      ████",
            "████                ████                      ████                        ████",
            "████████  ████  ████████  ██              ██  ██████████    ████    ██████████",
            "██████  ██    ██  ██████  ██  ██████████  ██  ████████    ██    ██    ████████",
            "████  ██  ████  ██  ██████████    ██    ██████████    ████████████████    ████",
            "██████████████████████████████████████████████████████████████████████████████",
            "",
            "",
          }, "\n"),
  
          keys = {
            { icon = "󰱼 ", key = "f", desc = "Find file", action = ":Telescope find_files<CR>" },
            { icon = "󰍉 ", key = "t", desc = "Find text", action = ":Telescope live_grep<CR>" },
            { icon = " ", key = "p", desc = "Find project", action = ":Telescope projects<CR>" },
            { icon = " ", key = "g", desc = "Git", action = ":tab G<CR>" },
          },
        },
        formats = {
          footer = { "Santiago.d.Ronaldo", align = "center" },
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
          {
            items = {
              { desc = "Santiago.d.Ronaldo" },
            },
            gap = 1,
            padding = 1,
            align = "center",
          },
        }
      },
    },
  },
  { "famiu/bufdelete.nvim", cmd = { "Bdelete", "Bwipeout" } },
  { "tpope/vim-surround", event = "VeryLazy" },
  { "tpope/vim-eunuch", cmd = { "Rename", "Move", "Delete", "Mkdir", "Chmod" } },
	{ "numToStr/Comment.nvim", keys = { "gc", "gb" }, opts = {} },
}
