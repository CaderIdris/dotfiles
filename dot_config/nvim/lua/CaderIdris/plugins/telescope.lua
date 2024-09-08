return {
	{
		"nvim-telescope/telescope.nvim",
		lazy = false,
		init = function()
			local wk = require("which-key")
			wk.add(
				{
					{ "<Leader>f", group = "Telescope" },
					{ "<Leader>fc", ":Telescope git_commits<CR>", desc = "Tscope: View git commits" },
					{ "<Leader>ff", ":Telescope find_files<CR>", desc = "Tscope: List files in cwd" },
					{ "<Leader>fg", ":Telescope git_files<CR>", desc = "Tscope: Fuzzy search git files in curent repo" },
					{ "<Leader>fh", ":Telescope command_history<CR>", desc = "Tscope: Search cmd history" },
					{ "<Leader>fk", ":Telescope keymaps<CR>", desc = "Tscope: Keymaps" },
					{ "<Leader>fl", ":Telescope live_grep<CR>", desc = "Tscope: Search files in cwd" },
					{ "<Leader>fm", ":Telescope marks<CR>", desc = "Tscope: View marks" },
					{ "<Leader>fo", ":Telescope oldfiles<CR>", desc = "Tscope: Search file history" },
					{ "<Leader>fr", ":Telescope registers<CR>", desc = "Tscope: View registers" },
					{ "<Leader>fs", ":Telescope grep_string<CR>", desc = "Tscope: Search for selected string in cwd" },
					{ "<Leader>ft", ":Telescope tags<CR>", desc = "Tscope: Search tags" },
					{ "<Leader>fv", ":Telescope vim_options<CR>", desc = "Tscope: Vim options" },
					{ "<Leader>fx", ":Telescope git_branches<CR>", desc = "Tscope: View git branches" },
				}
			)
		end,
		opts = {
			defaults = {
				borderchars = {
					prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
					results = { " " },
					preview = { " " },
				}
			}
		}
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		lazy = false
	},
	{
		"nvim-telescope/telescope-symbols.nvim",
		lazy = false
	}
}
