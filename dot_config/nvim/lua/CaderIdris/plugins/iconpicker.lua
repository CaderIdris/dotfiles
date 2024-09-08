return {
	{
	    "ziontee113/icon-picker.nvim",
		init = function()
			local wk = require("which-key")
			wk.add(
				{
					{ "<leader>i", group = "Icon Picker" },
					{ "<leader>ie", ":IconPickerNormal<CR>", desc = "Add emoji" },
				}
			)
		end,
		config = function()
			require("icon-picker").setup({ disable_legacy_commands = true })
		end
	}
}
