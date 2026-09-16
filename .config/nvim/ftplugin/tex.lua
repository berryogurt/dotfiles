local wk = require("which-key") -- Definining all keymaps with which-key
wk.add({
	{
		"<localleader>",
		group = "vimtex",
		icon = { icon = "", color = "green", cat = "extension", name = "vimtex" },
	},
})

vim.opt.timeoutlen = 3000
-- vim.keymap.set("i", "<S-BS>", "<esc>I")
-- vim.keymap.set("i", "<S-CR>", "<esc>A")
--
vim.keymap.set("i", "$", "$", { buffer = true })
vim.keymap.set("n", "S", "", { buffer = true })
pcall(vim.keymap.del, "n", "&") -- Add ampersand insertion shortcut
vim.keymap.set("n", "&", "i&<esc>", { buffer = true })

-- Normal Mode
wk.add({
	-- <localleader>
	{ "<localleader>a", "<plug>(vimtex-context-menu)", desc = "Context Menu" },
	{ "<localleader>c", "<plug>(vimtex-clean)", desc = "Clean" },
	{ "<localleader>C", "<plug>(vimtex-clean-full)", desc = "Clean Full" },
	{ "<localleader>e", "<plug>(vimtex-errors)", desc = "Errors" },
	{ "<localleader>g", "<plug>(vimtex-status)", desc = "Status" },
	{ "<localleader>G", "<plug>(vimtex-status-all)", desc = "Status All" },
	{ "<localleader>i", "<plug>(vimtex-info)", desc = "Info" },
	{ "<localleader>I", "<plug>(vimtex-info-full)", desc = "Info Full" },
	{ "<localleader>k", "<plug>(vimtex-stop)", desc = "Stop" },
	{ "<localleader>K", "<plug>(vimtex-stop-all)", desc = "Stop All" },
	{ "<localleader>l", "<plug>(vimtex-compile)", desc = "Compile" },
	{ "<localleader>L", "<plug>(vimtex-compile-selected)", desc = "Compile Selected" },
	{ "<localleader>o", "<plug>(vimtex-compile-output)", desc = "Compile Output" },
	{ "<localleader>q", "<plug>(vimtex-log)", desc = "Log" },
	{ "<localleader>s", "<plug>(vimtex-toggle-main)", desc = "Toggle Main" },
	{ "<localleader>S", "<plug>(vimtex-compile-ss)", desc = "Compile SS" },
	{ "<localleader>t", "<plug>(vimtex-toc-open)", desc = "Toc Open" },
	{ "<localleader>T", "<plug>(vimtex-toc-toggle)", desc = "ToC Toggle" },
	{ "<localleader>v", "<plug>(vimtex-view)", desc = "View" },
	{ "<localleader>x", "<plug>(vimtex-reload)", desc = "Reload" },
	{ "<localleader>X", "<plug>(vimtex-reload-state)", desc = "Reload State" },
	--
	--
	--
	{ "tsm", "<plug>(vimtex-env-toggle-math)", desc = "Toggle Math Environment" },
	{ "csm", "<plug>(vimtex-env-change-math)", desc = "Change Math Environment" },
	{ "dsm", "<plug>(vimtex-env-delete-math)", desc = "Delete Math Environment" },
	{ "tss", "<plug>(vimtex-env-change-math)", desc = "Toggle Star Environment" },
})

-- Visual and Operator Pending Mode
wk.add({
	buffer = true,
	remap = true,
	mode = { "x", "o" },
	{ "im", "<plug>(vimtex-i$)", desc = "inside math" },
	{ "am", "<plug>(vimtex-a$)", desc = "around math" },
	{ "ae", "<plug>(vimtex-ae)", desc = "outside environment" },
	{ "ie", "<plug>(vimtex-ie)", desc = "inside environment" },
})
