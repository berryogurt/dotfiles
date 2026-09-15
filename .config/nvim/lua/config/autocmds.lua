-- LSP Formatting on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- Create function for snippet reloading
vim.api.nvim_create_user_command("LuaSnipLoad", function()
	require("luasnip.loaders.from_lua").load({ paths = vim.fn.stdpath("config") .. "/snippets", priority = 5000 })
	vim.notify("Snippets loaded!")
end, {})
-- Automatic snippet reload
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*/snippets/**.lua",
	command = "LuaSnipLoad",
})

-- Define tex open function
local tex = function()
	vim.opt.timeoutlen = 3000
	-- vim.keymap.set("i", "<S-BS>", "<esc>I")
	-- vim.keymap.set("i", "<S-CR>", "<esc>A")
	vim.keymap.set("i", "(", "(", { buffer = true })
	vim.keymap.set("i", "{", "{", { buffer = true })
	vim.keymap.set("i", "[", "[", { buffer = true })
	vim.keymap.set("i", '"', '"', { buffer = true })
	vim.keymap.set("i", "$", "$", { buffer = true })
	vim.keymap.set("i", "'", "'", { buffer = true })
	vim.keymap.set("n", "S", "", { buffer = true })
	pcall(vim.keymap.del, "n", "&") -- Add ampersand insertion shortcut
	vim.keymap.set("n", "&", "i&<esc>", { buffer = true })
end
-- Set auto command
vim.api.nvim_create_autocmd("Filetype", { pattern = "tex", callback = tex })
