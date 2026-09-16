return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			preset = "helix",
			win = {
				padding = { 0, 2 },
				width = 35,
				title_pos = "left",
			},
			col = 1,
			layout = {
				width = { max = 20 }, -- min and max width of the columns
				spacing = 0, -- spacing between columns
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps",
			},
		},
	},
}
