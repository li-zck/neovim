return {
  "saghen/blink.cmp",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
  },
  opts = {
    snippets = {
      preset = "luasnip",
    },

    sources = {
      default = {
        "lsp",
        "path",
        "snippets",
        "buffer",
      },
    },

    cmdline = {
      enabled = false,
    },

    completion = {
      documentation = {
        auto_show = true,
        window = {
          border = "rounded",
          winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
        },
      },

      menu = {
        border = "rounded",
        winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenu,CursorLine:BlinkCmpMenuSelection,Search:None",
      },

      ghost_text = {
        enabled = false,
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
