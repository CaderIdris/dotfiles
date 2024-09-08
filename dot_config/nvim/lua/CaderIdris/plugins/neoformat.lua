return {
	{
		"sbdchd/neoformat",
		init = function()
			local wk = require("which-key")
			wk.add(
				{
					{ "<leader>n", group = "Neoformat" },
					{ "<leader>nf", ":Neoformat<CR>", desc = "Neoformat" },
				}
			)
		end,
	}
}
