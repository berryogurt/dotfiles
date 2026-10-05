return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {
					firewall = {
						enabled = true,
					},
				},
			},
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				-- REMEMBER: Add formatters to conform
				"lua_ls", -- lsp: lua
				"stylua", -- fmt: lua
				"bashls", -- lsp: zsh bash
				-- "shfmt", -- fmt: zsh bash
				"jedi_language_server", -- lsp: python
				"yamlls", -- lsp: YAML
				"texlab", -- lsp: latex
				"marksman", -- lsp: markdown
				"matlab_ls", -- lsp: matlab
			},
		},
	},
}
