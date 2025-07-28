return {
  "zbirenbaum/copilot.lua",
  opts = {
    panel = {
      enabled = false,
    },
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = "<Tab>",
        accept_word = "<C-l>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<M-\\>",
      },
    },
    filetypes = {
      ["*"] = true,
    },
  },
}
