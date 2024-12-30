return {
  { "windwp/nvim-autopairs", enabled = false },

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    opts = {
      ensure_installed = { "php", "typescript", "lua", "json", "html", "css", "javascript", "go", "dart", "tsx", "c", "cpp", "vue" },
    },
    config = function ()
      local map = vim.keymap.set
      map("n", "<leader>sc", ":TSContextToggle<CR>", { desc = "[S]itter [C]ontext. Toggle Treesitter sticky context" })
    end,
    dependencies = { "nvim-treesitter/nvim-treesitter-context" },
  },

  -- {
  --   "vyfor/cord.nvim",
  --   build = "./build || .\\build",
  --   event = "VeryLazy",
  --   opts = {}, -- calls require('cord').setup()
  -- },

  {
    "vim-test/vim-test",
    event = "VeryLazy",
  },

  {
    "alvan/vim-closetag",
  },
}
