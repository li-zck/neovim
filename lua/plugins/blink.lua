return {
  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  version = "1.*",
  opts = {
    completion = {
      documentation = {
        auto_show = true,
      },

      ghost_text = {
        enabled = false,
      },
    },

    cmdline = {
      completion = {
        ghost_text = {
          enabled = true,
        },
      },

      keymap = {
        ["<Tab>"] = { "show", "accept" },
      },
    },
  },
}
