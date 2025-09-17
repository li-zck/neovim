return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },

  opts = {
    cmdline = {
      enabled = true,
    },

    presets = {
      bottom_search = false,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = true,
      lsp_doc_border = true,
    },

    messsages = {
      enabled = true,
    },

    popupmenu = {
      enabled = true,
      -- relative = "editor",
      -- position = {
      --   row = 8,
      --   col = "50%",
      -- },
      -- size = {
      --   width = 60,
      --   height = 10,
      -- },
      -- border = {
      --   style = "rounded",
      --   padding = { 0, 1 },
      -- },
      -- win_options = {
      --   winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
      -- },
    },

    views = {
      cmdline_popup = {
        border = {
          style = "none",
          padding = { 2, 3 },
        },
        filter_options = {},
        win_options = {
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        },
      },
    },

    routes = {
      view = "notify",
      filter = {
        event = "msg_showmode",
      },
    },

    lsp = {
      hover = {
        silent = true,
      },
    },
  },
}
