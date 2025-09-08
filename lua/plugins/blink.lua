return {
  "saghen/blink.cmp",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
  },
  opts = {
    snippets = { preset = "luasnip" },
    sources = { default = {
      "lsp",
      "path",
      "snippets",
      "buffer",
    } },
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

    keymap = {
      ["<Tab>"] = {
        "snippet_forward",
        "select_next",
        "accept",
        "fallback",
      },
      ["<S-Tab>"] = {
        "snippet_backward",
        "select_prev",
        "fallback",
      },
    },
  },

  config = function(_, opts)
    require("blink.cmp").setup(opts)

    require("luasnip.loaders.from_vscode").lazy_load()

    require("luasnip.loaders.from_vscode").lazy_load({
      paths = {
        vim.fn.stdpath("config") .. "/snippets",
      },
    })
  end,
}
