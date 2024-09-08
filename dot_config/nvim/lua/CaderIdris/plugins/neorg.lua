return {
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true
	},
	{
		"pysan3/pathlib.nvim"
	},
	{
		"nvim-neorg/neorg",
		dependencies = { "luarocks.nvim" },
		lazy = false,
		version = "*",
		config = function()
		require("neorg").setup {
			load = {
				["core.defaults"] = {}, -- Loads default behaviour
				["core.completion"] = {
						config = {
							engine = "nvim-cmp"
						}
					}, -- Completion behaviour
				["core.concealer"] = {}, -- Adds pretty icons to your documents
				["core.summary"] = {
						config = {

						}
					}, -- Generate a summary
				["core.dirman"] = { -- Manages Neorg workspaces
					config = {
						workspaces = {
							general = "~/Notes/General",
							work = "~/Notes/Work",
							phd = "~/Notes/PhD",
						},
						default_workspace = "phd"
						},
					},
				},
			}
		end,
	}
}
