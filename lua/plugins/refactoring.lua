return {
  -- Incremental rename
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    keys = {
      {
        "<leader>rn",
        function()
          return ":IncRename " .. vim.fn.expand("<cword>")
        end,
        desc = "Incremental Rename",
        mode = { "n", "v" },
        noremap = true,
        expr = true,
      },
    },
    config = true,
  },

  -- Refactoring tool
  {
    "ThePrimeagen/refactoring.nvim",

    keys = {
      {
        "<leader>rf",
        function()
          require("refactoring").select_refactor({
            show_success_message = true,
          })
        end,
        mode = { "n", "v" },
        noremap = true,
        silent = true,
        expr = true,
      },
    },
  },
  opts = {},
}
