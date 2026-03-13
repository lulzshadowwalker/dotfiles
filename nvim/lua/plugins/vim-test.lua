return {
	"vim-test/vim-test",
	event = "VeryLazy",
	config = function()
		-- love it.
		vim.keymap.set("n", "<Leader>tn", ":TestNearest<CR>", { desc = "Test Nearest" })
		vim.keymap.set("n", "<Leader>tf", ":TestFile<CR>", { desc = "Test File" })
		vim.keymap.set("n", "<Leader>ts", ":TestSuite<CR>", { desc = "Test Suite" })
		vim.keymap.set("n", "<Leader>tl", ":TestLast<CR>", { desc = "Test Last" })
		vim.keymap.set("n", "<Leader>tv", ":TestVisit<CR>", { desc = "Test Visit" })
	end,
}
