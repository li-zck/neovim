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
      rust = {
        "rustfmt",
        lsp_format = "fallback",
      },
      javascript = {
        "prettierd",
        "prettier",
        stop_after_first = true,
      },
      typescript = {
        "prettierd",
        "prettier",
        stop_after_first = true,
      },
      typescriptreact = {
        "prettierd",
        "prettier",
        stop_after_first = true,
      },
      javascriptreact = {
        "prettierd",
        "prettier",
        stop_after_first = true,
      },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  }),
}
