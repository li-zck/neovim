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
      },
      typescript = {
        "prettierd",
      },
      typescriptreact = {
        "prettierd",
      },
      javascriptreact = {
        "prettierd",
      },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  }),
}
