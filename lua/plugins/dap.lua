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
      local path = "/Users/lee/.local/share/nvim/mason/packages/debugpy/venv/bin/python3.13"

      require("dap-python").setup(path)
    end,
  },
}
