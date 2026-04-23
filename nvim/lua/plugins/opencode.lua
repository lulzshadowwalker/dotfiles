return {
	"nickjvandyke/opencode.nvim",
	version = "*", -- Latest stable release
	config = function()
		vim.o.autoread = true -- Required for `opts.events.reload`

		vim.keymap.set({ "n", "x" }, "<leader>oa", function()
			require("opencode").ask("@this: ", { submit = true })
		end, { desc = "[o]pencode [a]sk" })

		vim.keymap.set({ "n", "x" }, "<leader>ox", function()
			require("opencode").select()
		end, { desc = "[o]pencode e[x]ecute" })

		vim.keymap.set({ "x" }, "<leader>os", function()
			return require("opencode").operator("@this ")
		end, { desc = "[o]pencode [s]elect - Add range to opencode", expr = true })
	end,
}
