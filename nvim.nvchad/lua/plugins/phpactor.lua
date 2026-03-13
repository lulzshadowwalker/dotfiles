return {
  'phpactor/phpactor',
  event = "VeryLazy",
  build = 'composer install --no-dev --optimize-autoloader',
  ft = 'php',
  config = function()
    local map = vim.keymap.set

    map("n", "<Leader>pm", ":PhpactorContextMenu<CR>", { desc = "Phpactor context menu" })
    map("n", "<Leader>pn", ":PhpactorClassNew<CR>", { desc = "Phpactor new class" })
    map("n", "<Leader>pr", ":w<CR>:e<CR>", { desc = "Phpactor save and then reload the file to fix the annoying red squiggly line bug in inteliphense", silent = true }) -- save and then reload the file to fix the annoying red squiggly line bug in inteliphense
  end
}
