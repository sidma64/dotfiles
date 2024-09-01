-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- This needs to be before lazy.nvim setup
-- vim.cmd("nnoremap <SPACE> <Nop>")
vim.g.mapleader = " "

-- Load plugins
require("lazy").setup("plugins")

-- Add settings
require("settings")

-- require("luasnip.loaders.from_vscode").lazy_load()

-- Add keybindings with which-key
require("which-key").register(require("keybindings"))
