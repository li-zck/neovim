return {
  "stevearc/conform.nvim",
  require("conform").setup({
    formatters_by_ft = {
      lua = {
        "stylua",
      },
      go = {
        "gofmt",
      },
      python = function(bufnr)
        if require("conform").get_formatter_info("ruff_format", bufnr).available then
          return { "ruff_format" }
        else
          return { "isort", "black" }
        end
      end,
      rust = {
        "rustfmt",
        lsp_format = "fallback",
      },
      javascript = {
        "biome",
        -- "biome-check",
      },
      typescript = {
        "biome",
        -- "biome-check",
      },
      typescriptreact = {
        "biome",
        -- "biome-check",
      },
      javascriptreact = {
        "biome",
        -- "biome-check",
      },
      ruby = {
        -- "rubocop",
        "rubyfmt",
      },
      astro = {
        "biome",
        "biome-check",
      },

      -- ["*"] = { "codespell" }, -- run formatters on all filetypes
      -- ["_"] = { "trim_whitespace" }, -- run formatters on filetypes tha don't have other formatters configured.
    },
    -- default_format_opts = {
    --   lsp_format = "fallback",
    -- },
    format_on_save = {
      lsp_format = "fallback",
      timeout_ms = 500,
    },

    -- format_after_save = {
    --   lsp_format = "fallback",
    -- },
    log_level = vim.log.levels.ERROR,
    notify_on_error = true,
    notify_no_formatters = true,
  }),
}
