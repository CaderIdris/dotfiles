return {
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		config = function()
		require("chatgpt").setup(
			{
				api_key_cmd = "pass keys/openai/neovim_chatgpt",
			}
		)
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"folke/trouble.nvim",
			"nvim-telescope/telescope.nvim"
		}
	}
}