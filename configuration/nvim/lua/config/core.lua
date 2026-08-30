local nvim = require("config.nvim")
vim.g["mapleader"] = " "
vim.g["maplocalleader"] = " "
vim["scriptencoding"] = "utf-8"
nvim["options!"](vim.opt, {encoding = "utf-8", fileencoding = "utf-8", number = true, relativenumber = true, cursorline = true, cursorlineopt = "number", tabstop = 2, softtabstop = 2, shiftwidth = 2, expandtab = true, linespace = 2, title = true, autoindent = true, smartindent = true, undodir = (os.getenv("HOME") .. "/.vim/undodir"), undofile = true, incsearch = true, guicursor = "", termguicolors = true, scrolloff = 8, updatetime = 50, backup = false, hlsearch = false, swapfile = false, wrap = false})
vim.opt.isfname:append("@-@")
nvim["mappings!"]({{"n", "<ScrollWheelUp>", "k", {noremap = true, silent = true}}, {"n", "<ScrollWheelDown>", "j", {noremap = true, silent = true}}, {"n", "<ScrollWheelLeft>", "h", {noremap = true, silent = true}}, {"n", "<ScrollWheelRight>", "l", {noremap = true, silent = true}}})
return vim.diagnostic.config({virtual_text = true})
