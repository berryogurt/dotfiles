return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			mode = "buffers",
			diagnostics = "nvim_lsp", -- show LSP diagnostics in bufferline
			show_buffer_close_icons = true,
			show_close_icon = false,
			always_show_bufferline = false,
		},
	},
}
