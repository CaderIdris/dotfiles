function all_tests()
	local nt = require("neotest")
	nt.run.run(vim.fn.expand("%"))
end

return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-neotest/neotest-python",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter"
		},
		config = function()
			require("neotest").setup(
				{
					adapters = {
						require("neotest-python")(
							{
								runner="pytest",
								python=".venv/bin/python",
								args = {"--log-level", "DEBUG"}
							}
						)
					}
				}
			)
		end,
		init = function()
			local wk = require("which-key")
			local nt = require("neotest")
			wk.add(
				{
					{ "<Leader>t", group = "Neotest" },
					{ "<Leader>ta", all_tests, desc = "Run all tests" },
					{ "<Leader>tj", nt.run.attach, desc = "Attach to nearest test" },
					{ "<Leader>tr", nt.run.run, desc = "Run single test" },
					{ "<Leader>ts", nt.run.stop, desc = "Stop nearest test" },
				}
			)
		end,
	}
}
