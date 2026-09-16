return {
	"lervag/vimtex",
	lazy = false, -- we don't want to lazy load VimTeX
	-- tag = "v2.15", -- uncomment to pin to a specific release
	init = function()
		-- VimTeX configuration goes here, e.g.
		vim.g.vimtex_view_method = "zathura_simple"
		vim.g.vimtex_toc_config = {
			split_width = 30,
		}

		vim.g.vimtex_indent_enabled = 1 -- disable because latexindent is used
		vim.g.vimtex_indent_on_ampersands = 0
		vim.g.vimtex_mappings_enabled = 1
		vim.g.vimtex_complete_enabled = 0
		vim.g.vimtex_imaps_enabled = 0
		vim.g.vimtex_mappings_override_existing = 0
		vim.g.vimtex_mappings_prefix = "<localleader>"

		-- keybindings are in /ftplugin/tex.lua

		vim.cmd([[
	     let g:vimtex_env_toggle_math_map = {
	         \ '$': '\[',
	         \ '\[': 'align',
	         \ 'align' : 'equation',
	         \ 'equation': '$',
	         \}]])
		vim.cmd("let g:vimtex_quickfix_ignore_filters = ['Label(s) may have changed']")
		vim.g.vimtex_mappings_disable = { ["n"] = { "K" } }
		-- disable `K` as it conflicts with LSP hover
		vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
	end,
}
