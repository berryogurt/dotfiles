return {
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		opts = {
			history = true, -- prevent jumping to old snipets
			-- delete_check_events = "TextChanged,InsertLeave",
			-- region_check_events = "InsertEnter",
			update_events = "TextChanged,TextChangedI",
			enable_autosnippets = true,
			fs_event_providers = {
				libuv = true,
			},
		},
		config = function(_, opts)
			require("luasnip").setup(opts)
			require("luasnip.loaders.from_lua").lazy_load({
				paths = vim.fn.stdpath("config") .. "/snippets",
			})
		end,
	},
}
