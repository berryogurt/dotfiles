return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					-- component_separators = { left = "", right = "" },
					-- section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_c = {
						{
							"filename",
							path = 3,
						},
					},
					lualine_x = {},
				},
			})
			if vim.bo.filetype == "tex" then
				require("lualine").setup({
					sections = {
						lualine_b = {},
					},
				})
			end
		end,
	},
}
