-- Autoformat
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>fm",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = "",
      desc = "[F]or[M]at buffer",
    },
  },
  ---@module 'conform'
  ---@type conform.setupOpts
  opts = {
    notify_on_error = false,
    formatters = {
      -- foo = {
      --   command = function()
      --     -- 
      --   end,
      --   args = { "--write", "$FILENAME" },
      --   stdin = false,
      -- },
    },

    formatters_by_ft = {
      lua = { "stylua" },
      php = { "pint" },
      blade = { "blade-formatter" },

      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      css = { "prettierd", "prettier", stop_after_first = true },
      html = { "prettierd", "prettier", stop_after_first = true },
      json = { "prettierd", "prettier", stop_after_first = true },
      yaml = { "prettierd", "prettier", stop_after_first = true },
    },
  },
}

-- vim: ts=2 sts=2 sw=2 et
