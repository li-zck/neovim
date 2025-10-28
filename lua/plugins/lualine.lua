return {
  "nvim-lualine/lualine.nvim",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function(_, opts)
    local lualine = require("lualine")
    local nvimbattery = {
      function()
        return require("battery").get_status_line()
      end,
    }

    -- local function has_doc_symbols()
    --   for _, c in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
    --     if c.server_capabilities and c.server_capabilities.documentSymbolProvider then
    --       return true
    --     end
    --
    --     return false
    --   end
    -- end

    local function breadcrumbs()
      if vim.bo.buftype ~= "" then
        return "huh?"
      end

      local bar = nil
      local ok, saga = pcall(require, "lspsaga.symbol.winbar")
      if ok then
        bar = saga.get_bar()
      end
      if bar and bar ~= "" then
        return bar
      end

      -- Fallback: filename + devicon (so winbar isn't empty)
      -- local fname = " "
      -- if fname == "" then
      --   return " "
      -- end

      -- local icon = ""

      -- return string.format(" › ", icon, fname)
      return "huh?"
    end

    table.insert(opts.sections.lualine_x, Snacks.profiler.status())

    lualine.setup({
      options = {
        icons_enabled = true,
        -- theme = "tokyonight",
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 100,
          refresh_time = 16, -- ~60fps
          events = {
            "WinEnter",
            "BufEnter",
            "BufWritePost",
            "SessionLoadPost",
            "FileChangedShellPost",
            "VimResized",
            "Filetype",
            "CursorMoved",
            "CursorMovedI",
            "ModeChanged",
          },
        },
      },

      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename", "filetype" },
        lualine_x = {
          {
            function()
              local reg = vim.fn.reg_recording()

              if reg ~= "" then
                return "recording @" .. reg
              else
                return ""
              end
            end,

            color = { fg = "#ff5f5f", gui = "bold" },
          },

          "encoding",
        },
        lualine_y = { "progress" },
        lualine_z = { "location", nvimbattery, { "datetime", style = "%H:%M" } },
      },

      -- inactive_sections = {
      --   lualine_a = {},
      --   lualine_b = {},
      --   lualine_c = {},
      --   lualine_x = {},
      --   lualine_y = {},
      --   lualine_z = {},
      -- },

      -- tabline = {
      --   lualine_a = {},
      --   lualine_b = {},
      --   lualine_c = {},
      --   lualine_x = {},
      --   lualine_y = {},
      --   lualine_z = {},
      -- },

      winbar = {
        lualine_a = { breadcrumbs },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },

      inactive_winbar = {
        lualine_a = { breadcrumbs },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },

      -- extensions = {},
    })
  end,
}
