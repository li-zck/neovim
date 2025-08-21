return {
  "GCBallesteros/jupytext.nvim",
  lazy = false,
  config = function()
    require("jupytext").setup({
      style = "quarto",
      output_extension = "qmd",
      extension = "qmd",
      force_ft = "quarto",
    })
  end,
}
