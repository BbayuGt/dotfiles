return {
		'nvim-telescope/telescope.nvim', branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
				local telescope = require('telescope.builtin')
				local initial_path = vim.fn.argv(0)
				local current_working_dir = vim.loop.cwd()
				print("Telescope debug: argv(0) = " .. initial_path)
				print("Telescope debug: vim.loop.cwd() = " .. current_working_dir)

				if initial_path ~= "" and vim.fn.isdirectory(initial_path) == 1 then
						vim.cmd('cd ' .. initial_path)
				end

				vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'Live Grep' })
				vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'Find Buffers' })
				vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = 'Help Tags' })
				vim.keymap.set('n', '<leader>b', telescope.find_files, { desc = 'Find Files' })
				require("telescope").setup({
						defaults = {
								preview = {
										treesitter = false
								},
								mappings = {
										i = {
												["<esc>"] = require('telescope.actions').close,
										}
								}
						}
				})
		end
}
