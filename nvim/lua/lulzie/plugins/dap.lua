local dap = require('dap')

require('dap-go').setup()
require('dapui').setup()

-- dapui
local dapui = require('dapui')
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
vim.keymap.set('n', '<Leader>dt', dap.toggle_breakpoint)
vim.keymap.set('n', '<Leader>dv', dap.step_over)
vim.keymap.set('n', '<Leader>dc', dap.continue)
vim.keymap.set('n', '<Leader>di', dap.step_into)
vim.keymap.set('n', '<Leader>do', dap.step_out)

local widgets = require('dap.ui.widgets')

vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
  widgets.hover()
end)

vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
  widgets.preview()
end)

vim.keymap.set('n', '<Leader>ds', function()
  widgets.centered_float(widgets.scopes)
end)
