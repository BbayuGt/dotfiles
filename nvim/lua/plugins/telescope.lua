return {
  'nvim-telescope/telescope.nvim', branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', function()
      local initial_path = vim.fn.argv(0)
      local current_working_dir = vim.loop.cwd()
      print("Telescope debug: argv(0) = " .. initial_path)
      print("Telescope debug: vim.loop.cwd() = " .. current_working_dir)

      if initial_path ~= "" and vim.fn.isdirectory(initial_path) == 1 then
        telescope.find_files({ cwd = initial_path })
      else
        telescope.find_files({ cwd = current_working_dir })
      end
    end, { desc = 'Find files (project root)' })
    vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'Live Grep' })
    vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'Find Buffers' })
    vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = 'Help Tags' })
	require("telescope").setup({
		defaults = {
			mappings = {
				i = {
					["<esc>"] = require('telescope.actions').close,
				}
			}
		}
	})
  end
}
