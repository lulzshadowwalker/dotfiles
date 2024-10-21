return {
    'github/copilot.vim',
    event = 'VeryLazy',
    config = function()
        vim.g.copilot_no_tab_map = true
        vim.keymap.set("i", "<C-J>", 'copilot#Accept("<CR>")', {
            noremap = true,
            silent = true,
            expr = true,
            desc = "Copilot Accept Suggestion",
            replace_keycodes = false,
        })
    end
}
