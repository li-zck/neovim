local M = {}
local Snacks = require("snacks")

local DEFAULT_FTS = {
  { text = "css" },
  { text = "go" },
  { text = "html" },
  { text = "javascript" },
  { text = "javascriptreact" },
  { text = "typescript" },
  { text = "typescriptreact" },
  { text = "lua" },
  { text = "markdown" },
  { text = "python" },
  { text = "rust" },
  { text = "zig" },
}

local colw = { 0, 0 }

local function strw(s)
  return vim.api.nvim_strwidth(s or "")
end

local function pad_to(s, w)
  s = s or ""
  return s .. string.rep(" ", math.max(0, w - strw(s)))
end

local function update_colw(item)
  colw[1] = math.max(colw[1], strw(item.icon))
  colw[2] = math.max(colw[2], strw(item.name))
end

local function close_open_scratch_windows()
  local list = Snacks.scratch.list()
  if #list == 0 then
    return
  end
  local scratch_files = {}
  for _, it in ipairs(list) do
    if it.file then
      scratch_files[vim.fn.fnamemodify(it.file, ":t")] = true
    end
  end
  pcall(vim.cmd, "stopinsert")
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local name = vim.api.nvim_buf_get_name(buf)
    if name ~= "" and scratch_files[vim.fn.fnamemodify(name, ":t")] then
      pcall(vim.api.nvim_win_close, win, false)
    end
  end
end

local function process_item(item)
  item._path = item.file

  -- local tail = item.file and vim.fn.fnamemodify(item.file, ":t") or ""
  -- item.name = (tail:match("[^|]+$")) or tail or (item.name or "Scratch")
  item.name = "scratch" .. "." .. item.ft

  -- local icon = (Snacks.util and Snacks.util.icon and Snacks.util.icon(item.ft, "filetype")) or ""
  item.icon = item.icon or Snacks.util.icon(item.ft, "filetype")

  update_colw(item)
end

local function process_items(items)
  for _, it in ipairs(items) do
    process_item(it)
  end
end

local function format_item_text(item)
  return pad_to(item.icon, colw[1]) .. " " .. pad_to(item.name, colw[2])
end

function M.select_scratch()
  close_open_scratch_windows()

  local items = Snacks.scratch.list()
  process_items(items)

  Snacks.picker.pick({
    source = "scratch",
    items = items,
    format = "text",
    layout = {
      layout = { title = " Select Scratch Buffer: " },
      preview = true,
      preset = function()
        return vim.o.columns >= 120 and "default" or "vertical"
      end,
    },
    transform = function(item)
      item.text = format_item_text(item)
    end,
    win = { input = { keys = { ["<c-x>"] = { "delete", mode = { "i", "n" } } } } },
    actions = {
      delete = function(picker, item)
        if not item or not item.file then
          return
        end
        pcall(os.remove, item.file)
        picker:close()

        close_open_scratch_windows()

        M.select_scratch()
      end,
    },

    confirm = function(picker, item)
      if not item then
        return
      end
      picker:close()
      vim.schedule(function()
        Snacks.scratch.open({
          icon = item.icon,
          file = item.file,
          name = item.name,
          ft = item.ft,
          enter = true,
          focus = true,
        })
        vim.cmd("startinsert")
      end)
    end,
  })
end

function M.new_scratch(filetypes)
  close_open_scratch_windows()

  local items = filetypes or DEFAULT_FTS
  Snacks.picker.pick({
    source = "scratch",
    items = items,
    format = "text",
    layout = {
      preset = "vscode",
      preview = true,
      layout = { title = " Select a filetype: " },
    },

    actions = {
      confirm = function(picker, item)
        picker:close()
        vim.schedule(function()
          local shown = picker.items and picker:items() or {}
          if (shown and #shown == 0) and picker.filter and picker:filter().pattern ~= "" then
            Snacks.scratch({ ft = picker:filter().pattern })
          else
            Snacks.scratch({ ft = (item and item.text) or "text" })
          end
        end)
      end,
    },
  })
end

return M
