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
