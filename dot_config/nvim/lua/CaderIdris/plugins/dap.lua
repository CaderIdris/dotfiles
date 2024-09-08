return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"mfussenegger/nvim-dap-python",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
		},
		config = function()
			local dap = require("dap")
			local ui = require("dapui")

			ui.setup()
			require("dap-python").setup("~/.local/share/virtualenvs/datblygiad/bin/python")
			require("nvim-dap-virtual-text").setup()
			dap.listeners.before.attach.dapui_config = function()
			ui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
			ui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
			ui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
			ui.close()
			end
		end,
		init = function()
			local wk = require("which-key")
			local dap = require("dap")
			local ui = require("dapui")
			wk.add(
				{
					{ "<Leader>d", group = "Dap me up" },
					{ "<Leader>d<F12>", dap.restart, desc = "Restart" },
					{ "<Leader>d<F1>", dap.continue, desc = "Continue" },
					{ "<Leader>d<F2>", dap.step_into, desc = "Step into" },
					{ "<Leader>d<F3>", dap.step_over, desc = "Step over" },
					{ "<Leader>d<F4>", dap.step_out, desc = "Step out" },
					{ "<Leader>d<F5>", dap.step_back, desc = "Step back" },
					{ "<Leader>d?", function() ui.eval(nil, { enter = true }) end, desc = "Evaluate variable" },
					{ "<Leader>db", dap.toggle_breakpoint, desc = "Toggle breakpoint" },
					{ "<Leader>dr", dap.run_to_cursor, desc = "Run to cursor" },
				}
			)
		end,
	}
}
