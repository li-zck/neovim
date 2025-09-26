return {
  -- use a dummy plugin or create a local plugin spec
  "nvim-lua/plenary.nvim", -- use an existing plugin as base

  name = "floatterminal",
  config = function()
    vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

    local state = { win = nil, buf = nil }

    local function create_floating_window(opts)
      opts = opts or {}
      local width = opts.width or math.floor(vim.o.columns * 0.8)
      local height = opts.height or math.floor(vim.o.lines * 0.8)
      local col = math.floor((vim.o.columns - width) / 2)
      local row = math.floor((vim.o.lines - height) / 2)

      -- re-create buffer if valid, else create new
      local buf = (opts.buf and vim.api.nvim_buf_is_valid(opts.buf)) and opts.buf
        or vim.api.nvim_create_buf(false, true)

      -- define window configuration
      local win_opts = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        col = col,
        row = row,
        style = "minimal", -- no borders or extras UI elements
        border = "rounded",
      })

      -- vim.bo[buf].bufhidden = "hide"
      -- vim.bo[buf].buflisted = false

      -- create the floating window
      if vim.bo[buf].buftype ~= "terminal" then
        -- state.job = vim.fn.jobstart(vim.o.shell, { term = true })
        vim.cmd("terminal")
      end

      local function hide_if_valid()
        if win_opts and vim.api.nvim_buf_is_valid(win_opts) then
          vim.api.nvim_win_hide(win_opts)
        end
      end

      vim.keymap.set("n", "q", hide_if_valid, { buffer = buf, nowait = true, silent = true })
      vim.keymap.set("n", "q", function()
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, false, true), "n", false)
        hide_if_valid()
      end, { buffer = buf, nowait = true, silent = true })

      -- vim.bo[buf].bufhidden = "hide"

      return win_opts, buf
    end

    local toggle_terminal = function()
      if not (state.win and vim.api.nvim_win_is_valid(state.win)) then
        state.win, state.buf = create_floating_window({ buf = state.buf })
      else
        vim.api.nvim_win_close(state.win, true)
      end
    end

    -- local close_terminal = function()
    --   if state.win and vim.api.nvim_win_is_valid(state.win) then
    --     vim.api.nvim_win_hide(state.win)
    --   end
    -- end

    vim.api.nvim_create_user_command("FloatTerminal", toggle_terminal, {})
    vim.keymap.set({ "n", "t" }, "<leader>tt", toggle_terminal, { desc = "Toggle Floating Terminal" })
  end,
}
