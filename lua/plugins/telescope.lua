return {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      "<leader><leader>",
      function()
        require("telescope.builtin").find_files({
          -- Pass these options directly to the find_files call
          -- This ensures they apply to this specific picker,
          -- overriding any defaults if necessary, though the defaults
          -- below will also set them correctly.
          hidden = true,
          no_ignore = false, -- Respect .gitignore for most files
          file_ignore_patterns = {
            -- Regex patterns to ignore specific directories/files
            -- Add common directories you want to hide, even if they are dotfiles or hidden
            "node_modules/",
            "^%.git/", -- Ignores everything within the .git directory
            "%.cache/", -- Common cache directory
            "%.vscode/", -- VSCode settings directory
            "%.idea/", -- IntelliJ/WebStorm IDE directory
            "target/", -- Common build directory in Rust/Java
            "build/", -- Common build directory
            "dist/", -- Common distribution directory
            "venv/", -- Python virtual environments
          },
        })
      end,
      desc = "Find files in current directory (including dot files, excluding common build/dependency folders)",
    },
  },
  -- Change some options (these will be the defaults for other Telescope pickers)
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,

      pickers = {
        find_files = {
          hidden = true, -- Show dot files
          no_ignore = false, -- Crucially, set this to false to respect .gitignore
          file_ignore_patterns = {
            -- These are default ignore patterns applied to all find_files calls
            -- unless overridden by specific picker calls.
            -- You can add more global ignores here if desired.
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
        },
      },
    },
  },
}
