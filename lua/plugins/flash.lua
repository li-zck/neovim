return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    modes = {
      search = {
        enabled = false,
      },
      char = {
        enabled = true,
        config = function(opts)
          opts.autohide = opts.autohide or (vim.fn.mode(true):find("no") and vim.v.operator == "y")
          opts.jump_labels = opts.jump_labels
            and vim.v.count == 0
            and vim.fn.reg_executing() == ""
            and vim.fn.reg_recording() == ""
        end,
        autohide = false,
        jump_labels = true,
        multi_line = true,
        label = {
          exclude = "hjkliardc",
        },
        keys = { "f", "F", "t", "T", ";", "," },
        char_actions = function(motion)
          return {
            [";"] = "next",
            [","] = "prev",
            [motion:lower()] = "next",
            [motion:upper()] = "prev",
          }
        end,
        search = {
          wrap = false,
        },
        highlight = {
          backdrop = true,
        },
        jump = {
          register = false,
          autojump = false,
        },
      },

      treesitter = {
        labels = "abcdefghijklmnopqrstuvwxyz",
        jump = { pos = "range", autojump = true },
        search = { incremental = false },
        label = { before = true, after = true, style = "inline" },
        highlight = {
          backdrop = true,
          matches = false,
        },
      },
    },

    highlight = {
      backdrop = true,
      matches = false, -- disable highlight for search matches
      priority = 5000,
      groups = {
        match = "FlashMatch",
        current = "FlashCurrent",
        backdrop = "FlashBackdrop",
        label = "Constant",
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
