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
      ensure_installed = {
        "php",
        "typescript",
        "lua",
        "json",
        "html",
        "css",
        "javascript",
        "go",
        "dart",
        "tsx",
        "c",
        "cpp",
        "vue",
        "templ",
      },
    },
    config = function()
      local map = vim.keymap.set
      map("n", "<leader>sc", ":TSContextToggle<CR>", { desc = "[S]itter [C]ontext. Toggle Treesitter sticky context" })
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
      {
        "windwp/nvim-ts-autotag",
        event = "BufReadPre", --  NOTE: "For those of you using lazy loading through a plugin manager (like lazy.nvim) lazy loading is not particularly necessary for this plugin. nvim-ts-autotag is efficient in choosing when it needs to load. If you still insist on lazy loading nvim-ts-autotag, then two good events to use are BufReadPre & BufNewFile."
        opts = {
          opts = {
            -- Defaults
            enable_close = true, -- Auto close tags
            enable_rename = true, -- Auto rename pairs of tags
            enable_close_on_slash = false, -- Auto close on trailing </
          },
          -- Also override individual filetype configs, these take priority.
          -- Empty by default, useful if one of the "opts" global settings
          -- doesn't work well in a specific filetype
          per_filetype = {
            -- ["html"] = {
            --   enable_close = false,
            -- },
          },
        },
      },
    },
  },

  {
    "andweeb/presence.nvim",
    event = "VeryLazy",
    opts = {
      main_image = "file",
    },
  },

  {
    "vim-test/vim-test",
    event = "VeryLazy",
  },

  {
    "alvan/vim-closetag",
  },
}
