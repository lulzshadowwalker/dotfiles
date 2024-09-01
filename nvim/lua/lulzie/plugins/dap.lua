local dap = require('dap')

require('dap-go').setup()
require('dapui').setup()

require('mason-nvim-dap').setup({
    handlers = {}, -- sets up dap in the predefined manner
  })

require('flutter-tools').setup({
    debugger = {
      run_via_dap = true,
      enabled = true,
      register_configurations = function(_)
        dap.configurations.dart = {}
      end,
    }
  })

-- dapui
local dapui = require('dapui')
dap.listeners.before.attach.dapui_config = dapui.open
dap.listeners.before.launch.dapui_config = dapui.open
dap.listeners.before.event_terminated.dapui_config = dapui.close
dap.listeners.before.event_exited.dapui_config = dapui.close

-- keymaps
vim.keymap.set('n', '<Leader>dt', dap.toggle_breakpoint)
vim.keymap.set('n', '<Leader>dv', dap.step_over)
vim.keymap.set('n', '<Leader>dc', dap.continue)
vim.keymap.set('n', '<Leader>di', dap.step_into)
vim.keymap.set('n', '<Leader>do', dap.step_out)

local widgets = require('dap.ui.widgets')
vim.keymap.set({'n', 'v'}, '<Leader>dh', widgets.hover)
vim.keymap.set({'n', 'v'}, '<Leader>dp', widgets.preview)

vim.keymap.set('n', '<Leader>ds', function()
  widgets.centered_float(widgets.scopes)
end)
