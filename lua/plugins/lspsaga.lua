return {
  "nvimdev/lspsaga.nvim",

  config = function()
    require("lspsaga").setup({
      -- breadcrumbs
      symbol_in_winbar = {
        enable = false,
        separator = " › ",
        hide_keyword = false,
        show_file = false,
        folder_level = 1,
        color_mode = true,
        delay = 300,
      },

      -- callhierarchy
      callhierarchy = {
        layout = "float",

        keys = {
          edit = "e",
          vsplit = "s",
          split = "i",
          tabe = "t",
          quit = "q",
          shuttle = "[w",
          toggle_or_req = "u",
          close = "<C-c>k",
        },
      },

      -- code action
      code_action = {
        enable = false,
        num_shortcut = false,
        show_server_name = false,
        extend_gitsigns = false,
      },

      -- definition
      definition = {
        width = 0.7,
        height = 0.4,

        keys = {
          edit = "<C-c>o",
          vsplit = "<C-c>v",
          split = "<C-c>i",
          tabe = "<C-c>t",
          quit = "q",
          close = "<C-c>k",
        },
      },

      -- diagnostics
      diagnostic = {
        show_code_action = false,
        jump_num_shortcut = false,
        max_width = 0.5,
        max_height = 0.5,
        text_hl_follow = false,
        border_follow = false,
        extend_relatedInformation = false,
        show_layout = "float",
        show_normal_height = 10,
        max_show_width = 0.9,
        max_show_height = 0.6,
        diagnostic_only_current = false,

        keys = {
          exec_action = "o",
          quit = "q",
          toggle_or_jump = "<CR>",
          quit_in_show = { "q", "ESC" },
        },
      },

      -- finder
      finder = {
        max_height = 0.5,
        left_width = 0.2,
        right_width = 0.4,
        default = "ref+imp",
        methods = {},
        layout = "float",
        filter = {},
        silent = false,

        keys = {
          shuttle = "[w",
          toggle_or_open = "o",
          vsplit = "s",
          split = "i",
          tabe = "t",
          tabnew = "r",
          quit = "q",
          close = "<C-c>k",
        },
      },

      -- float terminal

      -- hover
      hover = {
        max_width = 0.5,
        max_height = 0.4,
        open_link = "gx",
        open_cmd = "!brave",
      },

      -- implement
      implement = {
        enable = true,
        sign = true,
        virtual_text = true,
        priority = 100,
      },

      -- lightbulb
      lightbulb = {
        enable = false,
      },

      -- outline
      outline = {
        win_position = "right",
        win_width = 40,
        auto_preview = true,
        detail = true,
        auto_close = true,
        close_after_jump = false,
        layout = "float",
        max_height = 0.5,
        left_width = 0.3,

        keys = {
          toggle_or_jump = "o",
          quit = "q",
          jump = "<CR>",
        },
      },

      -- rename
      rename = {
        in_select = true,
        auto_save = false,
        project_max_width = 0.5,
        project_max_height = 0.5,

        keys = {
          quit = "q",
          exec = "<CR>",
          select = "x",
        },
      },

      -- ui
      ui = {
        border = "single",
        devicon = true,
        title = true,
        expand = "⊞",
        collapse = "⊟",
        code_action = "💡",
        actionfix = " ",
        lines = { "┗", "┣", "┃", "━", "┏" },
        kind = {},
        imp_sign = "󰳛 ",
      },

      -- beacon
      beacon = {
        enable = false,
      },
    })
  end,

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
}
