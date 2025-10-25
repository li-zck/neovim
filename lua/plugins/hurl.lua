return {
  "jellydn/hurl.nvim",

  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- Optional, for markdown rendering with render-markdown.nvim
    -- {
    --   "MeanderingProgrammer/render-markdown.nvim",
    --   opts = {
    --     file_types = { "markdown" },
    --   },
    --   ft = { "markdown" },
    -- },
  },

  ft = "hurl",

  opts = {
    -- Show debugging info
    debug = false,
    -- Show notification on run
    show_notification = true,
    -- Show response in popup or split
    mode = "split",
    -- split_position = "bottom",
    -- split_size = "50%",

    formatters = {
      json = { "jq" },
      html = {
        "prettierd",
        "--parser",
        "html",
      },
      xml = {
        "tidy",
        "-xml",
        "-i",
        "-q",
      },
    },

    mappings = {
      close = "q",
      next_panel = "<C-n>",
      prev_panel = "<C-p>",
    },
  },
  keys = {
    -- Run API request
    { "<leader>A", "<cmd>HurlRunner<CR>", desc = "Run All requests" },
    { "<leader>a", "<cmd>HurlRunnerAt<CR>", desc = "Run Api request" },
    { "<leader>te", "<cmd>HurlRunnerToEntry<CR>", desc = "Run Api request to entry" },
    { "<leader>tE", "<cmd>HurlRunnerToEnd<CR>", desc = "Run Api request from current entry to end" },
    { "<leader>tm", "<cmd>HurlToggleMode<CR>", desc = "Hurl Toggle Mode" },
    { "<leader>tv", "<cmd>HurlVerbose<CR>", desc = "Run Api in verbose mode" },
    { "<leader>tV", "<cmd>HurlVeryVerbose<CR>", desc = "Run Api in very verbose mode" },
    -- Run Hurl request in visual mode
    { "<leader>h", ":HurlRunner<CR>", desc = "Hurl Runner", mode = "v" },
  },
}
