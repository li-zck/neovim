return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "catppuccin",
  },
  event = "BufReadPre",
  init = function()
    local ok, bufline = pcall(require, "catppuccin.groups.integrations.bufferline")
    if ok and bufline.get_theme and not bufline.get then
      bufline.get = bufline.get_theme
    end
  end,
  opts = function(_, opts)
    opts = opts or {}
    local ok, bufline = pcall(require, "catppuccin.groups.integrations.bufferline")
    if ok then
      local getter = bufline.get or bufline.get_theme
      if type(getter) == "function" then
        opts.highlights = getter()
      end
    end

    return opts
  end,
}
