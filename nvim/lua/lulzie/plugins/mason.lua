local mason = require('mason')

mason.setup({
    ensure_installed = {
      'codelldb',
      'bashls',
      'clangd',
      'eslint',
      'eslint_d',
      'lua_ls',
      'gopls',
      'intelephense',
      'prettierd',
      'jsonls',
      'tailwindcss',
      'tsserver',
      'zls',
      'masonlsp',
    }
  })

