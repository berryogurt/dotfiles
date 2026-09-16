vim.opt.tabstop = 2 -- how wide a tab character appears
vim.opt.shiftwidth = 2 -- how wide >> and auto-indent use
vim.opt.expandtab = true -- insert spaces instead of tab characters
vim.opt.number = true -- show line numbers
vim.opt.clipboard = "unnamedplus" -- sync clipboards on PC with Neovim
vim.opt.fillchars = { eob = " " } -- change sign for lines beyond the end of buffer
vim.opt_global.ignorecase = true -- Search ignores case completely
vim.opt_global.smartcase = true -- Search ignores case only if all letters are lowercase (requires previous option)
vim.opt.relativenumber = false -- show true row number on the left side instead of relative numbers
vim.opt.cursorline = true -- highlight cursor line
vim.opt.termguicolors = true -- bufferline dependency
vim.opt.wrap = true -- wrap text
vim.opt.linebreak = true -- enable line breaking on work boundaries
vim.opt.scrolloff = 14 -- Minimum lines to keep visible
vim.opt.breakindent = true -- preserves indentation upon ine breaks
vim.opt.conceallevel = 2 -- conceal to enable math symbols

-- Undo History
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"

-- Enable list mode to show the characters
vim.opt.list = true
-- Define the characters
vim.opt.listchars = {
	tab = "▎ ",
	trail = "·",
	nbsp = "␣",
	extends = "❯",
	precedes = "❮",
}

-- Set diagnostic settings to display in buffer
vim.diagnostic.config({
	virtual_text = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚",
			[vim.diagnostic.severity.WARN] = "󰀪",
			[vim.diagnostic.severity.INFO] = "󰋽",
			[vim.diagnostic.severity.HINT] = "󰌶",
		},
	},
	underline = true,
	update_in_insert = false,
})

-- SET HIGHLIGHT COLOR FOR BLINK.CMP
vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = "#414B50" })
