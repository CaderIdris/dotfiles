return {
	{
		"tpope/vim-repeat",
		lazy = false
	},
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {}
	}
}
