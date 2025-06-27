return {
  -- {
  --   "mrcjkb/rustaceanvim",
  --   version = "^6",
  --   lazy = false,
  --   config = function()
  --     local mason_registry = require("mason-registry")
  --     local codelldb = mason_registry.get_package("codelldb")
  --     local extension_path = codelldb:get_install_path() .. "/extension/"
  --     local codelldb_path = extension_path .. "adapter/codelldb"
  --     local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
  --     local cfg = require("rustaceanvim.config")
  --
  --     vim.g.rustaceanvim = {
  --       dap = {
  --         adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
  --       },
  --     }
  --   end,
  -- },

  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap, dapui = require("dap"), require("dapui")
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

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
  },
}
