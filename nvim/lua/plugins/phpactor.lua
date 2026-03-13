return {
  'phpactor/phpactor',
  event = "VeryLazy",
  build = 'composer install --no-dev --optimize-autoloader',
  ft = 'php',
  config = function()
    vim.keymap.set("n", "<Leader>pm", ":PhpactorContextMenu<CR>", { desc = "Phpactor context menu" })
    vim.keymap.set("n", "<Leader>pn", ":PhpactorClassNew<CR>", { desc = "Phpactor new class" })
    vim.keymap.set("n", "<Leader>pr", ":w<CR>:e<CR>", { desc = "Phpactor save and then reload the file to fix the annoying red squiggly line bug in inteliphense", silent = true }) -- save and then reload the file to fix the annoying red squiggly line bug in inteliphense
  end
}

