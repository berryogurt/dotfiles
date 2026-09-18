-- KEYMAPS
local wk = require("which-key") -- Definining all keymaps with which-key
---@diagnostic disable global: vim

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

-- Disable binds NORMAL MODE
wk.add({
	{ "<del>", "<nop>", silent = true, hidden = true },
	{ "<c-z>", "<nop>", silent = true, hidden = true },
	{ "q", "<nop>", silent = true, hidden = true },
	{ "<s-j>", "<nop>", silent = true, hidden = true },
	{ "<s-k>", "<nop>", silent = true, hidden = true },
	{ -- bind q to close window only if it is not a normal buffer window
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
	{
		mode = { "i", "s" },
		{ "<tab>", "<nop>", hidden = true },
		{ "<s-tab>", "<nop>" },
	},
})

-- Window Navigation up down left right
wk.add({
	mode = { "i", "t", "n" },
	{ "<c-j>", "<cmd>winc j<cr><esc>" },
	{ "<c-k>", "<cmd>winc k<cr><esc>" },
	{ "<c-l>", "<cmd>winc l<cr><esc>" },
	{ "<c-h>", "<cmd>winc h<cr><esc>" },
})

-- WHICHKEY COLORS: `azure`, `blue`, `cyan`, `green`, `grey`, `orange`, `purple`, `red`, `yellow`

-- WhichKey groups
wk.add({
	-- WhichKey
	{
		"<leader>?",
		function()
			require("which-key").show({ global = false })
		end,
		desc = "Buffer Local Keymaps",
		icon = { icon = "󰆆 " },
	},
	-- notifications
	{
		"<leader>n",
		function()
			Snacks.picker.notifications()
		end,
		desc = "Notification History",
		icon = { icon = "󰍪 " },
	},
	{
		"<leader>z",
		function()
			Snacks.zen()
		end,
		desc = "Zen Mode",
		icon = { icon = "󰚀 " },
	},
	{ "<leader>u", "lua require('undotree').toggle()", desc = "Undotree", icon = { icon = "󰕌", color = "grey" } },
	--
	--
	--
	--
	-- Trouble
	{
		"<leader>x",
		group = "trouble",
		icon = { icon = "󱖫 ", color = "red" },
	},
	{
		"<leader>xx",
		"<cmd>Trouble diagnostics toggle",
		desc = "Diagnostics Toggle",
		icon = { icon = "󱖫 ", color = "red" },
	},
	{
		"<leader>xX",
		"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
		desc = "Buffer Diagnostics",
		icon = { icon = "󱖫 ", color = "red" },
	},
	{
		"<leader>xs",
		"<cmd>Trouble symbols toggle focus=false<cr>",
		desc = "Symbols Diagnostics",
		icon = { icon = "󱖫 ", color = "red" },
	},
	{
		"<leader>xl",
		"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
		desc = "LSP Definitions / References / ...",
		icon = { icon = "󱖫 ", color = "red" },
	},
	{
		"<leader>xL",
		"<cmd>Trouble loclist toggle<cr>",
		desc = "Location List",
		icon = { icon = "󱖫 ", color = "red" },
	},
	{
		"<leader>xQ",
		"<cmd>Trouble qflist toggle<cr>",
		desc = "Quickfix List",
		icon = { icon = "󱖫 ", color = "red" },
	},
	--
	--
	--
	-- Session
	{
		"<leader>q",
		group = "session",
		icon = { icon = " ", color = "blue", cat = "extension", name = "persistence" },
	},
	{
		"<leader>qs",
		function()
			require("persistence").load()
		end,
		desc = "Restore Session",
	},
	{
		"<leader>qS",
		function()
			require("persistence").select()
		end,
		desc = "Select Session",
	},
	{
		"<leader>ql",
		function()
			require("persistence").load({ last = true })
		end,
		desc = "Restore Last Session",
	},
	{
		"<leader>qd",
		function()
			require("persistence").stop()
		end,
		desc = "Don't Save Current Session",
	},

	--
	--
	--
	-- Git
	{
		"<leader>g",
		desc = "git actions",
		icon = { icon = " ", color = "orange" },
	},
	--
	--
	--
	--
	-- Search
	{ "<leader>s", desc = "search", group = "search", icon = { icon = " " } },
	{
		"<leader>sm",
		function()
			Snacks.picker.marks()
		end,
		desc = "Search Marks",
	},
	--
	--
	--
	--
	-- Find
	{
		"<leader><leader>",
		group = "find",
		icon = { icon = "󱀲 ", color = "yellow" },
	},
	{ "<leader><leader>n", "<cmd>enew<cr>", desc = "New File", icon = { icon = "󰻭 " } },
	{
		"<leader><leader>f",
		function()
			Snacks.picker.files()
		end,
		desc = "Find Files",
		icon = { icon = "󰥩 " },
	},
	{
		"<leader><leader>d",
		function()
			Snacks.picker.files({ cwd = "~/dotfiles/", hidden = true })
		end,
		desc = "Dotfiles",
		icon = { icon = "󱂀 " },
	},
	{
		"<leader><leader>c",
		function()
			Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
		end,
		desc = "Find Config File",
		icon = { icon = "󱂀 " },
	},
	{
		"<leader><leader>e",
		function()
			Snacks.explorer()
		end,
		desc = "File Explorer",
		icon = { icon = "󰷏 " },
	},
	{
		"<leader><leader>r",
		function()
			Snacks.picker.recent()
		end,
		desc = "Recent Files",
		icon = { icon = "󰪻 " },
	},
	{
		"<leader><leader>g",
		function()
			Snacks.picker.grep()
		end,
		desc = "Live Grep",
		icon = { icon = "󰱽 " },
	},
	--
	--
	--
	-- Commands
	{
		"<leader>c",
		group = "commands",
		icon = { icon = "", color = "red" },
	},
	{ "<leader>cm", "<cmd>Mason<cr>", desc = "Mason", icon = { icon = "󰒲 " } }, -- Open Mason
	{ "<leader>cq", "q", desc = "Define Macro" }, -- Define a keymap
	{ "<leader>cl", "<cmd>Lazy<cr>", desc = "Lazy", icon = { icon = "󰒲 " } }, -- Define a keymap
	{ "<leader>ch", "<cmd>checkhealth<cr>", desc = "Check Health (all)", icon = { icon = "󰒲 " } }, -- Define a keymap
	--
	--
	--
	-- Buffer keymaps
	{ "<leader>b", group = "buffer", icon = { icon = "󰓩 " } },
	{ "<leader>bn", "<cmd>enew<cr>", desc = "New Buffer", icon = { icon = "󰝜 " } },
	{ "<leader>bd", "<cmd>bdelete<cr>", desc = "Buffer Delete", icon = { icon = "󰭌 " } },
	{ "<leader>bD", "<cmd>bdelete!<cr>", desc = "Buffer Delete Override", icon = { icon = "󰭌 " } },
	{ "<leader>br", "<cmd>edit!<cr>", desc = "Buffer Reload", icon = { icon = "󰓩 " } },
	{ "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Left Buffer", icon = { icon = "󰌥 " } },
	{ "<s-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Left Buffer", icon = { icon = "󰌥 " } },
	{ "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Right Buffer", icon = { icon = "󰌒 " } },
	{ "<s-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Right Buffer", icon = { icon = "󰌒 " } },
	{
		"<leader>bb",
		function()
			Snacks.picker.buffers()
		end,
		desc = "Buffer Picker",
		icon = { icon = "󰓩 " },
	},
	{ "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close Other Buffers", icon = { icon = "󰭌 " } },
	{
		"<leader>bt",
		"<cmd>terminal<cr>",
		desc = "Open Terminal Buffer",
		icon = { icon = "", color = "red" },
	},
	--
	--
	--
	-- Window keymaps
	{ "<leader>w", group = "window", icon = { icon = " " } },
	{ "<leader>w=", "<cmd>winc =<cr>", desc = "Align Equally" },
	{ "<leader>wq", "<cmd>q<cr>", desc = "Close Window", icon = { icon = " " } },
	--
	--
	--
	-- Terminal
	{
		"<leader>t",
		desc = "terminal",
		icon = { icon = "", color = "red" },
	},
	{ "<esc>", "<c-\\><c-n>", mode = "t", desc = "Escape Terminal", icon = { icon = "", color = "red" } },
	{ "<esc-h>", "<cmd>winc h", mode = "t", desc = "Escape Terminal Left", icon = { icon = "", color = "red" } },
	{
		"<leader>tt",
		"<cmd>vert terminal<cr>",
		desc = "New Terminal",
		icon = { icon = "", color = "red" },
	},
	{
		"<leader>tl",
		"<cmd>vertical botright terminal<cr>",
		desc = "New Left Terminal",
		icon = { icon = "", color = "red" },
	},
	{
		"<leader>tb",
		"<cmd>botright terminal<cr>",
		desc = "New Bottom Terminal",
		icon = { icon = "", color = "red" },
	},
})

-- local function handle_url(link)
--
-- end
