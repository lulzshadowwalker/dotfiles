require('ibl').setup({
    exclude = {
      buftypes = { 'terminal', 'NvimTree' },
      filetypes = { 'help', 'terminal', 'dashboard', 'packer', 'lspinfo', 'TelescopePrompt', 'TelescopeResults' }
    },
    scope = {
      enabled = true,
      show_end = true
    }
  })
