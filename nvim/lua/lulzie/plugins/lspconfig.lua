-- Setup Mason to automatically install LSP servers
require('mason').setup()
require('mason-lspconfig').setup({ automatic_installation = true })

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- PHP
require('lspconfig').intelephense.setup({ capabilities = capabilities })

-- Golang 
require('lspconfig').gopls.setup({ capabilities = capabilities })

-- Tailwind CSS
require('lspconfig').tailwindcss.setup({ capabilities = capabilities })

-- Typescript
require('lspconfig').tsserver.setup({ capabilities = capabilities })

-- ESLint
require('lspconfig').eslint.setup({ capabilities = capabilities })

-- JSON
require('lspconfig').jsonls.setup({
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  },
})

-- null-ls
require('null-ls').setup({
  sources = {
    require('null-ls').builtins.diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),
    require('null-ls').builtins.diagnostics.trail_space.with({ disabled_filetypes = { 'NvimTree' } }),
    require('null-ls').builtins.formatting.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file({ '.eslintrc.js' })
      end,
    }),
    require('null-ls').builtins.formatting.prettierd,
  },
})

require('mason-null-ls').setup({ automatic_installation = true })

-- Keymaps
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.keymap.set('n', 'gi', ':Telescope lsp_implementations<CR>', opts)
vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>', opts)
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.keymap.set('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
vim.keymap.set('n', '<Leader>bs', ':Telescope lsp_document_symbols<CR>', opts) -- [b]uffer [s]ymbols
vim.keymap.set('n', '<Leader>bf', ':Format<CR>', opts) -- [b]uffer [f]ormat
vim.keymap.set('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>', opts) -- [c]ode [a]ction

-- Commands
vim.api.nvim_create_user_command('Format', function() vim.lsp.buf.format({ timeout_ms = 5000 }) end, {})

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = false,
  float = {
    source = true,
  }
})

-- Sign configuration
vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', texthl = 'DiagnosticSignHint' })
