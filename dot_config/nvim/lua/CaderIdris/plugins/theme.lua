local gruvbox_baby_toggle = function()
	vim.g.gruvbox_baby_transparent_mode = not vim.g.gruvbox_baby_transparent_mode
	vim.cmd.colorscheme("gruvbox-baby")
end

return {
	{ "norcalli/nvim-colorizer.lua" },
	{
		'luisiacc/gruvbox-baby',
		lazy = false,
		init = function()
			local wk = require("which-key")
			wk.add(
				{
					{ "<leader>c", group = "Colourscheme" },
					{ "<leader>ct", gruvbox_baby_toggle, desc = "Toggle transparency" },
				}
			)
		end,
		config = function()
			vim.g.gruvbox_baby_background_color = "dark"
			vim.g.gruvbox_baby_transparent_mode = true
			vim.g.gruvbox_baby_telescope_theme = 1
			vim.cmd.colorscheme("gruvbox-baby")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = function(_, opts)
			return require("indent-rainbowline").make_opts(
				opts,
				{
					color_transparency = 0.35,
					colors = { 0xfb4934, 0xfabd2f, 0xd4879c, 0x98971a, 0xb16286, 0xd65d0e, 0x458488 },
				}
			)
		end,
		dependencies = {
			"TheGLander/indent-rainbowline.nvim",
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				icons_enabled = true,
				component_separators = { left = "", right = "" },
				section_separators   = { left = "", right = "" },
				theme = 'gruvbox-baby'
			},
			tabline = { lualine_a = { "tabs" } },
		},
		config = function()
			require("lualine").setup(
				{
					sections = {
						lualine_x = {
							{
								require("noice").api.statusline.mode.get,
								cond = require("noice").api.statusline.mode.has,
								color = { fg = "#ff9e64" },
							},
						},
					},
				}
			)
		end,
	},
}
