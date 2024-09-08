return {
	{
		"michaelrommel/nvim-silicon",
		lazy = true,
		cmd = "Silicon",
		config = function()
			require("silicon").setup({
				-- Configuration here, or leave empty to use defaults
				font = "JetBrainsMono Nerd Font=34;Twemoji=34",
				theme = "gruvbox-dark",
			})
		end,
		init = function()
			local wk = require("which-key")
			wk.add(
				{
					{ "<leader>S", group = "Silicon" },
					{ "<leader>Sc", ":Silicon<CR>", desc = "Take Snapshot" },
				}
			)
		end,
	}
}
