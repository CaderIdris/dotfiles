local function map(m, k, v, c)
	s = s or true
	c = c or { silent = true, noremap = true }
	vim.keymap.set(m, k, v, c)
end

local wk = require("which-key")
wk.register(
	{
		["<leader>"] = {
			["<Up>"] = {"zt", "Top of window to cursor"},
			["<Down>"] = {"zb", "Bottom of window to cursor"},
			["<Left>"] = {"zz", "Center of window to cursor"},
			["<Right>"] = {"zz", "Center of window to cursor"},
			x = {
				name = "Diagnostics",
				x = {function() vim.diagnostic.open_float() end, "Issue at cursor"},
				w = {function() vim.diagnostic.setloclist() end, "All issues"},
			}
		}
	}
)
map('n', '<A-J>', ':move +1<CR>')
map('n', '<A-K>', ':move -2<CR>')
map('x', '<A-j>', [[:move '>+1<CR>gv=gv']])
map('x', '<A-K>', [[:move '<-2<CR>gv=gv]])
