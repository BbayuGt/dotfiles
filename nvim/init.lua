vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Plugin Manager
require("config.lazy")

-- Harpoon
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

-- Plugins

require("autoclose").setup()
require("config.autocmds")
require("cord").setup {
	display = {
		theme = "catppuccin",
		flavor = "accent",	
	},
	text = {
		viewing = "Viewing something 👀",
		editing = "Editing something 👻",

		workspace = "Definitely not doing something stupid😶‍🌫️"
	}
}
require('nvim-highlight-colors').setup({})
require("remote-nvim").setup({})

vim.o.syntax = 'on'
vim.o.number = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

vim.cmd('set clipboard+=unnamedplus')
vim.cmd('colorscheme tokyonight-storm')
vim.cmd('inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#confirm() : \"<S-Tab>\"')

vim.cmd('nnoremap <C-b> :Telescope find_files<CR>')
