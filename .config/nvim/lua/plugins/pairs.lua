return {
	{
		"nvim-mini/mini.pairs",
		version = false,
		opts = {
			modes = { insert = true, command = false, terminal = false },
			mappings = {
				["("] = false,
				["["] = false,
				["{"] = false,

				[")"] = { action = "close", pair = "()", neigh_pattern = "^[^\\]" },
				["]"] = { action = "close", pair = "[]", neigh_pattern = "^[^\\]" },
				["}"] = { action = "close", pair = "{}", neigh_pattern = "^[^\\]" },
				[">"] = { action = "close", pair = "<>", neigh_pattern = "^[^\\]" },

				['"'] = { action = "close", pair = '""', neigh_pattern = "^[^\\]", register = { cr = false } },
				["'"] = { action = "close", pair = "''", neigh_pattern = "^[^%a\\]", register = { cr = false } },
				["$"] = { action = "close", pair = "$$", neigh_pattern = "^[^\\]", register = { cr = false } },
				["`"] = { action = "close", pair = "``", neigh_pattern = "^[^\\]", register = { cr = false } },
			},
		},
	},
}
