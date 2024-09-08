return {
	{
	  "folke/which-key.nvim",
	  event = "VeryLazy",
	  opts = {
	  }
	},
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		config = function()
			require("notify").setup(
				{
					 background_colour = "#000000"
				}
			)
		end,

	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("noice").setup(
				{
					routes = {
							{ filter = { event = "msg_show", find = "search hit" }, skip = true },
					},
					cmdline = {
					      view = "cmdline",
					},
				}
			)
		end,
	},
	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		opts = {
			-- options
		},
	},
	{
		"karb94/neoscroll.nvim",
		config = function ()
			require('neoscroll').setup {}
		end,
		lazy = false
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {}
	},
--	{
--	  'stevearc/dressing.nvim',
--	  opts = {},
--	},
--	{
--		"gelguy/wilder.nvim",
--		opts = {
--			modes = {':', '/', '?'}
--		}
--	},
}
