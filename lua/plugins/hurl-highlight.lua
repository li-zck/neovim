return {
  "samueljoli/hurl.nvim",
  config = function()
    require("hurl").setup({
      comment = "#ebc021", -- default => Comment
      method = "#fffc58", -- default => Statement
      url = "#fffc58", -- default => Underlined
      version = "#032ea7", -- default => Statement
      status = "#032ea7", -- default => Number
      section = "#032ea7", -- default => Statement
      operators = "#c592ff", -- default => Operator
      string = "#032ea7", -- default => String
      query = "#d57bff", -- default => Identifier
      filter = "#032ea7", -- default => Operator
      predicate = "#032ea7", -- default => Operator
      template = "#032ea7", -- default => Identifier
      escapeQuote = "#032ea7", -- default => SpecialChar
      escapeNumberSign = "#032ea7", -- default => SpecialChar
    })
  end,
}
