return {
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    keys = {
      {
        ";c",
        "<cmd>LazyGit<CR>",
        desc = "LazyGit",
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
