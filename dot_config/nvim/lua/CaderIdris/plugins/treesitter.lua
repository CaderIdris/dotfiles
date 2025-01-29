return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = "all",
				highlight = {
					enable = true,
					-- disable = { "html" }
				},
				indent    = {
					enable = true,
					-- disable = { "html" }
				},
			})
			vim.api.nvim_set_hl(0, "@markup.link.latex", {link = "@constant"})
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr   = "nvim_treesitter#foldexpr()"
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {}
	},
	{
		'Wansmer/treesj',
		config = function()
			require('treesj').setup({})
		end,
		init = function()
			local wk = require("which-key")
			wk.add(
				{
					{ "<leader>j", ":TSJToggle<CR>", desc = "Toggle multiline object" },
				}
			)
		end,
	},
}
