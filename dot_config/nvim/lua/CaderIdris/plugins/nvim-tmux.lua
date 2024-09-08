return {
	{
		'numToStr/Navigator.nvim',
		config = function()
			require('Navigator').setup(
				{
					auto_save = 'current',
					disable_on_zoom = true
				}
			)
		end,
		init = function()
			local wk = require("which-key")
			wk.add(
				{
					{ "<A-h>", ":NavigatorLeft<CR>", desc = "Navigate Left" },
					{ "<A-j>", ":NavigatorDown<CR>", desc = "Navigate Down" },
					{ "<A-k>", ":NavigatorUp<CR>", desc = "Navigate Up" },
					{ "<A-l>", ":NavigatorRight<CR>", desc = "Navigate Right" },
				}
			)
		end,
	},
}
