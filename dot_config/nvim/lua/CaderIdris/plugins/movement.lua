return {
	{
		"smoka7/hop.nvim",
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
					{ "<leader>hn", ":HopNodes<CR>", desc = "Hop to node" },
					{ "<leader>hy", ":HopYankChar1<CR>", desc = "Yank between" },
					{ "<leader>hp", ":HopPaste<CR>", desc = "Paste at" },
				}
			)
		end,
		lazy = false
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("harpoon").setup()
		end,
		init = function()
			local wk = require("which-key")
			local harpoon = require("harpoon")
			wk.add(
				{
					{ "<leader>q", group = "Harpoon" },
					{ "<leader>qq", function() harpoon:list():add() end, desc = "Add to Harpoon" },
					{ "<leader>ql", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Show menu" },
				}
			)
		end,
	}
}
