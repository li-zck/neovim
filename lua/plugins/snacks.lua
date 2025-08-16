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
        left = { "mark", "sign" },
        right = { "fold", "git" },
        folds = {
          open = false,
          git_hl = false,
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

      -- STYLE --
      styles = {
        snacks_image = {
          snacks_image = function()
            return {
              relative = "cursor",
              border = "none",
              focusable = false,
              backdrop = false,
              row = 0,
              col = 0,
            }
          end,
        },
      },

      -- IMAGE --
      image = {
        enabled = true,
        formats = {
          "png",
          "jpg",
          "jpeg",
          "gif",
          "bmp",
          "webp",
          "tiff",
          "heic",
          "avif",
          "mp4",
          "mov",
          "avi",
          "mkv",
          "webm",
          "pdf",
        },

        force = true,

        doc = {
          enabled = true,
          inline = true,
          float = true,
          max_width = 30,
          max_height = 15,
        },

        wo = {
          wrap = false,
          number = false,
          relativenumber = false,
          cursorcolumn = false,
          signcolumn = "no",
          foldcolumn = "0",
          statuscolumn = "",
        },

        -- env = {
        --   SNACKS_GHOSTTY = true,
        -- },

        icons = {
          math = "󰪚 ",
          chart = "󰄧 ",
          image = " ",
        },
      },

      -- EXPLORER --
      -- explorer = {
      --   enabled = true,
      -- },

      -- PICKER --
      -- picker = {
      --   enabled = true,
      --   sources = {
      --     explorer = {
      --       win = {
      --         list = {
      --           keys = {},
      --         },
      --       },
      --       -- actions = {
      --       --   explorer_cut = function(picker, item) end,
      --       -- },
      --       layout = {
      --         layout = {
      --           width = 30,
      --         },
      --       },
      --     },
      --   },
      --   hidden = true,
      --   ignored = true,
      -- },

      -- SCOPE --
      scope = {
        enabled = true,
      },

      -- SCROLL --
      scroll = {
        enabled = true,
      },

      -- INPUT --
      input = {
        enabled = true,
      },

      -- LAZYGIT --
      lazygit = {
        configure = true,

        config = {
          os = {
            editPreset = "nvim-remote",
          },
          gui = {
            nerdFontsVersion = "3",
          },
        },
      },
    }
  end,

  keys = {
    {
      ";c",
      function()
        require("snacks.lazygit").open()
      end,
      desc = "Toggle Snacks LazyGit",
    },
  },
}
