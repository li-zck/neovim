return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      local keymap = vim.keymap.set

      dapui.setup()

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      -- keymaps
      keymap("n", "<leader>di", "<cmd>lua require('dap').step_into()<CR>", { desc = "Debugger step into" })
      keymap("n", "<leader>dj", "<cmd>lua require('dap').step_over()<CR>", { desc = "Debugger step over" })
      keymap("n", "<leader>dk", "<cmd>lua require('dap').step_out()<CR>", { desc = "Debugger step out" })
      keymap("n", "<leader>dc", "<cmd>lua require('dap').continue()<CR>", { desc = "Debugger continue" })
      keymap(
        "n",
        "<leader>db",
        "<cmd>lua require('dap').toggle_breakpoint()<CR>",
        { desc = "Debugger toggle breakpoint" }
      )

      -- custom: set conditional breakpoint
      keymap(
        "n",
        "<leader>dd",
        "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
        { desc = "Debugger set conditional breakpoint" }
      )

      keymap("n", "<leader>de", "<cmd>lua require('dap').terminate()<CR>", { desc = "Debugger reset" })
      keymap("n", "<leader>dr", "<cmd>lua require('dap').run_last()<CR>", { desc = "Debugger run last" })

      -- DAP PYTHON --
      keymap("n", "<leader>dpr", "<cmd>lua require('dap-python').test_method()<CR>", { desc = "DAP Python Test" })
    end,
  },

  -- NVIM DAP UI --
  {
    "rcarriga/nvim-dap-ui",
  },

  -- NVIM NIO --
  {
    "nvim-neotest/nvim-nio",
  },

  -- NVIM DAP VIRTUAL TEXT --
  {
    "theHamsta/nvim-dap-virtual-text",
    opt = {},
  },

  -- NVIM DAP PYTHON --
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "/Users/lee/.local/share/nvim/mason/packages/debugpy/venv/bin/python3"

      require("dap-python").setup(path)
    end,
  },
}
