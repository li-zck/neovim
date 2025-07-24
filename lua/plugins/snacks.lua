return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  opts = function()
    local get_header = require("utils.poetry")

    local function get_spaced_header()
      local header_lines = get_header(nil, true)
      local spaced_header = {}
      for _, line in ipairs(header_lines) do
        table.insert(spaced_header, line)
        table.insert(spaced_header, "")
      end
      return table.concat(spaced_header, "\n")
    end

    return {
      -- DASHBOARD --
      dashboard = {
        preset = {
          header = get_spaced_header(),
        },

        formats = {
          header = { "%s", align = "center" },
        },

        sections = {
          { pane = 1, section = "header" },
          { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup" },
        },
      },

      -- INDENT --
      indent = {
        -- char = "|",
        opts = {},
      },

      -- BIGFILES --
      bigfile = {
        enabled = true,

        notify = true,
        size = 1.5 * 1024 * 1024,
        line_length = 1000,
      },

      -- NOTIFIER --
      notifier = {
        icons = {
          error = " ",
          warn = " ",
          info = " ",
          debug = " ",
          trace = " ",
        },
      },

      -- QUICK FILE --
      quickfile = {
        exclude = { "latext" },
      },

      -- STATUS COLUMN --
      statuscolumn = {
        left = { "mark", "sign" }, -- priority of signs on the left (high to low)
        right = { "fold", "git" }, -- priority of signs on the right (high to low)
        folds = {
          open = false, -- show open fold icons
          git_hl = false, -- use Git Signs hl for fold icons
        },
        git = {
          -- patterns to match Git signs
          patterns = { "GitSign", "MiniDiffSign" },
        },
        refresh = 50, -- refresh at most every 50ms
      },

      -- WORDS --
      words = {
        enabled = true,
      },
    }
  end,
}
