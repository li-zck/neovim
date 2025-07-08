return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader><leader>",
      function()
        require("telescope.builtin").find_files({
          hidden = true,
          no_ignore = true,
          file_ignore_patterns = {
            "node_modules/",
            "^%.git/",
            "%.cache/",
            "%.vscode/",
            "%.idea/",
            "target/",
            "build/",
            "dist/",
            "venv/",
          },
        })
      end,
      desc = "Find files in current directory (including dot files, excluding common build/dependency folders)",
    },
  },

  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
    },
  },
}
