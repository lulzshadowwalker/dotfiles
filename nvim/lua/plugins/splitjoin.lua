-- gS to split a one-liner into multiple lines
-- gJ (with the cursor on the first line of a block) to join a block into a single-line statement.

return {
  "AndrewRadev/splitjoin.vim",
  event = "VeryLazy",
  config = function()
    vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
    vim.g.splitjoin_trailing_comma = 1
    vim.g.splitjoin_php_method_chain_full = 1
  end,
}
