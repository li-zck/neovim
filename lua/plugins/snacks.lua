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
        enabled = true,

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
        enabled = true,

        exclude = { "latext" },
      },

      -- STATUS COLUMN --
      statuscolumn = {
        enabled = true,

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
        enabled = false,
      },

      -- STYLE --
      styles = {
        enabled = true,

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
        float = {
          backdrop = 100,
        },
        input = {
          wo = {
            winhighlight = "NormalFloat:SnacksInputNormal,FloatBorder:SnacksInputBorder,FloatTitle:SnacksInputTitle",
            cursorline = false,
          },
          b = {
            completion = false,
          },
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
      explorer = {
        enabled = true,

        replace_netrw = true,
        -- follow = true,
        auto_focus = true,
      },

      -- PICKER --
      picker = {
        enabled = true,

        border = "rounded",

        files = {
          hidden = true,
          ignored = true,
        },

        previewers = {
          file = {
            max_line_height = 1000,
          },
        },

        layout = {
          backdrop = {
            dim = true,
            percentage = 0.15,
          },
          cycle = true,
          preset = function()
            return vim.o.columns >= 120 and "default" or "vertical"
          end,
        },

        -- layout = {
        --   reverse = true,
        --   layout = {
        --     -- box = function()
        --     --   return vim.o.columns >= 120 and "horizontal" or "vertical"
        --     -- end,
        --     box = "vertical",
        --     width = function()
        --       return vim.o.columns >= 120 and 0.6 or 0.8
        --     end,
        --     height = 0.9,
        --     border = "none",
        --     {
        --       box = "vertical",
        --       {
        --         win = "list",
        --         title = "Results",
        --         title_pos = "center",
        --         border = "rounded",
        --         -- height = 10,
        --       },
        --       {
        --         win = "input",
        --         height = 1,
        --         border = "rounded",
        --         title = "{title} {live} {flags}",
        --         title_pos = "center",
        --       },
        --     },
        --     {
        --       win = "preview",
        --       title = "{preview:Preview}",
        --       -- width = 0.6,
        --       border = "rounded",
        --       title_pos = "center",
        --     },
        --   },
        -- },

        sources = {
          explorer = {
            tree = true,
            git_status_open = false,
            auto_close = true,
            follow_file = true,
            hidden = true,
            exclude = {
              ".git",
              -- "node_modules",
            },
            layout = {
              box = {
                border = "rounded",
              },
              layout = {
                position = "float",
                width = 60,
                height = 30,
                preview = false,
                preset = "float",
              },
            },
          },
        },

        zoxide = {
          finder = "files_zoxide",
          format = "file",
          confirm = "load_session",
          win = {
            preview = {
              minimal = true,
            },
          },
        },
      },

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

      -- SCRATCH BUFFER --
      scratch = {
        enabled = true,

        icon = false,
      },

      -- WIN --
      -- win = {
      --   show = true,
      --   wo = {
      --     winhighlight = "Normal:Normal,NormalFloat:Normal,FloatBorder:Normal",
      --   },
      --   bo = {},
      -- },

      -- RENAME --
      rename = {
        enabled = true,
      },

      -- TERMINAL --
      terminal = {
        enabled = false,
      },

      -- TOGGLE --
      toggle = {
        enabled = true,
      },

      -- PROFILER --
      profiler = {
        enabled = true,
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
    -- {
    --   "<leader>e",
    --   function()
    --     require("snacks.explorer").open()
    --   end,
    --   desc = "Toggle Snacks Explorer",
    -- },
    {
      "<leader><leader>",
      "<cmd>lua Snacks.picker.files()<CR>",
      desc = "Snacks Picker cwd files",
    },
    {
      "<leader>sg",
      "<cmd>lua Snacks.picker.grep()<CR>",
      desc = "Snacks Picker cwd grep",
    },
    {
      "-",
      function()
        require("utils.snacks.scratch").new_scratch()
      end,
      desc = "Snacks: New Scratch (choose ft)",
    },
    {
      "_",
      function()
        require("utils.snacks.scratch").select_scratch()
      end,
      desc = "Snacks: Select Scratch",
    },
    {
      "<leader>zi",
      "<cmd>lua Snacks.picker.zoxide()<CR>",
      desc = "Snacks Picker zoxide",
    },
    -- {
    --   "<c-/>",
    --   function()
    --     Snacks.terminal("float")
    --   end,
    --   desc = "Toggle Snacks terminal",
    -- },
    {
      "<leader>ps",
      function()
        Snacks.profiler.scratch()
      end,
      desc = "Snacks Profiler scratch buffer",
    },
  },
}
