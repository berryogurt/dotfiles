return {
	"saghen/blink.cmp",
	version = "1.*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		--
		-- All presets have the following mappings:
		-- C-space: Open menu or open docs if already open
		-- C-n/C-p or Up/Down: Select next/previous item
		-- C-e: Hide menu
		-- C-k: Toggle signature help (if signature.enabled = true)
		--
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = { preset = "enter" },

		-- (Default) Only show the documentation popup when manually triggered
		completion = {
			documentation = { auto_show = false },
			list = {
				selection = {
					preselect = true,
					auto_insert = false,
				},
				max_items = 4,
			},
			ghost_text = { enabled = false },
		},
		-- (Default) list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "snippets" }, -- { "lsp", "path", "snippets", "buffer" },
			per_filetype = {
				tex = { "snippets", "lsp", "path" },
			},
		},
		snippets = { preset = "luasnip" },
		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		-- You may use a lua implementation instead by using `implementation = "lua"`
		-- See the fuzzy documentation for more information
		fuzzy = { implementation = "rust" },
	},
}
