-- KEYMAPS
local wk = require("which-key") -- Definining all keymaps with which-key
---@diagnostic disable global: vim

-- Leave Bracket Snippets for LuaSnip
vim.keymap.set("i", "(", "(", { buffer = true })
vim.keymap.set("i", "{", "{", { buffer = true })
vim.keymap.set("i", "[", "[", { buffer = true })
vim.keymap.set("i", '"', '"', { buffer = true })
vim.keymap.set("i", "'", "'", { buffer = true })

-- Move by visual lines unless a count is specified (e.g., 5j moves 5 logical lines)
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true }) -- Apply to normal and select modes ONLY to move up and down regardless of line wrapping
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true }) -- Apply to normal and select modes ONLY to move up and down regardless of line wrapping

-- Esc to stop highlighting searches
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { silent = true })

-- Ctrl + Backspace = delete word
vim.keymap.set("i", "<C-BS>", "<C-w>", { noremap = true })
vim.keymap.set("i", "<C-Del>", "<esc>ldei", { noremap = true })

-- Ctrl + S to save
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { noremap = true }) -- not with esc
vim.keymap.set("i", "<C-s>", "<cmd>w<CR><esc>", { noremap = true }) -- with esc key

-- Shift/Ctrl + Enter to add a new line
vim.keymap.set("i", "<C-CR>", "<esc>o")

-- unmap delete key in normal mode
vim.keymap.set("n", "<Del>", "")

-- Disable q bind
vim.keymap.set("n", "q", "<Nop>", { noremap = true, silent = true })
wk.add({
	{
		"q",
		function()
			if vim.bo.buftype ~= "" or vim.bo.filetype == "help" then
				vim.cmd("close")
			else
				-- Optional fallback behavior for normal file buffers (e.g., feed 'q' to Vim)
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("q", true, false, true), "n", false)
			end
		end,
		desc = "Close Special Window",
	},
})

-- UNDOTREE
wk.add({
	{ "<leader>u", "lua require('undotree').toggle()", desc = "Undotree", icon = { icon = "", color = "grey" } },
})

-- Disable Ctrl + Z
vim.keymap.set("n", "<c-z>", "<nop>", { noremap = true })

-- Reset tab to avoid conflicts with neovim native completion
vim.keymap.del({ "i", "s" }, "<Tab>")
vim.keymap.del({ "i", "s" }, "<S-Tab>")

-- Snacks Notification History
vim.keymap.set("n", "<leader>n", function()
	Snacks.picker.notifications()
end, { desc = "Notification History" })

-- Mason
wk.add({
	{ "<leader>cm", "<cmd>Mason<cr>", desc = "Mason", icon = { icon = "󰘤", color = "red" } },
})

-- Window Navigation up down left right
vim.keymap.set("i", "<c-j>", "<cmd>winc j<cr><esc>", { desc = "Navigate to window above" })
vim.keymap.set("i", "<c-k>", "<cmd>winc k<cr><esc>", { desc = "Navigate to window below" })
vim.keymap.set("i", "<c-l>", "<cmd>winc l<cr><esc>", { desc = "Navigate to left window" })
vim.keymap.set("i", "<c-h>", "<cmd>winc h<cr><esc>", { desc = "Navigate to right window" })
vim.keymap.set("n", "<c-j>", "<cmd>winc j<cr>", { desc = "Navigate to window above" })
vim.keymap.set("n", "<c-k>", "<cmd>winc k<cr>", { desc = "Navigate to window below" })
vim.keymap.set("n", "<c-l>", "<cmd>winc l<cr>", { desc = "Navigate to left window" })
vim.keymap.set("n", "<c-h>", "<cmd>winc h<cr>", { desc = "Navigate to right window" })

-- Window resizing
vim.keymap.set({ "n", "i" }, "<c-up>", "<cmd>res +1<cr>", { desc = "Window height +1" })
vim.keymap.set({ "n", "i" }, "<c-down>", "<cmd>res -1<cr>", { desc = "Window height -1" })
vim.keymap.set({ "n", "i" }, "<c-left>", "<cmd>vert res -1<cr>", { desc = "Window width -1" })
vim.keymap.set({ "n", "i" }, "<c-right>", "<cmd>vert res +1<cr>", { desc = "Window width -1" })

-- Window action binds
vim.keymap.set("n", "<leader>ws", "<cmd>split<cr><cmd>winc J<cr>", { desc = "Split Horizontally" })
vim.keymap.set("n", "<leader>wv", "<cmd>vsplit<cr><cmd>winc L<cr>", { desc = "Split Vertically" })
vim.keymap.set("n", "<leader>wq", "<cmd>q<cr>", { desc = "Close Window" })

-- Buffer maps
vim.keymap.set("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Navigate to right buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Navigate to right buffer" })
vim.keymap.set("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Navigate to left buffer" })
vim.keymap.set("n", "<S-H>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Navigate to left buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete current buffer" })

-- Snacks Picker
vim.keymap.set("n", "<leader>ff", function()
	Snacks.picker.files()
end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", function()
	Snacks.picker.grep()
end, { desc = "Live Grep (cwd)" })
vim.keymap.set("n", "<leader>fr", function()
	Snacks.picker.recent()
end, { desc = "Recent Files" })
vim.keymap.set("n", "<leader>fb", function()
	Snacks.picker.buffers()
end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fe", function()
	Snacks.explorer()
end, { desc = "File Explorer" })
vim.keymap.set("n", "<leader>fc", function()
	Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find Config File" })
vim.keymap.set("n", "<leader>sm", function()
	Snacks.picker.marks()
end, { desc = "Search Marks" })
vim.keymap.set("n", "<leader>z", function()
	Snacks.zen()
end, { desc = "Search Marks" })

-- Trouble diagnostics
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle", { desc = "Diagnostics Toggle" }) -- trouble diagnostics toggle
vim.keymap.set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics" }) -- Buffer Diag
vim.keymap.set("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols Diagnostics" }) -- Toggle diagnostics symbols
vim.keymap.set(
	"n",
	"<leader>xl",
	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
	{ desc = "LSP Definitions / References / ..." }
) -- LSP defns and refs
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List" }) -- Location Diagnostics list
vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List" }) -- QuickFix List

-- WHICHKEY COLORS: `azure`, `blue`, `cyan`, `green`, `grey`, `orange`, `purple`, `red`, `yellow`

-- WhichKey groups
wk.add({
	{
		"<leader>x",
		group = "trouble",
		icon = { icon = "", color = "red", cat = "extension", name = "trouble" },
	},
	{
		"<leader>q",
		group = "session",
		icon = { icon = "", color = "blue", cat = "extension", name = "persistence" },
	},
	{
		"<leader>gh",
		group = "git actions",
		icon = { icon = "", color = "orange", cat = "extension", name = "git" },
	},
	{ "<leader>s", group = "search", icon = { icon = "", color = "purple" } },
	{
		"<leader>f",
		desc = "find",
		icon = { icon = "", color = "yellow" },
	},
	-- commands
	{
		"<leader>c",
		desc = "commands",
		icon = { icon = "", color = "red" },
	},
	{ "<leader>cm", "<cmd>Mason<cr>", desc = "Mason", icon = { icon = "󰘤", color = "red" } }, -- Open Mason
	{ "<leader>cq", "q", desc = "Define Macro", icon = { icon = "", color = "red" } }, -- Define a keymap
	{ "<leader>cl", "<cmd>Lazy<cr>", desc = "Lazy", icon = { icon = "", color = "blue" } }, -- Define a keymap
	{ "<leader>ch", "<cmd>checkhealth<cr>", desc = "Check Health (all)", icon = { icon = "", color = "blue" } }, -- Define a keymap
	--
	-- Buffer keymaps
	{ "<leader>b", desc = "buffer" },
	-- Window keymaps
	{ "<leader>w", desc = "window" },
	{ "<leader>w=", "<cmd>winc =<cr>", desc = "Align Equally" },
})
