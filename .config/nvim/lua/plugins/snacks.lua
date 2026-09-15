return {
	{
		"folke/snacks.nvim",
		priority = 1000, -- load with high priority before other plugins
		lazy = false, -- load with high priority over other plugins
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			bigfile = { enabled = true },
			dashboard = {
				preset = {
					header = table.concat({
						[[                                                                     ]],
						[[       ████ ██████           █████      ██                     ]],
						[[      ███████████             █████                             ]],
						[[      █████████ ███████████████████ ███   ███████████   ]],
						[[     █████████  ███    █████████████ █████ ██████████████   ]],
						[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
						[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
						[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
						[[                                                                       ]],
					}, "\n"),
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "v", desc = "View Sessions", action = function() require("persistence").select() end  },
          { icon = " ", key = "s", desc = "Restore Last Session", action = function() require("persistence").load({ last = true }) end  },
          -- { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
				},
				sections = {
					{ section = "header" },
					{ icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 2 },
					{ section = "keys", gap = 1, padding = 1 },
				},
			},
			explorer = { enabled = true },
			indent = { enabled = true },
			notify = { enabled = true },
			notifier = {
				enabled = true,
			},
			input = { enabled = true },
			picker = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			-- scroll = { enabled = false },
			statuscolumn = { enabled = true },
			words = { enabled = true },
		},
	},
}
