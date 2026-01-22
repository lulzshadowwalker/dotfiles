return {
  "tpope/vim-projectionist",
  event = "VeryLazy",
  dependencies = { "tpope/vim-dispatch", lazy = true },
  config = function()
    vim.g.projectionist_heuristics = {
      artisan = {
        ["*"] = {
          start = "php artisan serve",
          console = "php artisan tinker",
        },
        ["app/*.php"] = {
          type = "source",
          alternate = {
            "tests/Unit/{}Test.php",
            "tests/Feature/{}Test.php",
          },
        },
        ["tests/Feature/*Test.php"] = {
          type = "test",
          alternate = "app/{}.php",
        },
        ["tests/Unit/*Test.php"] = {
          type = "test",
          alternate = "app/{}.php",
        },
        ["app/Models/*.php"] = {
          type = "model",
        },
        ["app/Http/Controllers/*.php"] = {
          type = "controller",
        },
        ["routes/*.php"] = {
          type = "route",
        },
        ["database/migrations/*.php"] = {
          type = "migration",
        },
      },

      ["pubspec.yaml"] = {
        ["*"] = {
          start = "dashmon",
          console = "dart run build_runner watch --delete-conflicting-outputs",
        },
        ["lib/*.dart"] = {
          type = "source",
          alternate = "test/{}_test.dart",
        },
        ["test/*_test.dart"] = {
          type = "test",
          alternate = "lib/{}.dart",
        },
      },

      ["vite.config.ts"] = {
        ["*.spec.ts"] = {
          type = "test",
          alternate = "{}.ts",
        },
        ["*.ts"] = {
          type = "source",
          alternate = "{}.spec.ts",
        },
        ["*.spec.js"] = {
          type = "test",
          alternate = "{}.js",
        },
        ["*.js"] = {
          type = "source",
          alternate = "{}.spec.js",
        },
      }
    }

    vim.keymap.set("n", "<leader>a", ":a<CR>", { silent = true })
  end,
}
