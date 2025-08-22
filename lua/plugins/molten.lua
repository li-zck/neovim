return {
  "benlubas/molten-nvim",
  lazy = false,
  version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
  build = ":UpdateRemotePlugins",
  force_ft = { "python", "json", "markdown", "quarto" },

  init = function()
    -- vim.g.molten_output_win_max_height = 12
    vim.g.molten_image_provider = "image.nvim"
    vim.g.molten_auto_open_output = false
  end,

  config = function()
    local keymap = vim.keymap.set

    keymap("n", "<leader>mi", function()
      local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
      if venv ~= nil then
        -- in the form of /home/benlubas/.virtualenvs/VENV_NAME
        venv = string.match(venv, "/.+/(.+)")
        vim.cmd(("MoltenInit %s"):format(venv))
      else
        vim.cmd("MoltenInit python3")
      end
    end, { desc = "Initialize Molten for python3", silent = true })

    keymap("n", "<leader>me", ":MoltenEvaluateOperator<CR>", { desc = "Molten Evaluate Operator", silent = true })
    keymap("n", "<leader>mo", ":noautocmd MoltenEnterOutput<CR>", { desc = "Molten Open Output Window", silent = true })
    keymap("n", "<leader>mr", ":MoltenReevaluateCell<CR>", { desc = "Molten Re-evaluate Cell", silent = true })
    keymap(
      "v",
      "<leader>mv",
      ":<C-u>MoltenEvaluateVisual<CR>gv",
      { desc = "Molten Execute Visual Selection", silent = true }
    )
    keymap("n", "<leader>mh", ":MoltenHideOutput<CR>", { desc = "Molten Close Output Window", silent = true })
    keymap("n", "<leader>md", ":MoltenDelete<CR>", { desc = "Molten Delete Molten Cell", silent = true })

    keymap("n", "<leader>vib", function()
      local start_line = vim.fn.search("^```python\\s*$", "bnW")
      local end_line = vim.fn.search("^```\\s*$", "nW")

      if start_line > 0 and end_line > start_line + 1 then
        vim.api.nvim_win_set_cursor(0, { start_line + 1, 0 })

        vim.cmd("normal! V")

        vim.api.nvim_win_set_cursor(0, { end_line - 1, 0 })
      else
        print("No Python code block found.")
      end
    end, { desc = "Select Iinside Python Code Block" })

    -- if work with html outputs:
    keymap("n", "<leader>mx", ":MoltenOpenInBrowser<CR>", { desc = "open output in browser", silent = true })
  end,
}
