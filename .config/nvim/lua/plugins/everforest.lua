return {
	{
		"sainnhe/everforest",
		lazy = false,
		priority = 1000,
		opts = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.everforest_enable_italic = true
			vim.cmd.set("termguicolors")
			vim.cmd.set("background=dark")
			vim.g.everforest_background = "hard"
			vim.g.everforest_better_performance = false
			vim.cmd.colorscheme("everforest")
			vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = "#414B50" })
		end,
	},
}
