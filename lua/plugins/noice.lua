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
    },

    lsp = {
      hover = {
        silent = true,
      },
    },
  },
}
