return {
	{
		"preservim/tagbar",
		init = function()
			local wk = require("which-key")
			wk.add(
				{
					{ "<leader>b", ":TagbarToggle<CR>", desc = "Toggle Tagbar" },
				}
			)
		end,
		lazy = false
	}
}
