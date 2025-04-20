-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

--  NOTE: For Templ
--  "The templ command must be in your system path for the LSP to be able to start. Ensure that you can run it from the command line before continuing."

local servers = {
  "html",
  "cssls",
  "intelephense",
  "ts_ls",
  "gopls",
  "clangd",
  "tailwindcss",
  "volar",
  "templ",
  "htmx",
  "jsonls",
  "dartls",
  "zls",
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  local config = {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }

  if lsp == "htmx" or lsp == "html" then
    config.filetypes = { "html", "templ" }
  end

  lspconfig[lsp].setup(config)
end

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
