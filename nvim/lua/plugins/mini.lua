return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.statusline").setup({
			content = {
				active = function()
					local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
					local git = MiniStatusline.section_git({ trunc_width = 75 })
					local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
					local filename = MiniStatusline.section_filename({ trunc_width = 140 })
					local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })

					return MiniStatusline.combine_groups({
						{ hl = mode_hl, strings = { mode } },
						{ hl = "MiniStatuslineDevinfo", strings = { git, diagnostics } },
						"%<", -- truncation point
						{ hl = "MiniStatuslineFilename", strings = { filename } },
						"%=", -- right align
						{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
					})
				end,
			},
			use_icons = false, -- no nerdfont needed
		})

		require("mini.splitjoin").setup({
			mappings = {
				-- toggle = "gS", -- same muscle memory as splitjoin.vim
				split = "gS", -- disable separate split/join if you only want toggle
				join = "gJ",
			},
		})
	end,
}
