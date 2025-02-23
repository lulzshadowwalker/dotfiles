return {
  "mfussenegger/nvim-dap",
  event = "BufReadPre",
  dependencies = {
    -- 'theHamsta/nvim-dap-virtual-text',
    "nvim-neotest/nvim-nio", --  NOTE: required by nvim-dap-ui
    "rcarriga/nvim-dap-ui",
    "leoluz/nvim-dap-go",
    "williamboman/mason.nvim", --  NOTE: required by mason-nvim-dap
    "jay-babu/mason-nvim-dap.nvim",
    "akinsho/flutter-tools.nvim",
    -- 'nvim-telescope/telescope-dap.nvim',
  },
  config = function()
    local dap = require "dap"
    require("dap-go").setup()
    require("dapui").setup()
    -- dapui
    local dapui = require "dapui"
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
    vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<cr>", { desc = "Dap toggle breakpoint" })
    vim.keymap.set("n", "<Leader>dv", ":DapStepOver<cr>", { desc = "Dap step over" })
    vim.keymap.set("n", "<Leader>dc", ":DapContinue<cr>", { desc = "Dap continue" })
    vim.keymap.set("n", "<Leader>di", ":DapStepInto<cr>", { desc = "Dap step into" })
    vim.keymap.set("n", "<Leader>do", ":DapStepOut<cr>", { desc = "Dap step out" })
    local widgets = require "dap.ui.widgets"
    vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
      widgets.hover()
    end, { desc = "Dap hover" })
    vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
      widgets.preview()
    end, { desc = "Dap preview" })
    vim.keymap.set("n", "<Leader>ds", function()
      widgets.centered_float(widgets.scopes)
    end, { desc = "Dap scopes" })

    require("flutter-tools").setup {
      debugger = {
        run_via_dap = true,
        enabled = true,
        register_configurations = function()
          local dap = require "dap"
          dap.configurations.dart = {} -- Customize if needed
        end,
      },
    }
  end,
}
