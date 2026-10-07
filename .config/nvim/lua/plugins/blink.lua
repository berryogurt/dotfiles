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
			},
			accept = {
				auto_brackets = {
					blocked_filetypes = { "tex", "plaintex" }, -- disable extra {} when completing commands
				},
			},
			menu = {
				enabled = true,
				max_height = 5,
				scrollbar = false,
				draw = {
					snippet_indicator = "",
					columns = { -- this part defines what is in the menu
						{ "kind_icon", gap = 1 },
						{ "label" },
					},
					components = { -- menu options
						label = { -- Define Maximum width and set custom display setting for lsp entries
							width = { max = 20 },
							ellipsis = false,
							text = function(ctx)
								local desc = ctx.label
								if ctx.source_id == "lsp" and string.len(desc) > 20 then
									local len = string.len(desc)
									local ret = (
										string.sub(desc, 1, 3)
										.. "󰇘"
										.. string.sub(desc, math.max(len - 16, 0), len)
									)
									return ret
								else
									return desc
								end
							end,
						},
					},
				},
			},
			ghost_text = { enabled = false },
		},
		-- (Default) list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
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
