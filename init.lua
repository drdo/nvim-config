require("drdo.packer")

-- disable language provider support (lua and vimscript plugins only)
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0

vim.opt.autoindent = true
vim.opt.clipboard = "unnamedplus" -- Make copy/paste use the system"s clipboard
vim.opt.colorcolumn = { 100 }
vim.opt.completeopt = { "menu", "menuone" ,"preview", "noinsert", "noselect" }
vim.opt.encoding = "utf-8"
vim.opt.formatoptions:remove { "c", "r", "o" }
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.updatetime = 300

vim.g.mapleader = " "
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.cmd("colorscheme vscode")
