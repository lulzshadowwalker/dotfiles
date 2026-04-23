return {
	'sindrets/diffview.nvim',
	config = function () 
		vim.keymap.set('n', '<leader>df', ':DiffviewToggleFiles<CR>', { desc = 'Diffview Toggle Files' })
		vim.keymap.set('n', '<leader>dc', ':DiffviewClose<CR>', { desc = 'Diffview Close' })
		vim.keymap.set('n', '<leader>do', ':DiffviewOpen<CR>', { desc = 'Diffview Open' })
	end
}

