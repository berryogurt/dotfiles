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
				"stylua",
				-- "shfmt",
				"yamlls",
				"texlab",
				"lua_ls",
				"matlab_ls",
			},
		},
	},
}
