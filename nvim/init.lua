-- Leader key
vim.g.mapleader = " "

-- Disable netrw (you already have this)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Default Options
vim.o.syntax = "on"
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.signcolumn = "yes"
vim.o.cursorline = true       -- highlight current line
vim.o.scrolloff = 8           -- keep cursor away from top/bottom edge
vim.o.sidescrolloff = 8
vim.o.wrap = false            -- disable line wrap (optional, but nice for code)

-- Indentation helpers
vim.o.smartindent = true
vim.o.expandtab = false        -- tabs → spaces

-- Searching
vim.o.ignorecase = true       -- case-insensitive by default
vim.o.smartcase = true        -- but case-sensitive if you type caps
vim.o.incsearch = true        -- live searching
vim.o.hlsearch = true         -- highlight matches

-- Clipboard & undo
vim.o.clipboard = "unnamedplus"
vim.o.undofile = true         -- persistent undo

-- Plugin Manager
require("config.lazy")

-- Plugins
require("config.autocmds")
require("config.keymaps")

vim.cmd('set clipboard+=unnamedplus')
vim.cmd('colorscheme tokyonight-storm')
vim.cmd('inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#confirm() : \"<S-Tab>\"')

vim.cmd('nnoremap <C-b> :Telescope find_files<CR>')
