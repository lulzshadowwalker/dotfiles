-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- lspconfigname => masonpackagename
local servers = {
  intelephense = "intelephense",
  html = "html-lsp",
  cssls = "css-lsp",
  ts_ls = "typescript-language-server",
  tailwindcss = "tailwindcss-language-server",
  jsonls = "json-lsp",
  dartls = nil, -- comes bundled with dart sdk
  emmet_language_server = "emmet-ls"
}
local nvlsp = require "nvchad.configs.lspconfig"

local mason_api = require "mason.api.command"
local mason_registry = require "mason-registry"

-- uninstalled mason packages
local mason_packages = vim.tbl_filter(function(pkg)
  if pkg == nil then 
    return false
  end

  return not mason_registry.is_installed(pkg)
end, vim.tbl_values(servers))

if #mason_packages > 0 then
  mason_api.MasonInstall(mason_packages)
end

for lsp, _ in pairs(servers) do
    lspconfig[lsp].setup {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    }
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
