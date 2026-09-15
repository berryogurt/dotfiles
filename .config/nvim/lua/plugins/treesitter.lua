return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "markdown", "lua", "regex", "bash" },
			-- ignore_install = { "latex" },
			highlight = {
				enable = true, -- Use TreeSitter for highlighting
				-- This is the "magic" line: disable standard Vim syntax
				-- to let TreeSitter take full control.
				disable = { "latex" },
				additional_vim_regex_highlighting = false,
			},
		},
	},
}
