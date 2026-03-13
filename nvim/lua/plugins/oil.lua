return {
	"stevearc/oil.nvim",
	lazy = false, -- load at startup so it can be your default explorer
	keys = {
		{ "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
		{ "<leader>-", "<cmd>Oil --float<cr>", desc = "Open oil (float)" },
	},
	opts = {
		default_file_explorer = true, -- replaces netrw
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		view_options = {
			show_hidden = true, -- toggle with `g.`
		},
		float = {
			padding = 4,
			max_width = 80,
			max_height = 30,
		},
		keymaps = {
			["<CR>"] = "actions.select",
			["-"] = "actions.parent", -- go up a dir
			["_"] = "actions.open_cwd", -- jump to cwd
			["`"] = "actions.cd", -- :cd to current dir
			["gs"] = "actions.change_sort",
			["g."] = "actions.toggle_hidden",
			["g?"] = "actions.show_help",
			["gx"] = "actions.open_external",
			["<C-p>"] = "actions.preview",
			["q"] = "actions.close",
		},
		use_default_keymaps = false, -- only use what you defined above
	},
}
