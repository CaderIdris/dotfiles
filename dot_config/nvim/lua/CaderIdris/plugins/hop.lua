return {
	{
		"phaazon/hop.nvim",
		config = function()
			require("hop").setup()
		end,
		init = function()
			local wk = require("which-key")
			wk.add(
				{
					{ "<leader>h", group = "Hop" },
					{ "<leader>ha", ":HopAnywhere<CR>", desc = "Hop anywhere" },
					{ "<leader>hl", ":HopLineStart<CR>", desc = "Hop to a line" },
					{ "<leader>hw", ":HopWord<CR>", desc = "Hop to word" },
				}
			)
		end,
		lazy = false
	},
}
